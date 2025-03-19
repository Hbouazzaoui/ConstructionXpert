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
            background-color: #fff5cc; /* Soft Yellow Background */
            color: #333;
        }
        .navbar {
            background-color: #ffcc00; /* Bright Yellow Navbar */
        }
        .navbar-brand, .nav-link {
            color: #333 !important;
        }
        .container {
            background-color: #ffeb99; /* Light Yellow Container */
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
<nav class="navbar navbar-expand-lg navbar-dark ">
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

<div class="container">
    <!-- Button to trigger modal -->
    <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addProjectModal">
        + Add Project
    </button>

    <!-- Project List Table -->
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
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
            <td><%= project.getProjectId() %></td>
            <td><%= project.getName() %></td>
            <td><%= project.getDescription() %></td>
            <td><%= project.getStartDate() %></td>
            <td><%= project.getEndDate() %></td>
            <td>$<%= project.getBudget() %></td>
            <td>
                <a href="project?action=update" class="btn btn-warning btn-sm">
                    Edit
                </a>

                <a href="project?action=delete&projectId=<%= project.getProjectId() %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center">No projects available.</td>
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
                <form id="updateProjectForm" action="project" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="updateProjectId" name="projectId">

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
                                <input type="date" class="form-control" id="startDate" name="startDate" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="updateProjectBudget" class="form-label">Budget</label>
                        <input type="number" class="form-control" id="updateProjectBudget" name="budget" required>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Project</button>
                    </div>
                </form>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>




    <!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
