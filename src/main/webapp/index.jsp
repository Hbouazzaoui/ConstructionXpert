<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons (Updated to 6.5.2) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
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
            background-color: #ffd107;
            padding: 10px;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
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

        /* Hero Section */
        #home {
            position: relative;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 0;
        }

        .container-fluid {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .hero-section {
            position: relative;
            width: 100%;
            height: 100%;
        }

        .hero-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            filter: brightness(0.7);
        }

        .hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: white;
            z-index: 2;
        }

        .hero-content h1 {
            font-size: 3rem; /* Adjusted to match the image */
            font-weight: 900; /* Extra bold to match the image */
            line-height: 1.1; /* Tighter line height */
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Add shadow for better readability */
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn {
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #f5c518; /* Yellow button like in the image */
            color: black;
            font-weight: bold;
        }

        .btn-primary:hover {
            background-color: #e0b015;
        }

        .btn-secondary {
            background-color: #333; /* Dark button like in the image */
            color: white;
            font-weight: bold;
        }

        .btn-secondary:hover {
            background-color: #555;
        }

        /* Dashboard Section */
        .dashboard-section {
            position: relative;
            padding: 5rem 0;
            background-image: url('images/sketch-new-construction.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed; /* Optional: for a parallax effect */
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .dashboard-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay */
            z-index: 1;
        }

        .dashboard-section .container {
            position: relative;
            z-index: 2;
        }

        .dashboard-section h5 {
            color: white;
            text-align: center;
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px rgb(11, 14, 33);
        }

        .card {
            background-color: #f5c518; /* Yellow background like in the images */
            border: none;
            border-radius: 15px; /* Rounded corners */
            text-align: center;
            transition: transform 0.3s ease;
            color: #333; /* Dark text for contrast */
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: scale(1.05); /* Matches your hover effect */
        }

        .card i {
            margin-bottom: 1rem;
            display: inline-block; /* Ensure the icon is treated as a block element */
        }

        .card h5 {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card p {
            font-size: 1rem;
            margin: 0;
        }

        .text-warning {
            color: #ffc107 !important; /* Bootstrap's warning color */
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
        }

        .task-cards-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
            .hero-content h1 {
                font-size: 2.5rem;
            }

            .hero-content p {
                font-size: 1rem;
            }

            .btn {
                padding: 0.6rem 1.5rem;
                font-size: 1rem;
            }

            .dashboard-section,
            .task-cards-section,
            .projects-section,
            .news-section {
                padding: 3rem 0;
            }

            .card,
            .task-card {
                margin-bottom: 1.5rem;
            }

            .card h5 {
                font-size: 1.1rem;
            }

            .card p {
                font-size: 0.9rem;
            }

            .task-card .task-details p {
                flex: 1 1 100%; /* Stack details vertically on small screens */
            }

            .projects-section .col-md-4 {
                flex: 0 0 100%;
                max-width: 100%;
            }

            .projects-section .project-img {
                height: 150px;
            }

            .news-section .news-card {
                flex-direction: column;
                text-align: center;
            }

            .news-section .news-card img {
                max-width: 100%;
                height: 200px;
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
                <li class="nav-item"><a href="task" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
                <li class="nav-item"><a href="#recent" class="nav-link"><i class="far fa-clock"></i> Recent</a></li>
                <li class="nav-item"><a href="<%= request.getContextPath() %>/project" class="nav-link"><i class="fas fa-project-diagram"></i> Projects</a></li>
                <li class="nav-item"><a href="listressource.jsp" class="nav-link"><i class="fas fa-cogs"></i> Resources</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section id="home">
    <div class="container-fluid">
        <div class="hero-section">
            <img src="images/homeimge.jpg" alt="Construction professionals working on blueprints" class="hero-image">
            <div class="hero-content">
                <h1>Edifice Experienced Construction Professionals</h1>
                <div class="button-group">
                    <button class="btn btn-primary">See Projects</button>
                    <button class="btn btn-secondary">Contact Us</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Dashboard Section -->
<section class="dashboard-section">
    <div class="container">
        <h5>Dashboard</h5>
        <div class="row my-4">
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class="fas fa-tasks fa-3x text-primary"></i>
                    <h5 class="mt-3">Ongoing Tasks</h5>
                    <p>10 tasks in progress</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class="fas fa-calendar-check fa-3x text-success"></i>
                    <h5 class="mt-3">Completed Tasks</h5>
                    <p>8 tasks completed this week</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <i class='fas fa-users' style='font-size:36px'></i>
                    <h5 class="mt-3">Team Members</h5>
                    <p>5 active members</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Task Cards Section -->
<section class="task-cards-section" id="recent">
    <div class="container">
        <h5>Recent Tasks</h5>
        <div class="row">
            <div class="col-md-4">
                <div class="task-card">
                    <div class="task-header">
                        <h6>#T101 - Website Evaluation</h6>
                        <span class="badge bg-warning text-dark">Ongoing</span>
                    </div>
                    <div class="task-details">
                        <p><strong>Project:</strong> Office Construction</p>
                        <p><strong>Start Date:</strong> May 1, 2024</p>
                        <p><strong>End Date:</strong> May 5, 2024</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="task-card">
                    <div class="task-header">
                        <h6>#T102 - Infrastructure Setup</h6>
                        <span class="badge bg-success">Completed</span>
                    </div>
                    <div class="task-details">
                        <p><strong>Project:</strong> Apartment Renovation</p>
                        <p><strong>Start Date:</strong> June 5, 2024</p>
                        <p><strong>End Date:</strong> June 10, 2024</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="task-card">
                    <div class="task-header">
                        <h6>#T103 - Finish Painting</h6>
                        <span class="badge bg-secondary">Pending</span>
                    </div>
                    <div class="task-details">
                        <p><strong>Project:</strong> Store Expansion</p>
                        <p><strong>Start Date:</strong> July 10, 2024</p>
                        <p><strong>End Date:</strong> July 15, 2024</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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
                <li><a href="#recent">Recent</a></li>
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
</body>
</html>