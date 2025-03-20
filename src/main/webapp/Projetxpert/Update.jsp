<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.constructionxpert.Model.Project" %>

<%
    Project project = (Project) request.getAttribute("project");
%>

<html>
<head>
    <title>Update Project</title>
</head>
<body>

<!--update -->
<div class="modal fade" id="updateProjectModal" tabindex="-1" aria-labelledby="updateProjectModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="updateProjectModalLabel">Update Project</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateProjectForm" action="project?action=update" method="post">
                    <input type="hidden" name="projectId" value="<%= (project != null) ? project.getProjectId() : "" %>">

                    <div class="mb-3">
                        <label for="projectName" class="form-label">Project Name</label>
                        <input type="text" class="form-control" id="projectName" name="projectName" required
                               value="<%= (project != null) ? project.getName() : "" %>">
                    </div>

                    <div class="mb-3">
                        <label for="projectDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="projectDescription" name="projectDescription" rows="3" required><%=
                        (project != null) ? project.getDescription() : "" %>
                        </textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="startDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" required
                                       value="<%= (project != null) ? project.getStartDate() : "" %>">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="endDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" required
                                       value="<%= (project != null) ? project.getEndDate() : "" %>">
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Budget</label>
                        <input type="number" name="budget" class="form-control" required
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

</body>
</html>
