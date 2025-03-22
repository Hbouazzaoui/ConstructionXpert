package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.TaskDAO;
import com.example.constructionxpert.Model.Task;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet( "/TaskServlet")
public class TaskServlet extends HttpServlet {

    private TaskDAO taskDAO ;

    @Override
    public void init(){
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Task> tasks = taskDAO.getTasksByProjectId();
        request.setAttribute("tasks" ,tasks);
        request.getRequestDispatcher("listTasks").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
