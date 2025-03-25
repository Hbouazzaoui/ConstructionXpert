<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Task" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Task List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .dark-modal {
            background-color: #1a1a1a;
            color: #fff;
            border-radius: 15px;
            border: 1px solid #444;
        }
        .dark-modal .modal-header {
            background-color: #121212;
            border-bottom: 1px solid #444;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .dark-modal .modal-footer {
            background-color: #121212;
            border-top: 1px solid #444;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
        }
        .dark-modal .form-control {
            background-color: #2a2a2a;
            color: #fff;
            border: 1px solid #444;
            border-radius: 8px;
            padding: 10px;
        }
        .gold-text {
            color: #FFD700;
            font-weight: 500;
        }
        .gold-btn {
            background-color: #FFD700;
            color: #000;
            font-weight: bold;
        }
        .btn-close-white {
            filter: invert(1);
        }
    </style>
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
            <th>ID</th>
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
            <td><%= task.getTask_id() %></td>
            <td><%= task.getProject_id() %></td>
            <td><%= task.getDescription() %></td>
            <td><%= task.getStart_date() %></td>
            <td><%= task.getEnd_date() %></td>
            <td><%= task.getResources() != null ? task.getResources() : "" %></td>
            <td>
                <button type="button" class="btn btn-warning btn-sm"
                        data-bs-toggle="modal"
                        data-bs-target="#updateTaskModal"
                        data-task-id="<%= task.getTask_id() %>"
                        data-project-id="<%= task.getProject_id() %>"
                        data-description="<%= task.getDescription() %>"
                        data-start-date="<%= task.getStart_date() %>"
                        data-end-date="<%= task.getEnd_date() %>"
                        data-resources="<%= task.getResources() != null ? task.getResources() : "" %>">
                    Edit
                </button>
                <a href="task?action=delete&task_id=<%= task.getTask_id() %>&project_id=<%= task.getProject_id() %>"
                   class="btn btn-danger btn-sm"
                   onclick="return confirm('Are you sure you want to delete this task?')">
                    Delete
                </a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center">No tasks available.</td>
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
                    <input type="hidden" name="project_id" value="<%= request.getParameter("project_id") != null ? request.getParameter("project_id") : "" %>">

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
                        <input type="text" class="form-control" id="resources" name="resources">
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

<!-- Update Task Modal -->
<div class="modal fade" id="updateTaskModal" tabindex="-1" aria-labelledby="updateTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content dark-modal">
            <div class="modal-header">
                <h5 class="modal-title gold-text" id="updateTaskModalLabel">Update Task</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateTaskForm" action="task" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="updateTaskId" name="task_id">
                    <input type="hidden" id="updateProjectId" name="project_id">

                    <div class="mb-4">
                        <label for="updateDescription" class="form-label gold-text">Description</label>
                        <textarea class="form-control" id="updateDescription" name="description" rows="3" required></textarea>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="updateStartDate" class="form-label gold-text">Start Date</label>
                                <input type="date" class="form-control" id="updateStartDate" name="start_date" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="updateEndDate" class="form-label gold-text">End Date</label>
                                <input type="date" class="form-control" id="updateEndDate" name="end_date" required>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="updateResources" class="form-label gold-text">Resources</label>
                        <input type="text" class="form-control" id="updateResources" name="resources">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn gold-btn">Update Task</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize update modal
        const updateTaskModal = document.getElementById('updateTaskModal');
        if (updateTaskModal) {
            updateTaskModal.addEventListener('show.bs.modal', function(event) {
                const button = event.relatedTarget;

                // Extract data from button attributes
                const taskId = button.getAttribute('data-task-id');
                const projectId = button.getAttribute('data-project-id');
                const description = button.getAttribute('data-description');
                const startDate = button.getAttribute('data-start-date');
                const endDate = button.getAttribute('data-end-date');
                const resources = button.getAttribute('data-resources');

                // Update modal fields
                document.getElementById('updateTaskId').value = taskId;
                document.getElementById('updateProjectId').value = projectId;
                document.getElementById('updateDescription').value = description;
                document.getElementById('updateStartDate').value = startDate;
                document.getElementById('updateEndDate').value = endDate;
                document.getElementById('updateResources').value = resources;
            });
        }

        // Set minimum dates for date inputs
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('start_date')?.setAttribute('min', today);
        document.getElementById('end_date')?.setAttribute('min', today);
        document.getElementById('updateStartDate')?.setAttribute('min', today);
        document.getElementById('updateEndDate')?.setAttribute('min', today);

        // Update end date minimum when start date changes
        document.getElementById('start_date')?.addEventListener('change', function() {
            document.getElementById('end_date').min = this.value;
        });

        document.getElementById('updateStartDate')?.addEventListener('change', function() {
            document.getElementById('updateEndDate').min = this.value;
        });
    });
</script>
</body>
</html>