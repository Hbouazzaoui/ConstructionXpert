</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.constructionxpert.Model.Resource" %>
<%
    List<Resource> resources = (List<Resource>) request.getAttribute("resources");
    Resource resource = (Resource) request.getAttribute("resource"); // For filtering by ID
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructionXpert - Resource Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        <%@include file="assets/css/resorce.css"%>
    </style>
</head>
<body>

<!-- Navbar -->
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
                <li class="nav-item"><a href="task" class="nav-link"><i class="fas fa-tasks"></i> Tasks</a></li>
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

<!-- Main Content -->
<div class="main-content">
    <div class="container">
        <h2 class="mb-4">Resource Management</h2>

        <!-- Search and Add Resource -->
        <div class="search-container">
            <form method="get" action="<%= request.getContextPath() %>/resource" class="d-flex gap-2">
                <input type="hidden" name="action" value="filterResource">
                <input type="text" name="id" placeholder="Search by Resource ID..." required>
                <button type="submit" class="btn btn-primary">Search</button>
                <a href="<%= request.getContextPath() %>/resource?action=listResource" class="btn btn-secondary">Show All</a>
            </form>
            <button class="add-resource-btn" data-bs-toggle="modal" data-bs-target="#resourceModal" onclick="resetModal()">
                <i class="fas fa-plus"></i> Add Resource
            </button>
        </div>

        <!-- Resource Table -->
        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>Resource ID</th>
                    <th>Resource Name</th>
                    <th>Type</th>
                    <th>Supplier</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    // If a single resource is found (filtering by ID)
                    if (resource != null) {
                %>
                <tr>
                    <td><%= resource.getResourceId() %></td>
                    <td><%= resource.getResourceName() %></td>
                    <td><%= resource.getType() %></td>
                    <td><%= resource.getSupplier() %></td>
                    <td><%= resource.getQuantity() %></td>
                    <td>
                        <button class="action-btn edit-btn" data-bs-toggle="modal" data-bs-target="#resourceModal"
                                onclick="fillModal('<%= resource.getResourceId() %>', '<%= resource.getResourceName() %>', '<%= resource.getType() %>', '<%= resource.getSupplier() %>', '<%= resource.getQuantity() %>')">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/resource?action=deleteResource&id=<%= resource.getResourceId() %>" class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
                <%
                }
                // Otherwise, display the full list
                else if (resources != null) {
                    for (Resource r : resources) {
                %>
                <tr>
                    <td><%= r.getResourceId() %></td>
                    <td><%= r.getResourceName() %></td>
                    <td><%= r.getType() %></td>
                    <td><%= r.getSupplier() %></td>
                    <td><%= r.getQuantity() %></td>
                    <td>
                        <button class="action-btn edit-btn" data-bs-toggle="modal" data-bs-target="#resourceModal"
                                onclick="fillModal('<%= r.getResourceId() %>', '<%= r.getResourceName() %>', '<%= r.getType() %>', '<%= r.getSupplier() %>', '<%= r.getQuantity() %>')">
                            <i class="fas fa-edit"></i> Edit
                        </button>
                        <a href="<%= request.getContextPath() %>/resource?action=deleteResource&id=<%= r.getResourceId() %>" class="action-btn delete-btn">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center">No resources found.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Resource Modal -->
<div class="modal fade" id="resourceModal" tabindex="-1" aria-labelledby="resourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="resourceModalLabel">Add New Resource</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="resourceForm" action="<%= request.getContextPath() %>/resource?action=insertResource" method="post">
                    <input type="hidden" id="resourceId" name="resourceId">
                    <div class="mb-3">
                        <label for="resourceName" class="form-label">Resource Name</label>
                        <input type="text" class="form-control" id="resourceName" name="resourceName" placeholder="Enter resource name" required>
                    </div>
                    <div class="mb-3">
                        <label for="resourceType" class="form-label">Type</label>
                        <input type="text" class="form-control" id="resourceType" name="resourceType" placeholder="Enter type" required>
                    </div>
                    <div class="mb-3">
                        <label for="supplier" class="form-label">Supplier</label>
                        <input type="text" class="form-control" id="supplier" name="supplier" placeholder="Enter supplier" required>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter quantity" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" form="resourceForm" class="btn btn-primary">Save Resource</button>
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
                <li><a href="<%= request.getContextPath() %>/">Home</a></li>
                <li><a href="task">Tasks</a></li>
                <li><a href="<%= request.getContextPath() %>/project">Projects</a></li>
                <li><a href="<%= request.getContextPath() %>/resource">Resources</a></li>
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
<script>
    <%@include file="assets/js/index.js"%>
</script>
</body>
</html>