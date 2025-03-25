<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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

        /* Hero Section (Second Image) */
        #home {
            position: relative;
            height: 100vh;
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container-fluid {
            width: 100%;
            height: 100%;
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
            filter: brightness(0.7); /* Slightly darken the image for better text readability */
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
            font-size: 3.5rem;
            font-weight: bold;
            line-height: 1.2;
            margin-bottom: 1rem;
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

        /* Dashboard Section (First Image) */
        .dashboard-section {
            position: relative;
            padding: 5rem 0;
            background-image: url('images/homeimge.jpg'); /* Use the image path from your code */
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
        }

        .card h5 {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card p {
            font-size: 1rem;
            margin: 0;
        }

        /* Task Table Section */
        .table-section {
            padding: 3rem 0;
            background-color: #fff8e1; /* Light yellowish background */
        }

        .table {
            background-color: white;
        }

        .table th {
            background-color: #ffd107;
            color: black;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #fff5c3; /* Light yellow */
        }

        .table-striped tbody tr:nth-of-type(even) {
            background-color: #fff9d5;
        }

        .btn-warning {
            background-color: #ffd107 !important;
            border-color: #e6b800;
            color: black;
        }

        .btn-warning:hover {
            background-color: #ffcc00 !important;
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

            .dashboard-section {
                padding: 3rem 0;
            }

            .card {
                margin-bottom: 1.5rem;
            }

            .card h5 {
                font-size: 1.1rem;
            }

            .card p {
                font-size: 0.9rem;
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

<!-- Hero Section (Second Image) -->
<section id="home">
    <div class="container-fluid">
        <div class="hero-section">
            <img src="images/homeimge.jpg" alt="Construction professionals working on blueprints" class="hero-image">
            <div class="hero-content">
                <h1>Edifice<br>Experienced Construction Professionals</h1>
                <p>We are a leading construction company dedicated to delivering exceptional projects.</p>
                <div class="button-group">
                    <button class="btn btn-primary">See Projects</button>
                    <button class="btn btn-secondary">Contact Us</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Dashboard Section (First Image) -->
<section class="dashboard-section">
    <div class="container">
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
                    <i class="fas fa-users fa-3x text-warning"></i>
                    <h5 class="mt-3">Team Members</h5>
                    <p>5 active members</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Task Table Section -->
<section class="table-section">
    <div class="container">
        <div class="card shadow p-3">
            <h5>Recent Tasks</h5>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Task Name</th>
                    <th>Project</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>#T101</td>
                    <td>Website Evaluation</td>
                    <td>Office Construction</td>
                    <td>May 1, 2024</td>
                    <td>May 5, 2024</td>
                    <td><span class="badge bg-warning text-dark">Ongoing</span></td>
                </tr>
                <tr>
                    <td>#T102</td>
                    <td>Infrastructure Setup</td>
                    <td>Apartment Renovation</td>
                    <td>June 5, 2024</td>
                    <td>June 10, 2024</td>
                    <td><span class="badge bg-success">Completed</span></td>
                </tr>
                <tr>
                    <td>#T103</td>
                    <td>Finish Painting</td>
                    <td>Store Expansion</td>
                    <td>July 10, 2024</td>
                    <td>July 15, 2024</td>
                    <td><span class="badge bg-secondary">Pending</span></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>