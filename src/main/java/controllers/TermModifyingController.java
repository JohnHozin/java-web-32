package controllers;

import db.DBServices;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TermModifyingController", urlPatterns = "/term-modifying")
public class TermModifyingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices dataBaseServices = new DBServices();
        Term selectedTerm = (Term) req.getSession().getAttribute("selectedTerm");
        List<Discipline> disciplines = dataBaseServices.getAllActiveDisciplines();
        req.getSession().setAttribute("disciplines", disciplines);
        String duration = selectedTerm.getDuration();
        req.setAttribute("duration", duration);
        req.setAttribute("disciplinesSize", disciplines.size());

        req.getRequestDispatcher("WEB-INF/term-modifying.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String duration = req.getParameter("duration");
        String idsDisciplines[] = req.getParameterValues("idsDisciplines");
        String id = ((Term) req.getSession().getAttribute("selectedTerm")).getId() + "";
        DBServices database = new DBServices();
        if (duration == null || duration.equals("") || idsDisciplines == null || idsDisciplines.equals("")) {
            req.setAttribute("Error", 1);
            req.getRequestDispatcher("WEB-INF/term-modifying.jsp").forward(req, resp);
            return;
        }
        database.modifyTerm(id, duration, idsDisciplines);
        resp.sendRedirect("/terms");
    }
}
