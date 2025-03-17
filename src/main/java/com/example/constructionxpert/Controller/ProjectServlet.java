package com.example.constructionxpert.Controller;

import com.example.constructionxpert.DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/prject")
public class ProjectServlet extends HttpServlet {
 private UserDAO userDAO ;

 @Override
 public void init() {
  try {
     userDAO = new UserDAO();
     userDAO.CreateTableProject();
  } catch (Exception e) {
      throw new RuntimeException(e);
  }
 }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
