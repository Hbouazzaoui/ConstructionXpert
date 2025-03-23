<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Task Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fff8e1; /* Light yellowish background */
        }
        .navbar {
            background-color: #ffd107;
        }
        .navbar-brand {
            font-weight: bold;
            color: #090808 !important;
        }
        .nav-link {
            color: #090808 !important;
        }
        .nav-link:hover {
            background: rgba(255, 255, 255, 0.71);
            color: #ffd107;
            border-radius: 16px;
            font-size: 14px;
        }
        .card {
            border-radius: 10px;
            transition: transform 0.3s;
            background-color: #fff5c3; /* Soft yellow */
            border: none;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: scale(1.05);
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

<!-- Main Content -->
<div class="container mt-4">
    <header class="d-flex justify-content-between align-items-center py-3 border-bottom">
        <h2 class="text-dark">ConstructionXpert Panel</h2>
        <div class="d-flex align-items-center">
            <img src="https://randomuser.me/api/portraits/thumb/men/75.jpg" alt="User Avatar" class="rounded-circle" width="40">
            <span class="ms-2 text-dark">Hamouda Bouazzaoui</span>
        </div>
    </header>

    <!-- Dashboard Cards -->
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

    <!-- Task Table -->
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
