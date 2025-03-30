<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        <%@include file="assets/css/task.css"%>
    </style>
</head>
<body>

<!-- Navbar (unchanged) -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#" style="display: flex; align-items: center;">
            <div style="display: flex; margin-right: 10px;">
                <div style="width: 8px; height: 16px; background: rgb(11,14,33); margin-right: 4px;"></div>
                <div style="width: 8px; height: 12px; background: #090808; margin-right: 4px; align-self: flex-end;"></div>
                <div style="width: 8px; height: 20px; background: #090808;"></div>
            </div>
            <span style="font-weight: 700; letter-spacing: 0.5px;">CONSTRUCTION<span style="color: #ffffff;">XPERT</span></span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a href="<%= request.getContextPath() %>/" class="nav-link"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/resource" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
                <li class="nav-item">
                    <button class="theme-toggle nav-link" id="themeToggle">
                        <i class="fas fa-moon"></i>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Task Table Section -->
<section class="task-table-section">
    <div class="container">
        <h5>Tasks Management</h5>
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addTaskModal">
            + Add Task
        </button>
        <div class="table-responsive">
            <table class="task-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Description</th>
                    <th>Project ID</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
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
                    <td>#T<%= task.getTask_id() %></td>
                    <td><%= task.getDescription() %></td>
                    <td><%= task.getProject_id() %></td>
                    <td><%= task.getStart_date() %></td>
                    <td><%= task.getEnd_date() %></td>
                    <td><span class="badge bg-warning text-dark">Ongoing</span></td>
                    <td>
                        <button type="button" class="btn btn-warning btn-sm"
                                data-bs-toggle="modal"
                                data-bs-target="#updateTaskModal"
                                data-task-id="<%= task.getTask_id() %>"
                                data-project-id="<%= task.getProject_id() %>"
                                data-description="<%= task.getDescription() %>"
                                data-start-date="<%= task.getStart_date() %>"
                                data-end-date="<%= task.getEnd_date() %>">
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
                    <td colspan="7" class="text-center text-white">No tasks available.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Add Task Modal (unchanged) -->
<div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content dark-modal">
            <div class="modal-header">
                <h5 class="modal-title gold-text" id="addTaskModalLabel">Add New Task</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="task" method="post">
                    <input type="hidden" name="action" value="add">
                    <select class="form-select" name="project_id" aria-label="Default select example">
                        <%
                            List<Project> projects = (List<Project>) request.getAttribute("projects");
                            for (Project project : projects) {
                        %>
                        <option value="<%=project.getProject_id()%>"><%=project.getName()%></option>
                        <%}%>
                    </select>
                    <div class="mb-3">
                        <label for="description" class="form-label gold-text">Description</label>
                        <input type="text" class="form-control" id="description" name="description" required>
                    </div>
                    <div class="mb-3">
                        <label for="start_date" class="form-label gold-text">Start Date</label>
                        <input type="date" class="form-control" id="start_date" name="start_date" required>
                    </div>
                    <div class="mb-3">
                        <label for="end_date" class="form-label gold-text">End Date</label>
                        <input type="date" class="form-control" id="end_date" name="end_date" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn gold-btn">Add Task</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Task Modal (unchanged) -->
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn gold-btn">Update Task</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer (unchanged) -->
<footer>
    <div class="container">
        <div class="footer-section">
            <h5>ConstructionXpert</h5>
            <p>We are a leading construction company dedicated to delivering exceptional projects with precision and quality.</p>
        </div>
        <div class="footer-section">
            <h5露: 1rem;
            <h5>Quick Links</h5>
            <ul>
                <li><a href="<%= request.getContextPath() %>/project">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=">Tasks</a></li>
                <li><a href="<%= request.getContextPath() %>/project">Projects</a></li>
                <li><a href="listressource.jsp">Resources</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h5>Contact Us</h5>
            <p><i class="fas fa-map-marker-alt me-2"></i> 123 Construction Ave, Build City, 12345</p>
            <p><i class="fas fa-phone me-2"></i> +212 55 123-4567</p>
            <p><i class="fas fa-envelope me-2"></i> info@constructionxpert.com</p>
        </div>
        <div class="footer-section">
            <h5>Follow Us</h5>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>© 2025 ConstructionXpert. All Rights Reserved.</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Custom JavaScript for Modals -->
<script>
    <%@include file="assets/js/task.js"%>
    <%@include file="assets/js/index.js"%>
</script>
</body>
</html>