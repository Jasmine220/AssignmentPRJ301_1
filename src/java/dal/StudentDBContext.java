/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;

/**
 *
 * @author Administrator
 */
public class StudentDBContext extends DBContext<Student> {

    public Student getStudentByStdid(int stdid) {
        try {
            String sql = "SELECT stdid,stdname FROM Student WHERE stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            //get student
            Student student = new Student();
            while (rs.next()) {
                student.setId(rs.getInt("stdid"));
                student.setName(rs.getString("stdname"));
            }
            return student;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Student> getStudentsByGid(int gid) {
        try {
            String sql = "SELECT DISTINCT s.stdid,s.stdname\n"
                    + "                    FROM [Session] ses\n"
                    + "                   LEFT JOIN [Group] g ON g.gid = ses.gid\n"
                    + "                    INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "                    	INNER JOIN Student s ON sg.stdid = s.stdid\n"
                    + "                    WHERE g.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            //get students
            ArrayList<Student> students = new ArrayList<>();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("stdid"));
                student.setName(rs.getString("stdname"));
                students.add(student);
            }
            return students;
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
