package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.ProjectDAO;
import com.example.constructionxpert.DAO.TaskDAO;
import com.example.constructionxpert.Model.Project;
import com.example.constructionxpert.Model.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/task")
public class TaskServlet extends HttpServlet {

    private TaskDAO taskDAO;
    private ProjectDAO projectDAO;

    @Override
    public void init() {

        projectDAO = new ProjectDAO();
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "listTasks";
        }

        switch (action) {
            case "add":
                addTask(req, resp);
                break;
            case "update":
                updateTask(req, resp);
                break;
            case "delete":
                deleteTask(req, resp);
                break;
            case "listTasks":
                listTasks(req, resp);
                break;
            default:
                listTasks(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private void addTask(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int project_id = Integer.parseInt(req.getParameter("project_id"));
        String description = req.getParameter("description");
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");
        Task task = new Task(project_id,description,startDate,endDate);

        taskDAO.insertTask(task);

        resp.sendRedirect("task?action=listTasks");
    }


    private void listTasks(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Task> tasks = taskDAO.getALLTasks();
        List<Project> projects = projectDAO.getAllProjects();
        req.setAttribute("tasks", tasks);
        req.setAttribute("projects", projects);
        RequestDispatcher dispatcher = req.getRequestDispatcher("task.jsp");
        dispatcher.forward(req, resp);
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int task_id = Integer.parseInt(request.getParameter("task_id"));
        int project_id = Integer.parseInt(request.getParameter("project_id"));
        String description = request.getParameter("description");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String resources = request.getParameter("resources");

        Task task = new Task(task_id,project_id,description, startDate, endDate, resources);
        taskDAO.updateTask(task);

        response.sendRedirect(request.getContextPath() + "/task?action=listTask");
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int task_id = Integer.parseInt(request.getParameter("task_id"));
        taskDAO.deleteTask(task_id);
        response.sendRedirect(request.getContextPath() + "/task?action=listTask");
    }
}