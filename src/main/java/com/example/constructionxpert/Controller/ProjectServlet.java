package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.ProjectDAO;
import com.example.constructionxpert.Model.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/project")
public class ProjectServlet extends HttpServlet {
    private ProjectDAO projectDAO;

    @Override
    public void init() {
        projectDAO = new ProjectDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Project> projects = projectDAO.getAllProjects();
        req.setAttribute("projects", projects);
        req.getRequestDispatcher("/Projetxpert/listProjet.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        try {
            switch (action) {
                case "add":
                    addProject(req, resp);
                    break;
                case "update":
                    updateProject(req, resp);
                    break;
                case "delete":
                    deleteProject(req, resp);
                    break;
                default:
                    resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void addProject(HttpServletRequest req, HttpServletResponse resp) throws IOException, ParseException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        java.sql.Date startDate = java.sql.Date.valueOf(req.getParameter("startDate"));
        java.sql.Date endDate = java.sql.Date.valueOf(req.getParameter("endDate"));

        double budget = Double.parseDouble(req.getParameter("budget"));

        Project project = new Project(0, name, description, startDate, endDate, budget);
        projectDAO.insertProject(project);
        resp.sendRedirect("/Projetxpert/listProjet.jsp");
    }

    private void updateProject(HttpServletRequest req, HttpServletResponse resp) throws IOException, ParseException {
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        java.sql.Date startDate = java.sql.Date.valueOf(req.getParameter("startDate"));
        java.sql.Date endDate = java.sql.Date.valueOf(req.getParameter("endDate"));

        double budget = Double.parseDouble(req.getParameter("budget"));

        Project project = new Project(projectId, name, description, startDate, endDate, budget);
        projectDAO.updateProject(project);
        resp.sendRedirect("/Projetxpert/Update.jsp");
    }

    private void deleteProject(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int projectId = Integer.parseInt(req.getParameter("projectId"));
        projectDAO.deleteProject(projectId);
        resp.sendRedirect("project");
    }
}
