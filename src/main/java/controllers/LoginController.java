package controllers;

import db.DBServices;
import entity.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginController", urlPatterns = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);

        DBServices dataBaseServices = new DBServices();
        List<Role> roles = dataBaseServices.getAllActiveRoles();
        req.setAttribute("roles", roles);
        req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String role = req.getParameter("role");
        String login = req.getParameter("login");
        String password = req.getParameter("password");

        DBServices services = new DBServices();
        if(login == null || login.equals("")|| password == null || password.equals("")){
            req.setAttribute("Error", 1);
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
            return;
        }

        if (services.canLogin(login,password,role)){
            req.getSession().setAttribute("isLogin", true);
            req.getSession().setAttribute("role", role);
            req.getSession().setAttribute("login", login);
            resp.sendRedirect("/");
        }
        else{
            req.setAttribute("ErrorLogin", 1);
            req.getRequestDispatcher("WEB-INF/login.jsp").forward(req, resp);
        }

    }
}
