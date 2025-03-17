package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Project;

import java.sql.*;

public class UserDAO {

    public void CreateTableProject(){
        try (Connection connection = Connectiondb.getConnection();)
        {
            Statement statement = connection.createStatement();
            String sql = "CREATE TABLE IF NOT EXISTS project (" +
                    "project_id INT PRIMARY KEY AUTO_INCREMENT, " +
                    "name VARCHAR(100) NOT NULL, " +
                    "description TEXT NOT NULL, " +
                    "start_date DATE NOT NULL, " +
                    "end_date DATE NOT NULL, " +
                    "budget DECIMAL(15,2) NOT NULL" +
                    ")";

            statement.executeUpdate(sql);
            System.out.println("Tables Project created successfully!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertProject(Project project){
        String sql = "INSERT INTO project (name, description, start_date, end_date, budget) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = Connectiondb.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql)){
            ps.setString(1,project.getName());
            ps.setString(2,project.getDescription());
            ps.setDate(3,project.getStartDate());
            ps.setDate(4,project.getEndDate());
            ps.setDouble(5,project.getBudget());

            ps.executeUpdate();
            System.out.println("Project inserted successfully!");


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
