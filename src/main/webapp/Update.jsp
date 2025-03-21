<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>

<%
    Project project = (Project) request.getAttribute("project");
%>

<html>
<head>
    <title>Update Project</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- Update Project Modal -->
<div class="modal fade" id="updateProjectModal" tabindex="-1" aria-labelledby="updateProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="updateProjectModalLabel">Update Project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateProjectForm" action="project?action=update" method="post">
                    <input type="hidden" name="projectId" value="<%= (project != null) ? project.getProject_id() : "" %>">

                    <div class="mb-3">
                        <label for="projectName" class="form-label">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="projectName" required
                               value="<%= (project != null) ? project.getName() : "" %>">
                    </div>

                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="projectDescription" name="projectDescription" rows="3" required>
<%= (project != null) ? project.getDescription().trim() : "" %></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required
                                       value="<%= (project != null) ? project.getStart_date() : "" %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required
                                       value="<%= (project != null) ? project.getEnd_date() : "" %>">
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="budget" class="form-label">Budget</label>
                        <input type="number" id="budget" name="budget" class="form-control" required
                               value="<%= (project != null) ? project.getBudget() : "" %>">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Project</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
