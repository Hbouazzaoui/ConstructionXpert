package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    public void CreateTableProject() {
        try (Connection connection = Connectiondb.getConnection();
             Statement statement = connection.createStatement()) {

            String sql = "CREATE TABLE IF NOT EXISTS project (" +
                    "project_id INT AUTO_INCREMENT PRIMARY KEY, " +
                    "name VARCHAR(100) NOT NULL, " +
                    "description TEXT NOT NULL, " +
                    "start_date DATE NOT NULL, " +
                    "end_date DATE NOT NULL, " +
                    "budget DECIMAL(15,2) NOT NULL" +
                    ")";

            statement.executeUpdate(sql);
            System.out.println("Table 'project' created successfully!");

        } catch (SQLException e) {
            System.err.println("Error creating project table: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void insertProject(Project project) {
        String sql = "INSERT INTO project (name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setDate(3, project.getStartDate());
            ps.setDate(4, project.getEndDate());
            ps.setDouble(5, project.getBudget());

            ps.executeUpdate();
            System.out.println("Project inserted successfully!");

        } catch (SQLException e) {
            System.err.println("Error inserting project: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Read all projects
    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM project";

        try (Connection connection = Connectiondb.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Project project = new Project(
                        resultSet.getInt("project_id"),
                        resultSet.getString("name"),
                        resultSet.getString("description"),
                        resultSet.getDate("start_date"),
                        resultSet.getDate("end_date"),
                        resultSet.getDouble("budget")
                );
                projects.add(project);
            }

        } catch (SQLException e) {
            System.err.println("Error fetching projects: " + e.getMessage());
            e.printStackTrace();
        }
        return projects;
    }

    // Update Project
    public void updateProject(Project project) {
        String sql = "UPDATE projects SET name=?, description=?, start_date=?, end_date=?, budget=? WHERE project_id=?";

        try (Connection conn = Connectiondb.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, project.getName());
            stmt.setString(2, project.getDescription());
            stmt.setDate(3, new java.sql.Date(project.getStartDate().getTime()));
            stmt.setDate(4, new java.sql.Date(project.getEndDate().getTime()));
            stmt.setDouble(5, project.getBudget());
            stmt.setInt(6, project.getProjectId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a project
    public void deleteProject(int projectId) {
        String sql = "DELETE FROM project WHERE project_id=?";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, projectId);
            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                System.out.println("Project deleted successfully!");
            } else {
                System.out.println("No project found with ID: " + projectId);
            }

        } catch (SQLException e) {
            System.err.println("Error deleting project: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
