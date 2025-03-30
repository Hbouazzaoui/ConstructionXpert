package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.ResourceDao;
import com.example.constructionxpert.Model.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/resource")
public class ResourceServlet extends HttpServlet {
    private ResourceDao resourceDao;

    @Override
    public void init() throws ServletException {
        resourceDao = new ResourceDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        // Check if action is null and set a default behavior
        if (action == null) {
            action = "listResource"; // Default action when no parameter is provided
        }
        switch (action) {
            case "newresource":
                showNewForm(req, resp);
                break;
            case "insertResource":
                insertResource(req, resp);
                break;
            case "listResource":
                listResource(req, resp);
                break;
            case "deleteResource":
                deleteResource(req, resp);
                break;
            case "updateResource":
                updateResource(req, resp);
                break;
            case "filterResource":
                filterById(req, resp);
                break;
            default:
                listResource(req, resp); // Default action
        }
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("listresource.jsp");
        dispatcher.forward(request, response);
    }

    private void insertResource(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String resourceName = request.getParameter("resourceName");
        String resourceType = request.getParameter("resourceType");
        String supplier = request.getParameter("supplier");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Resource resource = new Resource(resourceName, resourceType, supplier, quantity);
        resourceDao.insertResource(resource);
        System.out.println("Resource inserted");
        response.sendRedirect(request.getContextPath() + "/resource?action=listResource");
    }

    private void listResource(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Resource> resources = resourceDao.getAllResources();
        request.setAttribute("resources", resources);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listresource.jsp");
        dispatcher.forward(request, response);
    }

    private void updateResource(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int resourceId = Integer.parseInt(request.getParameter("resourceId"));
        String resourceName = request.getParameter("resourceName");
        String resourceType = request.getParameter("resourceType");
        String supplier = request.getParameter("supplier");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Resource resource = new Resource(resourceName, resourceType, supplier, quantity);
        resource.setResourceId(resourceId);
        resourceDao.updateResource(resource);
        System.out.println("Resource updated");
        response.sendRedirect(request.getContextPath() + "/resource?action=listResource");
    }

    private void deleteResource(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int resourceId = Integer.parseInt(request.getParameter("id"));
        resourceDao.deleteResource(resourceId);
        System.out.println("Resource deleted");
        response.sendRedirect(request.getContextPath() + "/resource?action=listResource");
    }

    private void filterById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Resource resource = resourceDao.getResourceById(id);
        request.setAttribute("resource", resource);
        RequestDispatcher dispatcher = request.getRequestDispatcher("listresource.jsp");
        dispatcher.forward(request, response);
    }
}