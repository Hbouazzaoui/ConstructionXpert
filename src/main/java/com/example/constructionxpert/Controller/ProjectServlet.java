package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.ProjectDAO;
import com.example.constructionxpert.Model.Project;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/project")
public class ProjectServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() {
        projectDAO = new ProjectDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "listProjet";
        }
        try {
            switch (action) {
                case "add":
                    addProject(req, resp);
                    break;
                case "listProjet":
                    listProjects(req, resp);
                    break;
                case "update":
                    updateProject(req, resp);
                    break;
                case "delete":
                    deleteProject(req, resp);
                    break;
                default:
                    listProjects(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Database error: " + e.getMessage(), e);
        }
    }


    private void addProject(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String startDate = req.getParameter("start_date");
        String endDate = req.getParameter("end_date");
        float budget = Float.parseFloat(req.getParameter("budget"));

        Project project = new Project(name, description, startDate, endDate, budget);
        projectDAO.insertProject(project);

        resp.sendRedirect(req.getContextPath() + "/project?action=listProjet");
    }

    private void listProjects(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Project> projects = projectDAO.getAllProjects();
        req.setAttribute("projects", projects);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listProjet.jsp");
        dispatcher.forward(req, resp);
    }
    private void updateProject(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int projectId = Integer.parseInt(request.getParameter("projectId"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        float budget = Float.parseFloat(request.getParameter("budget"));

        Project project = new Project(projectId, name, description, startDate, endDate, budget);
        projectDAO.updateProject(project);

        response.sendRedirect(request.getContextPath() + "/project?action=listProjet");
    }

    private void deleteProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        projectDAO.deleteProject(projectId);
        resp.sendRedirect(req.getContextPath() + "/project?action=listProjet");
    }
}
