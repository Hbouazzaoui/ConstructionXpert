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
            case "add":
                addTask(req, resp);
                break;
            case "update":
                updateTask(req, resp);
                break;
            case "newTask":
                showNewTaskForm(req, resp);
                break;
            case "edit":
                showEditTaskForm(req, resp);
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
        String resources = req.getParameter("resources");

        Task task = new Task();
        task.setProject_id(project_id);
        task.setDescription(description);
        task.setStart_date(startDate);
        task.setEnd_date(endDate);
        task.setResources(resources);

        taskDAO.insertTask(task);

        resp.sendRedirect("task?action=listTasks");
    }

    private void listTasks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Task> tasks = taskDAO.getALLTasks();
            request.setAttribute("tasks", tasks);

            RequestDispatcher dispatcher = request.getRequestDispatcher("task.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error listing tasks: " + e.getMessage());
        }
    }

    private void showNewTaskForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectIdParam = request.getParameter("project_id");

        if (projectIdParam == null || projectIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Project ID is required.");
            return;
        }

        try {
            int projectId = Integer.parseInt(projectIdParam);
            request.setAttribute("project_id", projectId);
            request.getRequestDispatcher("task.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Project ID.");
        }
    }

    private void showEditTaskForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdParam = request.getParameter("task_id");

        if (taskIdParam == null || taskIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID is required.");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdParam);
            Task task = taskDAO.getTasks(taskId);
            request.setAttribute("task", task);
            request.getRequestDispatcher("task.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID.");
        }
    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taskIdParam = request.getParameter("task_id");
        String projectIdParam = request.getParameter("project_id");

        if (taskIdParam == null || taskIdParam.isEmpty() || projectIdParam == null || projectIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID and Project ID are required.");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdParam);
            int projectId = Integer.parseInt(projectIdParam);
            String description = request.getParameter("description");
            String startDate = request.getParameter("start_date");
            String endDate = request.getParameter("end_date");
            String resources = request.getParameter("resources");

            Task task = new Task(taskId, projectId, description, startDate, endDate, resources);
            taskDAO.updateTask(task);
            response.sendRedirect("task?action=listTasks&project_id=" + projectId);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID or Project ID.");
        }
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taskIdParam = request.getParameter("task_id");
        String projectIdParam = request.getParameter("project_id");

        if (taskIdParam == null || taskIdParam.isEmpty() || projectIdParam == null || projectIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Task ID and Project ID are required.");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdParam);
            int projectId = Integer.parseInt(projectIdParam);
            taskDAO.deleteTask(taskId);
            response.sendRedirect("task?action=listTasks&project_id=" + projectId);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Task ID or Project ID.");
        }
    }
}