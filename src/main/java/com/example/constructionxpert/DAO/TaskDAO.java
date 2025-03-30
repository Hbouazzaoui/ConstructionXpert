package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Project;
import com.example.constructionxpert.Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {
    private ProjectDAO projectDAO;
    public void insertTask(Task task) {
        String insertSql = "INSERT INTO tasks (project_id ,description, start_date, end_date) VALUES (?,?, ?, ?)";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
            insertStmt.setInt(1, task.getProject_id());
            insertStmt.setString(2, task.getDescription());
            insertStmt.setString(3, task.getStart_date());
            insertStmt.setString(4, task.getEnd_date());

            insertStmt.executeUpdate();
            System.out.println("Task inserted successfully!");
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

    public Task getTasks(int task_id) {
        Task task = null;
        String select = "SELECT t.*, p.name FROM tasks t " +
                "LEFT JOIN project p ON t.project_id = p.project_id " +
                "WHERE t.task_id = ?";
        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(select)) {
            preparedStatement.setInt(1, task_id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                task = new Task(
                        rs.getInt("task_id"),
                        rs.getString("description"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getInt("project_id")
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return task;
    }

    public List<Task> getALLTasks() {
        List<Task> tasks = new ArrayList<>();
        String sql = "SELECT t.*, p.name FROM tasks t " +
                "LEFT JOIN project p ON t.project_id = p.project_id";


        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Task task = new Task(
                        rs.getInt("task_id"),
                        rs.getString("description"),
                        rs.getString("start_date"),
                        rs.getString("end_date"),
                        rs.getInt("project_id")
                );
                tasks.add(task);
            }
        } catch (SQLException e) {
            System.err.println("Error fetching tasks: " + e.getMessage());
        }

        return tasks;
    }

    public void updateTask(Task task) {
        String sql = "UPDATE tasks SET description = ?, start_date = ?, end_date = ?, project_id = ? WHERE task_id = ?";
        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setString(2, task.getStart_date());
            stmt.setString(3, task.getEnd_date());
            stmt.setInt(4, task.getProject_id());
            stmt.setInt(5, task.getTask_id());
            stmt.executeUpdate();
            System.out.println("Task updated successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteTask(int task_id) {
        String sql = "DELETE FROM tasks WHERE task_id = ?";
        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setInt(1, task_id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}