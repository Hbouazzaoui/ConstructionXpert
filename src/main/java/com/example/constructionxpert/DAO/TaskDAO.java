package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {

    public void insertTask(Task task) {
        String sql = "INSERT INTO task (description,startDate,endDate,),VALUES ( ?, ?, ?)";


        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, task.getDescription());
            stmt.setDate(2, new java.sql.Date(task.getStartDate().getTime()));
            stmt.setDate(3, new java.sql.Date(task.getEndDate().getTime()));

            stmt.executeUpdate();
            System.out.println("Task inserted successfully!");

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Task> getAllTasks() {
        List<Task> tasks = new ArrayList<>();
        String quer = "SELECT * FROM task";

        try (Connection connection = Connectiondb.getConnection();
             PreparedStatement prs = connection.prepareStatement(quer);
             ResultSet resultSet = prs.executeQuery()) {
            while (resultSet.next()) {
                Task task = new Task(
                resultSet.getInt("taskId"),
                resultSet.getString("description"),
                resultSet.getDate("startDate"),
                resultSet.getDate("endDate"));
                tasks.add(task);
            }


        } catch (SQLException e) {
            System.err.println("Error fetching projects: " + e.getMessage());
            e.printStackTrace();
        }
        return tasks;
    }

}
