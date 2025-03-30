package com.example.constructionxpert.DAO;

import com.example.constructionxpert.Model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.example.constructionxpert.ConnectionDB.Connectiondb.getConnection;

public class UserDao {
    public User getUserByUsername(String username) {
        User user = null;
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String dbUsername = rs.getString("username");
                String password = rs.getString("password");
                user = new User(id, dbUsername, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}