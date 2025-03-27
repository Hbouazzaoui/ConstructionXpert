<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Project List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            overflow-x: hidden;
            background-color: #fff8e1; /* Light yellowish background */
        }

        /* Navbar Styling */
        .navbar {
            background-color: #ffd107; /* Yellow navbar */
            padding: 10px;
            position: fixed; /* Fix the navbar at the top */
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000; /* Ensure it stays above other content */
        }

        .navbar-brand {
            font-weight: bold;
            color: #090808 !important;
        }

        .nav-link {
            color: #090808 !important;
            padding: 0.5rem 1rem;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.71);
            color: #0b0e21 !important;
            border-radius: 16px;
            font-size: 14px;
        }

        /* Project Cards Section */
        .project-cards-section {
            position: relative;
            padding: 5rem 0;
            background-image: url('images/discussing-blueprint.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* Optional: for a parallax effect */
            min-height: 100vh;
            display: flex;
            align-items: center;
            margin-top: 56px; /* Adjust for fixed navbar height */
        }

        .project-cards-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: 1;
        }

        .project-cards-section .container {
            position: relative;
            z-index: 2;
        }

        .project-cards-section h5 {
            color: white;
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px rgb(11, 14, 33);
        }

        .project-card {
            background-color: rgba(255, 255, 255, 0.73); /* Semi-transparent white background */
            border: none;
            border-radius: 15px; /* Rounded corners */
            transition: transform 0.3s ease;
            color: #333; /* Dark text for contrast */
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .project-card:hover {
            transform: scale(1.05); /* Matches your hover effect */
        }

        .project-card .project-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .project-card .project-header h6 {
            font-size: 1.1rem;
            font-weight: bold;
            margin: 0;
        }

        .project-card .project-details {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .project-card .project-details p {
            margin: 0;
            font-size: 0.95rem;
            flex: 1 1 45%; /* Two columns on larger screens */
        }

        .project-card .project-details p strong {
            display: inline-block;
            width: 100px; /* Fixed width for labels */
        }

        /* Modal Styling */
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

        .btn-primary {
            background-color: #f5c518; /* Yellow button like in the image */
            color: black;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #e0b015;
        }

        /* Footer Styling */
        footer {
            background-color: #333; /* Dark background for contrast */
            color: #fff;
            padding: 3rem 0;
        }

        footer .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 2rem;
        }

        footer .footer-section {
            flex: 1 1 200px;
        }

        footer .footer-section h5 {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 1rem;
            color: #ffd107; /* Yellow accent for headings */
        }

        footer .footer-section p {
            font-size: 0.95rem;
            margin: 0.5rem 0;
        }

        footer .footer-section ul {
            list-style: none;
            padding: 0;
        }

        footer .footer-section ul li {
            margin-bottom: 0.5rem;
        }

        footer .footer-section ul li a {
            color: #fff;
            text-decoration: none;
            font-size: 0.95rem;
            transition: color 0.3s ease;
        }

        footer .footer-section ul li a:hover {
            color: #ffd107; /* Yellow on hover */
        }

        footer .footer-section .social-icons {
            display: flex;
            gap: 1rem;
        }

        footer .footer-section .social-icons a {
            color: #fff;
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }

        footer .footer-section .social-icons a:hover {
            color: #ffd107; /* Yellow on hover */
        }

        footer .footer-bottom {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .project-cards-section {
                padding: 3rem 0;
            }

            .project-card {
                margin-bottom: 1.5rem;
            }

            .project-card .project-details p {
                flex: 1 1 100%; /* Stack details vertically on small screens */
            }

            footer .container {
                flex-direction: column;
                text-align: center;
            }

            footer .footer-section {
                margin-bottom: 2rem;
            }

            footer .footer-section .social-icons {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a href="<%= request.getContextPath() %>/" class="nav-link"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li class="nav-item"><a href="listressource.jsp" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Project Cards Section -->
<section class="project-cards-section">
    <div class="container">
        <h5>Projects</h5>
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addProjectModal">
            + Add Project
        </button>
        <div class="row">
            <%
                List<Project> projects = (List<Project>) request.getAttribute("projects");
                if (projects != null && !projects.isEmpty()) {
                    for (Project project : projects) {
            %>
            <div class="col-md-4">
                <div class="project-card">
                    <div class="project-header">
                        <h6>#P<%= project.getProject_id() %> - <%= project.getName() %></h6>
                        <span class="badge bg-success">Active</span>
                    </div>
                    <div class="project-details">
                        <p><strong>Description:</strong> <%= project.getDescription() %></p>
                        <p><strong>Start Date:</strong> <%= project.getStart_date() %></p>
                        <p><strong>End Date:</strong> <%= project.getEnd_date() %></p>
                        <p><strong>Budget:</strong> $<%= project.getBudget() %></p>
                    </div>
                    <div class="project-actions mt-2">
                        <button type="button" class="btn btn-warning btn-sm"
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
                        <a href="task?action=listTasks&projectId=<%= project.getProject_id() %>" class="btn btn-primary btn-sm">Tasks</a>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12">
                <p class="text-center text-white">No projects available.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>

<!-- Add Project Modal -->
<div class="modal fade" id="addProjectModal" tabindex="-1" aria-labelledby="addProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content dark-modal">
            <div class="modal-header">
                <h5 class="modal-title gold-text" id="addProjectModalLabel">Add New Project</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="addProjectForm" action="project" method="post">
                    <input type="hidden" name="action" value="add">

                    <div class="mb-3">
                        <label for="projectName" class="form-label gold-text">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="name" required>
                    </div>

                    <div class="mb-3">
                        <label for="projectDescription" class="form-label gold-text">Description</label>
                        <textarea class="form-control" id="projectDescription" name="description" rows="3" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="startDate" class="form-label gold-text">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="start_date" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="endDate" class="form-label gold-text">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="end_date" required>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="projectBudget" class="form-label gold-text">Budget</label>
                        <input type="number" class="form-control" id="projectBudget" name="budget" required>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn gold-btn">Add Project</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Update Project Modal -->
<div class="modal fade" id="updateProjectModal" tabindex="-1" aria-labelledby="updateProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content dark-modal">
            <div class="modal-header">
                <h5 class="modal-title gold-text" id="updateProjectModalLabel">Update Project</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateProjectForm" action="project" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" id="projectId" name="projectId">

                    <div class="mb-4">
                        <label for="updateProjectName" class="form-label gold-text">Project Name</label>
                        <input type="text" class="form-control" id="updateProjectName" name="name" required>
                    </div>

                    <div class="mb-4">
                        <label for="updateProjectDescription" class="form-label gold-text">Description</label>
                        <textarea class="form-control" id="updateProjectDescription" name="description" rows="3" required></textarea>
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
                        <label for="updateBudget" class="form-label gold-text">Budget</label>
                        <input type="number" class="form-control" id="updateBudget" name="budget" required>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn gold-btn">Update Project</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer>
    <div class="container">
        <!-- Company Info -->
        <div class="footer-section">
            <h5>ConstructionXpert</h5>
            <p>We are a leading construction company dedicated to delivering exceptional projects with precision and quality.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-section">
            <h5>Quick Links</h5>
            <ul>
                <li><a href="<%= request.getContextPath() %>/project">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=">Tasks</a></li>
                <li><a href="<%= request.getContextPath() %>/project">Projects</a></li>
                <li><a href="listressource.jsp">Resources</a></li>
            </ul>
        </div>

        <!-- Contact Info -->
        <div class="footer-section">
            <h5>Contact Us</h5>
            <p><i class="fas fa-map-marker-alt me-2"></i> 123 Construction Ave, Build City, 12345</p>
            <p><i class="fas fa-phone me-2"></i> +212 55 123-4567</p>
            <p><i class="fas fa-envelope me-2"></i> info@constructionxpert.com</p>
        </div>

        <!-- Social Media -->
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
<!-- JavaScript to Populate Update Modal -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize update project modal
        const updateProjectModal = document.getElementById("updateProjectModal");
        if (updateProjectModal) {
            updateProjectModal.addEventListener("show.bs.modal", function(event) {
                const button = event.relatedTarget;

                // Retrieve data attributes
                const projectId = button.getAttribute("data-id");
                const projectName = button.getAttribute("data-name");
                const projectDescription = button.getAttribute("data-description");
                const startDate = button.getAttribute("data-start-date");
                const endDate = button.getAttribute("data-end-date");
                const budget = button.getAttribute("data-budget");

                // Populate the modal fields
                document.getElementById("projectId").value = projectId;
                document.getElementById("updateProjectName").value = projectName;
                document.getElementById("updateProjectDescription").value = projectDescription;
                document.getElementById("updateStartDate").value = startDate;
                document.getElementById("updateEndDate").value = endDate;
                document.getElementById("updateBudget").value = budget;
            });
        }

        // Set minimum dates for date inputs
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('startDate')?.setAttribute('min', today);
        document.getElementById('endDate')?.setAttribute('min', today);
        document.getElementById('updateStartDate')?.setAttribute('min', today);
        document.getElementById('updateEndDate')?.setAttribute('min', today);

        // Update end date minimum when start date changes
        document.getElementById('startDate')?.addEventListener('change', function() {
            document.getElementById('endDate').min = this.value;
        });

        document.getElementById('updateStartDate')?.addEventListener('change', function() {
            document.getElementById('updateEndDate').min = this.value;
        });
    });
</script>
</body>
</html>