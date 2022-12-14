package db;

import entity.*;

import java.util.List;

public interface IDBServices {

    List<Discipline> getAllActiveDisciplines();

    void createDiscipline(String discipline);

    Discipline getDisciplineById(String id);

    void modifyDiscipline(String id, String newDiscipline);

    void deleteDiscipline(String id);

    List<Student> getAllActiveStudent();

    void createStudent(String surname, String name, String group, String date);

    Student getStudentById(String id);

    void modifyStudent(String id, String newSurname, String newName, String newGroup, String newDate);

    void deleteStudent(String id);

    List<Term> getAllActiveTerms();

    List<Discipline> getDisciplinesByTerm(String idTerm);

    // 1,2,4,7,9
    void createTerm(String duration, String idsDisciplines[]);

    Term getTermById(String id);

    void modifyTerm(String id, String newDuration, String newIdsDisciplines[]);

    void deleteTerm(String id);

    List<Mark> getMarks(String idStud, String idTerm);

    List<Role> getAllActiveRoles();

    boolean canLogin(String login, String password, String idRole);




}
