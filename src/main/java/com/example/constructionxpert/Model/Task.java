package com.example.constructionxpert.Model;

public class Task {
    private int task_id;

    private String description;
    private String start_date;
    private String end_date;
    private String resources;
    private int  project_id;

    public Task(int task_id, String description, String start_date, String end_date, String resources, int project_id) {
        this.task_id = task_id;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
        this.resources = resources;
        this.project_id = project_id;
    }

    public Task() {

    }

    public Task(int taskId, int projectId, String description, String startDate, String endDate, String resources) {



    }

    public int getTask_id() {
        return task_id;
    }

    public void setTask_id(int task_id) {
        this.task_id = task_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public String getResources() {
        return resources;
    }

    public void setResources(String resources) {
        this.resources = resources;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }
}
