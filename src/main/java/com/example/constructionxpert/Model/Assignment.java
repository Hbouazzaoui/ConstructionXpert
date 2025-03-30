package com.example.constructionxpert.Model;

public class Assignment {
    private int id;
    private int taskId;
    private int resourceId;
    private int quantity;
    private String resourceName; // For display purposes
    private String resourceType;

    public Assignment(int id, int taskId, int resourceId, int quantity, String resourceName, String resourceType) {
        this.id = id;
        this.taskId = taskId;
        this.resourceId = resourceId;
        this.quantity = quantity;
        this.resourceName = resourceName;
        this.resourceType = resourceType;
    }

    public Assignment() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }
}
