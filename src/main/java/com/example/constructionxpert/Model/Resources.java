package com.example.constructionxpert.Model;

public class Resources {
    private int resourceId;
    private String name ;
    private String type ;
    private int quantity;

    public Resources(int resourceId, String name, String type, int quantity) {
        this.resourceId = resourceId;
        this.name = name;
        this.type = type;
        this.quantity = quantity;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
