package controllers;

import db.DBServices;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermCreateController", urlPatterns = "/term-create")
public class TermCreateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices dataBaseServices = new DBServices();
        List<Discipline> disciplines = dataBaseServices.getAllActiveDisciplines();
        req.getSession().setAttribute("disciplines", disciplines);
        req.setAttribute("disciplinesSize", disciplines.size());
        req.getRequestDispatcher("WEB-INF/term-create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String duration = req.getParameter("duration");
        String idsDisciplines[] = req.getParameterValues("idsDisciplines");
        DBServices database = new DBServices();
        if (duration == null || duration.equals("") || idsDisciplines == null || idsDisciplines.equals("")) {
            req.setAttribute("Error", 1);
            req.getRequestDispatcher("WEB-INF/term-create.jsp").forward(req, resp);
            return;
        }
        database.createTerm(duration,idsDisciplines);
        resp.sendRedirect("/terms");
    }
}
