package controllers;

import db.DBServices;
import entity.Discipline;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DisciplineModifyingController", urlPatterns = "/discipline-modifying")
public class DisciplineModifyingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenModifyDiscipline");
        DBServices services = new DBServices();
        Discipline discipline = services.getDisciplineById(id);

        req.setAttribute("discipline", discipline);
        req.getRequestDispatcher("WEB-INF/discipline-modifying.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String discipline = req.getParameter("discipline");

        DBServices database = new DBServices();
        database.modifyDiscipline(id, discipline);
        resp.sendRedirect("/disciplines");
    }
}
