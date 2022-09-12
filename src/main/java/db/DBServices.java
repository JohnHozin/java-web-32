package db;

import entity.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBServices implements IDBServices{
    @Override
    public List<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from discipline where status = '1'");

            while (rs.next()){
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return disciplines;
    }

    @Override
    public void createDiscipline(String discipline) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + discipline + "');");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Discipline getDisciplineById(String id) {
        Discipline discipline = new Discipline();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from discipline where id = ('" + id + "');");

            while (rs.next()){
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return discipline;
    }

    @Override
    public void modifyDiscipline(String id, String newDiscipline) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `discipline` SET `discipline` = ('" + newDiscipline + "') WHERE (`id` = ('" + id + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteDiscipline(String id) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `discipline` SET `status` = '0' WHERE (`id` = ('" + id + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> getAllActiveStudent() {
        ArrayList<Student> students = new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student where status = '1'");

            while (rs.next()){
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                students.add(student);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public void createStudent(String surname, String name, String group, String date) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `students_32`.`student` (`surname`, `name`, `group`, `date`) VALUES (('" + surname + "'), ('" + name + "'), ('" + group + "'), ('" + date + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public Student getStudentById(String id) {
        Student student = new Student();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student where id = ('" + id + "');");

            while (rs.next()){
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
            }
            System.out.println(student);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return student;
    }

    @Override
    public void modifyStudent(String id, String newSurname, String newName, String newGroup, String newDate) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `surname` = ('" + newSurname + "'), `name` = ('" + newName + "'), `group` = ('" + newGroup + "')," +
                    " `date` = ('" + newDate + "') WHERE (`id` = ('" + id + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(String id) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `status` = '0' WHERE (`id` = ('" + id + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Term> getAllActiveTerms() {  // надо доделать!!!
        ArrayList<Term> terms = new ArrayList<>();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from term where status = '1'");

            while (rs.next()){
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));
                terms.add(term);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return terms;
    }

    @Override
    public List<Discipline> getDisciplinesByTerm(String idTerm) {
        return null;
    }

    @Override
    public void createTerm(String duration, String idsDisciplines) {

    }

    @Override
    public Term getTermById(String id) {
        return null;
    }

    @Override
    public void modifyTerm(String id, String newDuration, String newIdsDisciplines) {

    }

    @Override
    public void deleteTerm(String id) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_32", "root", "BGLeAvfNQ7e7");
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `term` SET `status` = '0' WHERE (`id` = ('" + id + "'));");
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Mark> getMarks(String idStud, String idTerm) {
        return null;
    }

    @Override
    public List<Role> getAllActiveRoles() {
        return null;
    }

    @Override
    public boolean canLogin(String login, String password, String idRole) {
        return false;
    }
}