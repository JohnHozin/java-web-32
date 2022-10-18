package controllers;

import db.DBServices;
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

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenProgress");
        DBServices services = new DBServices();
        Student student;
        if (id != null){
            student = services.getStudentById(id);
            // если добавить студента в сессию нужно ли будет его оттуда удалять?
            req.getSession().setAttribute("student", student);
            req.getSession().setAttribute("choicenStudent", student.getId()+ "");
        } else {
            id = (String) req.getSession().getAttribute("choicenStudent");
            student = services.getStudentById(id);
        }

        List<Term> terms = services.getAllActiveTerms();
        req.setAttribute("terms", terms);

        String idSelectedTerm = req.getParameter("idSelectedTerm");
        Term selectedTerm = null;
        if (idSelectedTerm == null) {
            if (terms.size() != 0) {
                selectedTerm = terms.get(0);
            }
        } else {
            selectedTerm = services.getTermById(idSelectedTerm);
        }
        req.setAttribute("selectedTerm", selectedTerm);
        List<Mark> marks = services.getMarks(student.getId() + "", selectedTerm.getId() + "");
        req.setAttribute("marks", marks);
        double middleMark =0;
        for(int i=0;i<marks.size();i++){
            middleMark += marks.get(i).getMark();
        }
        middleMark= middleMark/marks.size();
        req.setAttribute("middleMark", String.format("%.1f",middleMark));

        req.getRequestDispatcher("WEB-INF/student-progress.jsp").forward(req, resp);
    }

}
