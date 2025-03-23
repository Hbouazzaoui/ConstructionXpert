package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.TaskDAO;
import com.example.constructionxpert.Model.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/task")
public class TaskServlet extends HttpServlet {

    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "listTasks";
        }

        switch (action) {
            case "newTask":
                showNewTaskForm(req, resp);
                break;
            case "edit":
                showEditTaskForm(req, resp);
                break;
            case "delete":
                break;
            case "listTasks":
            default:
                listTasks(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        switch (action) {
            case "add":
                addTask(req, resp);
                break;
            case "update":
                updateTask(req, resp);
                break;
            default:
                listTasks(req, resp);
                break;
        }
    }

    private void listTasks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdParam = request.getParameter("project_id");

        if (projectIdParam == null || projectIdParam.isEmpty()) {
            // Handle missing project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required.");
            return;
        }

        try {
            int projectId = Integer.parseInt(projectIdParam);
            List<Task> tasks = taskDAO.getTasksByProjectId(projectId);
            request.setAttribute("tasks", tasks); // Corrected attribute name
            request.setAttribute("project_id", projectId); // Pass project_id to the JSP
            request.getRequestDispatcher("task.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Project ID.");
        }
    }

    private void showNewTaskForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdParam = request.getParameter("project_id");

        if (projectIdParam == null || projectIdParam.isEmpty()) {
            // Handle missing project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required.");
            return;
        }

        try {
            int projectId = Integer.parseInt(projectIdParam);
            request.setAttribute("project_id", projectId);
            request.getRequestDispatcher("addTask.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Project ID.");
        }
    }

    private void showEditTaskForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdParam = request.getParameter("task_id");

        if (taskIdParam == null || taskIdParam.isEmpty()) {
            // Handle missing task_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID is required.");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdParam);
            Task task = taskDAO.getTasks(taskId);
            request.setAttribute("task", task);
            request.getRequestDispatcher("editTask.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Handle invalid task_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID.");
        }
    }

    private void addTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String projectIdParam = request.getParameter("project_id");

        if (projectIdParam == null || projectIdParam.isEmpty()) {
            // Handle missing project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required.");
            return;
        }

        try {
            int projectId = Integer.parseInt(projectIdParam);
            String description = request.getParameter("description");
            String startDate = request.getParameter("start_date");
            String endDate = request.getParameter("end_date");
            String resources = request.getParameter("resources");

            Task task = new Task(1, projectId, description, startDate, endDate, resources);
            taskDAO.insertTask(task);
            response.sendRedirect("task?action=listTasks&project_id=" + projectId); // Corrected redirect URL
        } catch (NumberFormatException e) {
            // Handle invalid project_id parameter
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Project ID.");
        }
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taskIdParam = request.getParameter("task_id");
        String projectIdParam = request.getParameter("project_id");

        if (taskIdParam == null || taskIdParam.isEmpty() || projectIdParam == null || projectIdParam.isEmpty()) {
            // Handle missing parameters
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID and Project ID are required.");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdParam); // Corrected typo
            int projectId = Integer.parseInt(projectIdParam);
            String description = request.getParameter("description");
            String startDate = request.getParameter("start_date");
            String endDate = request.getParameter("end_date");
            String resources = request.getParameter("resources");

            Task task = new Task(taskId, projectId, description, startDate, endDate, resources);
            taskDAO.updateTask(task);
            response.sendRedirect("task?action=listTasks&project_id=" + projectId);
        } catch (NumberFormatException e) {
            // Handle invalid parameters
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID or Project ID.");
        }
    }


}