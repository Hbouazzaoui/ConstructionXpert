package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    public void insertTask(Task task) {
        String checkProjectSql = "SELECT project_id FROM project WHERE project_id = ?";
        String insertSql = "INSERT INTO tasks (project_id, description, start_date, end_date, resources) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement checkStmt = connection.prepareStatement(checkProjectSql)) {

            checkStmt.setInt(1, task.getProject_id());
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                throw new RuntimeException("Project ID " + task.getProject_id() + " does not exist.");
            }

            try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                insertStmt.setInt(1, task.getProject_id());
                insertStmt.setString(2, task.getDescription());
                insertStmt.setString(3, task.getStart_date());
                insertStmt.setString(4, task.getEnd_date());
                insertStmt.setString(5, task.getResources());
                insertStmt.executeUpdate();
                System.out.println("Task inserted successfully!");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Task getTasks(int task_id) {
        Task task = null;
        String select = "SELECT * FROM tasks WHERE task_id = ?";
        try (PreparedStatement preparedStatement = Connectiondb.getConnection().prepareStatement(select)) {
            preparedStatement.setInt(1, task_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                task = new Task(
                        resultSet.getInt("task_id"),
                        resultSet.getInt("project_id"),
                        resultSet.getString("description"),
                        resultSet.getString("start_date"),
                        resultSet.getString("end_date"),
                        resultSet.getString("resources")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return task;
    }

    public List<Task> getTasksByProjectId(int project_id) {
        List<Task> tasks = new ArrayList<>();
        try {
            String sql = "SELECT * FROM tasks WHERE project_id = ?";
            PreparedStatement stmt = Connectiondb.getConnection().prepareStatement(sql);
            stmt.setInt(1, project_id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Task task = new Task(
                        rs.getInt("task_id"),
                        project_id,
                        rs.getString("description"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getString("resources")
                );
                tasks.add(task);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tasks;
    }

    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET description = ?, start_date = ?, end_date = ?, resources = ? WHERE task_id = ?";
        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setString(2, task.getStart_date());
            stmt.setString(3, task.getEnd_date());
            stmt.setString(4, task.getResources());
            stmt.setInt(5, task.getTaskId());

            stmt.executeUpdate();
            System.out.println("Task updated successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}