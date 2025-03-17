package com.example.constructionxpert.Model;

import java.util.Date;

public class Task {
    private int taskId;
    private String description;
    private Date startDate ;
    private Date endDate;


    public Task(int taskId, String description, Date startDate, Date endDate) {
        this.taskId = taskId;
        this.description = description;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}
