package controllers;

import db.DBServices;
import entity.Discipline;
import entity.Student;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "StudentModifyingController", urlPatterns = "/student-modify")
public class StudentModifyingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("hiddenModify");
        DBServices services = new DBServices();
        Student student = services.getStudentById(id);

        req.setAttribute("student", student);
        req.getRequestDispatcher("WEB-INF/student-modifying.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String surname = req.getParameter("surname");
        String name = req.getParameter("name");
        String group = req.getParameter("group");
        String dateFromUser = req.getParameter("date");

        DBServices database = new DBServices();
        DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
        Date date;
        try {
            date = format.parse(dateFromUser);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        // Date to String
        Format formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateToDataBase = formatter.format(date);

        database.modifyStudent(id, surname, name, group, dateToDataBase);
        resp.sendRedirect("/students");
    }
}
