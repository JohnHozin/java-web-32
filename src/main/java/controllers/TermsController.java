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

@WebServlet(name = "TermsController", urlPatterns = "/terms")
public class TermsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1 - все активные семестры
        // 2 - понять какой семестр выбранный, и его передать на отображение
        // 3 - вытянуть все дисциплины по выбранному семестру

        DBServices dataBaseServices = new DBServices();
        List<Term> terms = dataBaseServices.getAllActiveTerms();
        req.setAttribute("terms", terms);

        String idSelectedTerm = req.getParameter("idSelectedTerm");
        Term selectedTerm = null;
        if (idSelectedTerm == null) {
            if (terms.size() != 0){
                //selectedTerm = terms.get(0);
                selectedTerm = (Term) req.getSession().getAttribute("selectedTerm");
                if (selectedTerm == null){
                    selectedTerm = terms.get(0);
                }
            }
        } else {
            selectedTerm = dataBaseServices.getTermById(idSelectedTerm);
        }
        req.getSession().setAttribute("selectedTerm", selectedTerm);
        List<Discipline> disciplines = dataBaseServices.getDisciplinesByTerm(selectedTerm.getId() + "");
        req.setAttribute("disciplines", disciplines);

        req.getRequestDispatcher("WEB-INF/terms.jsp").forward(req, resp);
    }
}
