<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff5cc;
            color: #333;
        }
        .navbar {
            background-color: #ffcc00;
        }
        .navbar-brand, .nav-link {
            color: #333 !important;
        }
        .container {
            background-color: #ffeb99;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #ffaa00;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e69500;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a href="listtache.jsp" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li class="nav-item"><a href="listressource.jsp" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <header class="d-flex justify-content-between align-items-center py-3 border-bottom">
        <h2>List of Projects</h2>
        <div class="d-flex align-items-center">
            <img src="https://randomuser.me/api/portraits/thumb/men/75.jpg" alt="User Avatar" class="rounded-circle" width="40">
            <span class="ms-2">Hamouda Bouazzaoui</span>
        </div>
    </header>

    <!-- Button to trigger modal -->
    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addProjectModal">
        + Add Project
    </button>

    <!-- Project List Table -->
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Budget</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Project> projects = (List<Project>) request.getAttribute("projects");
            if (projects != null && !projects.isEmpty()) {
                for (Project project : projects) {
        %>
        <tr>
            <td><%= project.getProject_id() %></td>
            <td><%= project.getName() %></td>
            <td><%= project.getDescription() %></td>
            <td><%= project.getStart_date() %></td>
            <td><%= project.getEnd_date() %></td>
            <td>$<%= project.getBudget() %></td>
            <td>
                <!-- Edit Button with Dynamic Data Attributes -->
                <button type="button" class="btn btn-warning"
                        data-bs-toggle="modal"
                        data-bs-target="#updateProjectModal"
                        data-id="<%= project.getProject_id() %>"
                        data-name="<%= project.getName() %>"
                        data-description="<%= project.getDescription() %>"
                        data-start-date="<%= project.getStart_date() %>"
                        data-end-date="<%= project.getEnd_date() %>"
                        data-budget="<%= project.getBudget() %>">
                    Edit
                </button>
                <a href="project?action=delete&projectId=<%= project.getProject_id() %>" class="btn btn-danger btn-sm">Delete</a>
                <a href="task?action=listTasks&projectId=<%= project.getProject_id() %>" class="btn btn-danger btn-sm">Tasks</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center">No projects available.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Add Project Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" aria-labelledby="modalTitle" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Add New Project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <form id="addProjectForm" action="project" method="post">
                    <input type="hidden" name="action" value="add">

                    <div class="mb-3">
                        <label for="projectName" class="form-label">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="name" required>
                    </div>

                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="projectDescription" name="description" rows="3" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="start_date" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="end_date" required>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="projectBudget" class="form-label">Budget</label>
                        <input type="number" class="form-control" id="projectBudget" name="budget" required>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Add Project</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Update Project Modal -->
<div class="modal fade" id="updateProjectModal" tabindex="-1" aria-labelledby="updateProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="background-color: #1a1a1a; color: #fff; border-radius: 15px; border: 1px solid #444;">
            <div class="modal-header" style="background-color: #121212; border-bottom: 1px solid #444; border-top-left-radius: 15px; border-top-right-radius: 15px;">
                <h5 class="modal-title" id="updateProjectModalLabel" style="color: #FFD700; font-weight: bold;">Update Project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="filter: invert(1);"></button>
            </div>
            <div class="modal-body">
                <form id="updateProjectForm" action="project" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="projectId" name="projectId">

                    <!-- Project Name -->
                    <div class="mb-4">
                        <label for="updateProjectName" class="form-label" style="color: #FFD700; font-weight: 500;">Project Name</label>
                        <input type="text" class="form-control" id="updateProjectName" name="name" required
                               style="background-color: #2a2a2a; color: #fff; border: 1px solid #444; border-radius: 8px; padding: 10px;">
                    </div>

                    <!-- Project Description -->
                    <div class="mb-4">
                        <label for="updateProjectDescription" class="form-label" style="color: #FFD700; font-weight: 500;">Description</label>
                        <textarea class="form-control" id="updateProjectDescription" name="description" rows="3" required
                                  style="background-color: #2a2a2a; color: #fff; border: 1px solid #444; border-radius: 8px; padding: 10px;"></textarea>
                    </div>

                    <!-- Start Date and End Date -->
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="updateStartDate" class="form-label" style="color: #FFD700; font-weight: 500;">Start Date</label>
                                <input type="date" class="form-control" id="updateStartDate" name="start_date" required
                                       style="background-color: #2a2a2a; color: #fff; border: 1px solid #444; border-radius: 8px; padding: 10px;">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="updateEndDate" class="form-label" style="color: #FFD700; font-weight: 500;">End Date</label>
                                <input type="date" class="form-control" id="updateEndDate" name="end_date" required
                                       style="background-color: #2a2a2a; color: #fff; border: 1px solid #444; border-radius: 8px; padding: 10px;">
                            </div>
                        </div>
                    </div>

                    <!-- Budget -->
                    <div class="mb-4">
                        <label for="updateBudget" class="form-label" style="color: #FFD700; font-weight: 500;">Budget</label>
                        <input type="number" class="form-control" id="updateBudget" name="budget" required
                               style="background-color: #2a2a2a; color: #fff; border: 1px solid #444; border-radius: 8px; padding: 10px;">
                    </div>

                    <!-- Modal Footer -->
                    <div class="modal-footer" style="background-color: #121212; border-top: 1px solid #444; border-bottom-left-radius: 15px; border-bottom-right-radius: 15px;">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                style="background-color: #444; border: none; color: #fff; font-weight: 500; padding: 8px 20px; border-radius: 8px;">Close</button>
                        <button type="submit" class="btn"
                                style="background-color: #FFD700; color: #000; font-weight: bold; padding: 8px 20px; border-radius: 8px;">Update Project</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript to Populate Update Modal -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let updateProjectModal = document.getElementById("updateProjectModal");

        if (updateProjectModal) {
            updateProjectModal.addEventListener("show.bs.modal", function (event) {
                let button = event.relatedTarget; // Button that triggered the modal

                // Retrieve data attributes
                let projectId = button.getAttribute("data-id");
                let projectName = button.getAttribute("data-name");
                let projectDescription = button.getAttribute("data-description");
                let startDate = button.getAttribute("data-start-date");
                let endDate = button.getAttribute("data-end-date");
                let budget = button.getAttribute("data-budget");

                // Populate the modal fields
                document.getElementById("projectId").value = projectId;
                document.getElementById("updateProjectName").value = projectName;
                document.getElementById("updateProjectDescription").value = projectDescription;
                document.getElementById("updateStartDate").value = startDate;
                document.getElementById("updateEndDate").value = endDate;
                document.getElementById("updateBudget").value = budget;
            });
        }
    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>