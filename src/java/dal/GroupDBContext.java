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
import model.Group;
import model.Session;
import model.Student;
import model.Subject;

/**
 *
 * @author Administrator
 */
public class GroupDBContext extends DBContext<Group> {

    public ArrayList<Group> getGroupsForStudent(int stdid) {
        try {
            String sql = "SELECT g.sem, g.[year], sub.subname, sub.subid\n"
                    + "  FROM [Student] s \n"
                    + "  inner join [Student_Group] sg on s.stdid = sg.stdid\n"
                    + "  inner join [Group] g on g.gid = sg.gid\n"
                    + "  inner join [Subject] sub on sub.subid = g.subid\n"
                    + "  where s.stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            ResultSet rs = stm.executeQuery();
            ArrayList<Group> groups = new ArrayList<>();
            while (rs.next()) {
                Group group = new Group();
                Subject sub = new Subject();
                //set sem
                group.setSem(rs.getString("sem"));
                //set year
                group.setYear(rs.getInt("year"));
                //set subject
                sub.setName(rs.getString("subname"));
                sub.setId(rs.getInt("subid"));
                group.setSubject(sub);
                groups.add(group);
            }
            return groups;
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Group get(int gid, int subid, int lid) {
        try {
            String sql = "SELECT distinct ses.sesid, g.sem, g.[year], g.gid, sub.subid, ses.lid\n" +
"                     FROM [Session] ses\n" +
"                     inner JOIN [Group] g ON ses.gid = g.gid\n" +
"                     INNER JOIN Student_Group sg ON sg.gid = g.gid\n" +
"                     INNER JOIN Student s ON s.stdid = sg.stdid\n" +
"                     INNER JOIN [Subject] sub ON sub.subid = g.subid\n" +
"                     WHERE g.gid = ? and sub.subid = ? and ses.lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, subid);
            stm.setInt(3, lid);
            Group group = new Group();
            //set gid 
            group.setId(gid);
            //get sessions
            ArrayList<Session> sessions = new ArrayList<>();
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SessionDBContext DBSes = new SessionDBContext();
                Session session = DBSes.get(rs.getInt("sesid"));
                sessions.add(session);
                //set sem
                group.setSem(rs.getString("sem"));
                //set year
                group.setYear(Integer.parseInt(rs.getString("year")));

            }
            //set sessions
            group.setSessions(sessions);

            //set groupname
//            if (sessions. != null) {
                String name = sessions.get(0).getGroup().getName();
                group.setName(name);
//            }

            //set students 
            StudentDBContext DBStudent = new StudentDBContext();
            ArrayList<Student> students = DBStudent.getStudentsByGid(gid);
            group.setStudents(students);
            return group;

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Group> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
