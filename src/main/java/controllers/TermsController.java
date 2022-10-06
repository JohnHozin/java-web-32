package controllers;

import db.DBServices;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermsController", urlPatterns = "/terms")
public class TermsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices dataBaseServices = new DBServices();
        List<Term> terms = dataBaseServices.getAllActiveTerms();
        req.setAttribute("terms", terms);
        req.getRequestDispatcher("WEB-INF/terms.jsp").forward(req, resp);
    }
}
