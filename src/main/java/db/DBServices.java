package db;

import constants.Constants;
import entity.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBServices implements IDBServices {
    @Override
    public List<Discipline> getAllActiveDisciplines() {
        ArrayList<Discipline> disciplines = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from discipline where status = '1'");
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    @Override
    public void createDiscipline(String discipline) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `discipline` (`discipline`) VALUES ('" + discipline + "');");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Discipline getDisciplineById(String id) {
        Discipline discipline = new Discipline();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from discipline where id = ('" + id + "');");

            while (rs.next()) {
                discipline.setId(rs.getInt("id"));
                discipline.setDiscipline(rs.getString("discipline"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discipline;
    }

    @Override
    public void modifyDiscipline(String id, String newDiscipline) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `discipline` SET `discipline` = ('" + newDiscipline + "') WHERE (`id` = ('" + id + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteDiscipline(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `discipline` SET `status` = '0' WHERE (`id` = ('" + id + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> getAllActiveStudent() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student where status = '1'");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                students.add(student);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public void createStudent(String surname, String name, String group, String date) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO `students_32`.`student` (`surname`, `name`, `group`, `date`) VALUES (('" + surname + "'), ('" + name + "'), ('" + group + "'), ('" + date + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Student getStudentById(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from student where id = ('" + id + "');");

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setSurname(rs.getString("surname"));
                student.setName(rs.getString("name"));
                student.setGroup(rs.getString("group"));
                student.setDate(rs.getDate("date"));
                return student;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void modifyStudent(String id, String newSurname, String newName, String newGroup, String newDate) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `surname` = ('" + newSurname + "'), `name` = ('" + newName + "'), `group` = ('" + newGroup + "')," +
                    " `date` = ('" + newDate + "') WHERE (`id` = ('" + id + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE `student` SET `status` = '0' WHERE (`id` = ('" + id + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Term> getAllActiveTerms() {
        ArrayList<Term> terms = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from term where status = '1'");
            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));

                // ?????????????? ?????????????????? ????????????????????
                String id = rs.getInt("id") + "";
                term.setDisciplines(getDisciplinesByTerm(id));
                terms.add(term);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return terms;
    }

    @Override
    public List<Discipline> getDisciplinesByTerm(String idTerm) {
        ArrayList<Discipline> disciplines = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term_discipline as td\n" +
                    "left join discipline as d on td.id_discipline = d.id\n" +
                    "where d.status = '1' and td.id_term = " + idTerm);
            while (rs.next()) {
                Discipline discipline = new Discipline();
                discipline.setId(rs.getInt("id_discipline"));
                discipline.setDiscipline(rs.getString("discipline"));
                disciplines.add(discipline);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return disciplines;
    }

    @Override
    public void createTerm(String duration, String idsDisciplines[]) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term order by id desc limit 1");
            String termNames = "";
            String idTerm = "";
            while (rs.next()) {
                idTerm = (rs.getInt("id") + 1) + "";
            }
            rs = stmt.executeQuery("SELECT * FROM term where status = '1' order by id desc limit 1");
            while (rs.next()) {
                String termName = rs.getString("term").split(" ")[0];
                int termNumber = Integer.parseInt(rs.getString("term").split(" ")[1]) + 1;
                termNames = termName + " " + termNumber;
            }
            stmt.execute("INSERT INTO term (`term`, `duration`) VALUES (('" + termNames + "'), ('" + duration + "'));");
            for (String ids : idsDisciplines) {
                stmt.execute("INSERT INTO term_discipline (`id_term`, `id_discipline`) VALUES (('" + idTerm + "'), ('" + ids + "'));");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Term getTermById(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from term where status = '1' and id = " + id);

            while (rs.next()) {
                Term term = new Term();
                term.setId(rs.getInt("id"));
                term.setTerm(rs.getString("term"));
                term.setDuration(rs.getString("duration"));

                String idTerm = rs.getInt("id") + "";
                term.setDisciplines(getDisciplinesByTerm(idTerm));
                return term;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void modifyTerm(String id, String newDuration, String newIdsDisciplines[]) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE term SET `duration` = ('" + newDuration + "') WHERE `id` = " + id);
            stmt.execute("DELETE FROM term_discipline WHERE `id_term` = " + id);
            for (String ids : newIdsDisciplines) {
                stmt.execute("INSERT INTO  term_discipline (`id_term`, `id_discipline`) VALUES (('" + id + "'), ('" + ids + "'));");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteTerm(String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("UPDATE term SET status = '0' WHERE (`id` = ('" + id + "'));");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Mark> getMarks(String idStud, String idTerm) {
        ArrayList<Mark> marks = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM mark as m left join term_discipline as td on m.id_term_discipline = td.id left join discipline as d on td.id_discipline = d.id where d.status = '1' and td.id_term = '" + idTerm + "' and m.id_student = '" + idStud + "'");
            while (rs.next()) {
                Mark mark = new Mark();
                Discipline discipline = new Discipline();
                Term term = new Term();
                discipline.setDiscipline(rs.getString("discipline"));
                mark.setDiscipline(discipline);
                term.setTerm(rs.getString("id_term"));
                mark.setTerm(term);
                mark.setMark(rs.getInt("mark"));
                marks.add(mark);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return marks;
    }

    @Override
    public List<Role> getAllActiveRoles() {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from role");

            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("id"));
                role.setRole(rs.getString("role"));
                roles.add(role);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return roles;
    }

    @Override
    public boolean canLogin(String login, String password, String idRole) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM user_role as ur\n" +
                    "LEFT JOIN user as u ON ur.id_user = u.id\n" +
                    "WHERE u.login = '" + login + "' AND u.password = '" + password + "' AND ur.id_role = " + idRole);

            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void setMarks(String idStud, String idTerm_Discipline, String mark){
        ArrayList<Mark> marks = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            stmt.execute("INSERT INTO mark (`id_student`, `id_term_discipline`, `mark`) VALUES ('" + idStud + "', '" + idTerm_Discipline + "', '" + mark + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getIdTerm_Discipline(String idTerm, String idDiscipline){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constants.URL_TO_DB, Constants.LOGIN_TO_DB, Constants.PASSWORD_TO_DB);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM term_discipline as td where td.id_term = '" + idTerm + "' and td.id_discipline = '" + idDiscipline + "'");
            while (rs.next()) {
                return rs.getInt("id") + "";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
