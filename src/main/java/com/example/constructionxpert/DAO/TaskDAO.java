package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    public void insertTask(Task task) {
        String sql = "INSERT INTO tasks (project_id, description, start_date, end_date, resources) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1,task.getProject_id());
            stmt.setString(2, task.getDescription());
            stmt.setString(3, task.getStart_date());
            stmt.setString(4,task.getEnd_date());
            stmt.setString(5,task.getResources());

            stmt.executeUpdate();
            System.out.println("Task inserted successfully!");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
                        rs.getInt("project_id"),
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

}
