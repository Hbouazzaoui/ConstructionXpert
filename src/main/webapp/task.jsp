<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Task" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Task List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Task List</h2>
    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addTaskModal">
        + Add Task
    </button>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Project ID</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Resources</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Task> tasks = (List<Task>) request.getAttribute("tasks");
            if (tasks != null && !tasks.isEmpty()) {
                for (Task task : tasks) {
        %>
        <tr>
            <td><%= task.getProject_id() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getStart_date() %></td>
            <td><%= task.getEnd_date() %></td>
            <td><%= task.getResources() %></td>
            <td>
                <a href="task?action=edit&task_id=<%= task.getTaskId() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="task?action=delete&task_id=<%= task.getTaskId() %>&project_id=<%= task.getProject_id() %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No tasks available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Add Task Modal -->
<div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addTaskModalLabel">Add New Task</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="task" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="project_id" value="<%= request.getParameter("project_id") %>">

                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>

                    <div class="mb-3">
                        <label for="start_date" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="start_date" name="start_date" required>
                    </div>

                    <div class="mb-3">
                        <label for="end_date" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="end_date" name="end_date" required>
                    </div>

                    <div class="mb-3">
                        <label for="resources" class="form-label">Resources</label>
                        <input type="text" class="form-control" id="resources" name="resources" required>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add Task</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>