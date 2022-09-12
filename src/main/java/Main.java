import db.DBServices;
import entity.Discipline;
import entity.Student;
import entity.Term;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        DBServices services = new DBServices();
        //List<Discipline> disciplines = services.getAllActiveDisciplines();
        //services.createDiscipline("Java construct3242");
        //services.getDisciplineById("2");
        //services.modifyDiscipline("7","Java pomp");
        //services.deleteDiscipline("2");

        //List<Student> students = services.getAllActiveStudent();
        //services.createStudent("qwerty1","asdfg2","kt-01","2021-09-01 00:00:00.000");
        //services.getStudentById("2");
        //services.modifyStudent("6","qwerty45645","asdfg","kt-01","2021-09-01 00:00:00.000");
        //services.deleteStudent("7");

        //List<Term> terms = services.getAllActiveTerms();
        System.out.println();


    }
}
