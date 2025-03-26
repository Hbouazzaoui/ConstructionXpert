<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Task" %>
<%@ page import="java.util.List" %>

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
            color: #ffd107 !important;
            border-radius: 16px;
            font-size: 14px;
        }

        /* Task Cards Section */
        .task-cards-section {
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

        .task-cards-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: 1;
        }

        .task-cards-section .container {
            position: relative;
            z-index: 2;
        }

        .task-cards-section h5 {
            color: white;
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px rgb(11, 14, 33);
        }

        .task-card {
            background-color: rgba(255, 255, 255, 0.73); /* Semi-transparent white background */
            border: none;
            border-radius: 15px; /* Rounded corners */
            transition: transform 0.3s ease;
            color: #333; /* Dark text for contrast */
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .task-card:hover {
            transform: scale(1.05); /* Matches your hover effect */
        }

        .task-card .task-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .task-card .task-header h6 {
            font-size: 1.1rem;
            font-weight: bold;
            margin: 0;
        }

        .task-card .task-details {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .task-card .task-details p {
            margin: 0;
            font-size: 0.95rem;
            flex: 1 1 45%; /* Two columns on larger screens */
        }

        .task-card .task-details p strong {
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
            .task-cards-section {
                padding: 3rem 0;
            }

            .task-card {
                margin-bottom: 1.5rem;
            }

            .task-card .task-details p {
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
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-home"></i> Home</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/task?action=listTasks&project_id=" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li class="nav-item"><a href="listressource.jsp" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Task Cards Section -->
<section class="task-cards-section">
    <div class="container">
        <h5>Tasks</h5>
        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addTaskModal">
            + Add Task
        </button>
        <div class="row">
            <%
                List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                if (tasks != null && !tasks.isEmpty()) {
                    for (Task task : tasks) {
            %>
            <div class="col-md-4">
                <div class="task-card">
                    <div class="task-header">
                        <h6>#T<%= task.getTask_id() %> - <%= task.getDescription() %></h6>
                        <span class="badge bg-warning text-dark">Ongoing</span>
                    </div>
                    <div class="task-details">
                        <p><strong>Project ID:</strong> <%= task.getProject_id() %></p>
                        <p><strong>Start Date:</strong> <%= task.getStart_date() %></p>
                        <p><strong>End Date:</strong> <%= task.getEnd_date() %></p>
                        <p><strong>Resources:</strong> <%= task.getResource_id() %></p>
                    </div>
                    <div class="task-actions mt-2">
                        <button type="button" class="btn btn-warning btn-sm"
                                data-bs-toggle="modal"
                                data-bs-target="#updateTaskModal"
                                data-task-id="<%= task.getTask_id() %>"
                                data-project-id="<%= task.getProject_id() %>"
                                data-description="<%= task.getDescription() %>"
                                data-start-date="<%= task.getStart_date() %>"
                                data-end-date="<%= task.getEnd_date() %>"
                                data-resources="<%= task.getResource_id() %>">
                            Edit
                        </button>
                        <a href="task?action=delete&task_id=<%= task.getTask_id() %>&project_id=<%= task.getProject_id() %>"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this task?')">
                            Delete
                        </a>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12">
                <p class="text-center text-white">No tasks available.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>
</section>

<!-- Add Task Modal -->
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
                    <input type="hidden" name="project_id" value="<%= request.getParameter("project_id") != null ? request.getParameter("project_id") : "" %>">

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

                    <div class="mb-3">
                        <label for="resources" class="form-label gold-text">Resources</label>
                        <input type="hidden" class="form-control" id="resource_id" name="resource_id" value="<%= request.getParameter("resource_id")%>">
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
<!-- Custom JavaScript for Modals -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Initialize update task modal
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