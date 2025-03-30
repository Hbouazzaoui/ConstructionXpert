package com.example.constructionxpert.authentifecation;

import com.example.constructionxpert.DAO.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.constructionxpert.Model.User;

import java.io.IOException;

@WebServlet({"/seConnecter"})
public class LoginServlet extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDao.getUserByUsername(username);

        if (user != null && user.getPassword().equals(password)) {
            HttpSession session = req.getSession();
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", username);
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp); // Forward to show error
        }
    }
}