package com.example.constructionxpert.Model;

public class Task {
    private int task_id;
    private String description;
    private String start_date;
    private String end_date;
    private int  project_id;
    public Task(int project_id, String description, String startDate, String endDate) {
        this.project_id=project_id;
        this.description=description;
        this.start_date=startDate;
        this.end_date=endDate;


    }
    public Task(int task_id, String description, String start_date, String end_date, int project_id)
    {
        this.task_id = task_id;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
        this.project_id = project_id;
    }

    public Task(int task_id, int project_id, String description, String startDate, String endDate, String resources) {


    }

    public Task() {


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

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }
}
