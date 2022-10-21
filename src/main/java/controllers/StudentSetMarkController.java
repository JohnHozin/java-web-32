package controllers;

import db.DBServices;
import entity.Discipline;
import entity.Mark;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentSetMarkController", urlPatterns = "/student-set-mark")
public class StudentSetMarkController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = (String) req.getSession().getAttribute("choicenStudent");
        DBServices services = new DBServices();
        Student student = services.getStudentById(id);

        List<Term> terms = services.getAllActiveTerms();
        req.setAttribute("terms", terms);

        String idSelectedTerm = req.getParameter("idSelectedTerm");
        //Term selectedTerm = (Term) req.getSession().getAttribute("selectedTerm");
        Term selectedTerm = null;
        if (idSelectedTerm == null) {
            if (terms.size() != 0) {
                selectedTerm = (Term) req.getSession().getAttribute("selectedTerm");
                if (selectedTerm == null){
                    selectedTerm = terms.get(0);
                }
            }
        } else {
            selectedTerm = services.getTermById(idSelectedTerm);
        }
        req.getSession().setAttribute("selectedTerm", selectedTerm);

        List<Discipline> disciplinesByTerm = services.getDisciplinesByTerm(selectedTerm.getId() + "");
        req.setAttribute("disciplinesByTerm", disciplinesByTerm);

        List<Mark> marks = services.getMarks(student.getId() + "", selectedTerm.getId() + "");
        req.setAttribute("marks", marks);
        if (marks.size() == 0) {
            req.setAttribute("middleMark", "нет оценок");
        } else {
            double middleMark = 0;
            for (int i = 0; i < marks.size(); i++) {
                middleMark += marks.get(i).getMark();
            }
            middleMark = middleMark / marks.size();
            req.setAttribute("middleMark", String.format("%.1f", middleMark));
        }
        req.getRequestDispatcher("WEB-INF/student-set-mark.jsp").forward(req, resp);
    }
}
