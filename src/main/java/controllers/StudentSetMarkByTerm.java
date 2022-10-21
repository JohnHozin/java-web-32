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

@WebServlet(name = "StudentSetMarkByTerm", urlPatterns = "/set-mark")
public class StudentSetMarkByTerm extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DBServices services = new DBServices();
        String idStud = (String) req.getSession().getAttribute("choicenStudent");
        String idTerm = ((Term) req.getSession().getAttribute("selectedTerm")).getId() + "";
        List<Discipline> disciplinesByTerm = services.getDisciplinesByTerm(idTerm);
        for (Discipline d:disciplinesByTerm){
            String discipline = "mark " + d.getDiscipline();
            String mark = req.getParameter(discipline);
            String idTerm_Discipline = services.getIdTerm_Discipline(idTerm, d.getId()+ "");
            services.setMarks(idStud,idTerm_Discipline,mark);
        }
        resp.sendRedirect("/student-set-mark");
    }
}
