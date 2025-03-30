package com.example.constructionxpert.Model;

public class Resource {
    private int resourceId;
    private String resourceName;
    private String type;
    private String supplier;
    private int quantity;

    public Resource() {
    }

    public Resource(String resourceName, String type, String supplier, int quantity) {
        this.resourceName = resourceName;
        this.type = type;
        this.supplier = supplier;
        this.quantity = quantity;
    }

    public Resource(int resourceId, String resourceName) {
        this.resourceId = resourceId;
        this.resourceName = resourceName;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}