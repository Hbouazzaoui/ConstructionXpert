package com.example.constructionxpert.DAO;

import com.example.constructionxpert.ConnectionDB.Connectiondb;
import com.example.constructionxpert.Model.Resource;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDao {
    private Connection connection;

    public ResourceDao() {
        connection = Connectiondb.getConnection();
        try {
            Statement statement = connection.createStatement();

            // Create the 'resource' table
            String createResourceTable = "CREATE TABLE IF NOT EXISTS resource (" +
                    "resourceId INT AUTO_INCREMENT PRIMARY KEY," +
                    "name VARCHAR(100) NOT NULL," +
                    "type VARCHAR(100) NOT NULL," +
                    "supplier VARCHAR(100) NOT NULL," +
                    "quantity INT NOT NULL" +
                    ")";
            statement.executeUpdate(createResourceTable);
            System.out.println("Table 'resource' created successfully (if it didn't exist).");

            // Create the 'resource_task' table with correct foreign key references
            String createResourceTaskTable = "CREATE TABLE IF NOT EXISTS resource_task (" +
                    "id INT AUTO_INCREMENT PRIMARY KEY," +
                    "task_id INT NOT NULL," +
                    "resourceId INT NOT NULL," +
                    "quantity INT NOT NULL," +
                    "FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE," +
                    "FOREIGN KEY (resourceId) REFERENCES resource(resourceId) ON DELETE CASCADE" +
                    ")";
            statement.executeUpdate(createResourceTaskTable);
            System.out.println("Table 'resource_task' created successfully (if it didn't exist).");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing database tables", e);
        }
    }

    public void insertResource(Resource resource) {
        String sql = "INSERT INTO resource (name, type, supplier, quantity) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, resource.getResourceName());
            statement.setString(2, resource.getType());
            statement.setString(3, resource.getSupplier());
            statement.setInt(4, resource.getQuantity());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error inserting the resource", e);
        }
    }

    public void updateResource(Resource resource) {
        String sql = "UPDATE resource SET name = ?, type = ?, supplier = ?, quantity = ? WHERE resourceId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, resource.getResourceName());
            preparedStatement.setString(2, resource.getType());
            preparedStatement.setString(3, resource.getSupplier());
            preparedStatement.setInt(4, resource.getQuantity());
            preparedStatement.setInt(5, resource.getResourceId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error updating the resource", e);
        }
    }

    public List<Resource> getAllResources() {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT * FROM resource";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resourceId"));
                resource.setResourceName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setSupplier(rs.getString("supplier"));
                resource.setQuantity(rs.getInt("quantity"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving resources", e);
        }
        return resources;
    }

    public void assignResourceToTask(int taskId, int resourceId, int quantity) {
        String insertSql = "INSERT INTO resource_task (task_id, resourceId, quantity) VALUES (?, ?, ?)";
        String updateSql = "UPDATE resource SET quantity = quantity - ? WHERE resourceId = ?";

        try (PreparedStatement insertStmt = connection.prepareStatement(insertSql);
             PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {

            insertStmt.setInt(1, taskId);
            insertStmt.setInt(2, resourceId);
            insertStmt.setInt(3, quantity);
            insertStmt.executeUpdate();

            updateStmt.setInt(1, quantity);
            updateStmt.setInt(2, resourceId);
            updateStmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error assigning resource to task", e);
        }
    }

    public List<Resource> getResourcesByTaskId(int taskId) {
        List<Resource> resources = new ArrayList<>();
        String sql = "SELECT r.*, rt.quantity AS assigned_quantity " +
                "FROM resource r " +
                "JOIN resource_task rt ON r.resourceId = rt.resourceId " +
                "WHERE rt.task_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, taskId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Resource resource = new Resource();
                resource.setResourceId(rs.getInt("resourceId"));
                resource.setResourceName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setSupplier(rs.getString("supplier"));
                resource.setQuantity(rs.getInt("quantity"));
                resources.add(resource);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving resources", e);
        }
        return resources;
    }

    public void deleteResource(int resourceId) {
        String sql = "DELETE FROM resource WHERE resourceId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, resourceId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error deleting resource", e);
        }
    }

    public Resource getResourceById(int resourceId) {
        Resource resource = null;
        String sql = "SELECT * FROM resource WHERE resourceId = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, resourceId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                resource = new Resource();
                resource.setResourceId(rs.getInt("resourceId"));
                resource.setResourceName(rs.getString("name"));
                resource.setType(rs.getString("type"));
                resource.setSupplier(rs.getString("supplier"));
                resource.setQuantity(rs.getInt("quantity"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error retrieving resource by ID", e);
        }
        return resource;
    }
}