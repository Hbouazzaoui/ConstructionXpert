package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {

    public void createTableProject() {
        String sql = "CREATE TABLE IF NOT EXISTS project (" +
                "project_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "name VARCHAR(100) NOT NULL, " +
                "description TEXT NOT NULL, " +
                "start_date DATE NOT NULL, " +
                "end_date DATE NOT NULL, " +
                "budget DECIMAL(15,2) NOT NULL" +
                ")";

        try (Connection connection = Connectiondb.getConnection();
             Statement statement = connection.createStatement()) {

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
            ps.setString(3, project.getStart_date());
            ps.setString(4, project.getEnd_date());
            ps.setDouble(5, project.getBudget());

            ps.executeUpdate();
            System.out.println("Project inserted successfully!");

        } catch (SQLException e) {
            System.err.println("Error inserting project: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Retrieve all projects
    public List<Project> getAllProjects() {
        List<Project> projects = new ArrayList<>();
        String sql = "SELECT * FROM project";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Project project = new Project();
                project.setProject_id(resultSet.getInt("project_id"));
                project.setName(resultSet.getString("name"));
                project.setDescription(resultSet.getString("description"));
                project.setStart_date(resultSet.getString("start_date"));
                project.setEnd_date(resultSet.getString("end_date"));  // Fixed this line
                project.setBudget(resultSet.getFloat("budget"));

                projects.add(project);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching projects: " + e.getMessage());
            e.printStackTrace();
        }
        return projects;
    }

    // Retrieve a project by ID
    public Project getProject(int projectId) {
        Project project = null;
        String sql = "SELECT * FROM project WHERE project_id = ?";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, projectId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    project = new Project(
                            resultSet.getInt("project_id"),
                            resultSet.getString("name"),
                            resultSet.getString("description"),
                            resultSet.getString("start_date"),
                            resultSet.getString("end_date"),
                            resultSet.getFloat("budget")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving project: " + e.getMessage());
            e.printStackTrace();
        }
        return project;
    }

    // Update Project
    public void updateProject(Project project) {
        String sql = "UPDATE project SET name=?, description=?, start_date=?, end_date=?, budget=? WHERE project_id=?";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, project.getName());
            preparedStatement.setString(2, project.getDescription());
            preparedStatement.setString(3, project.getStart_date());
            preparedStatement.setString(4, project.getEnd_date());
            preparedStatement.setDouble(5, project.getBudget());
            preparedStatement.setInt(6, project.getProject_id());

            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Project updated successfully!");
            } else {
                System.out.println("No project found with ID: " + project.getProject_id());
            }
        } catch (SQLException e) {
            System.err.println("Error updating project: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Delete a project by ID
    public void deleteProject(int projectId) {
        String sql = "DELETE FROM project WHERE project_id = ?";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, projectId);
            int rowsDeleted = preparedStatement.executeUpdate();
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



