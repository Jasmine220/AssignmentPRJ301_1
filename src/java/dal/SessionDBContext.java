/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attandance;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.Student;
import model.Subject;
import model.TimeSlot;

/**
 *
 * @author Administrator
 */
public class SessionDBContext extends DBContext<Session> {

    public ArrayList<Session> getStatusForStudent(int subid, int stdid) {
        
        try {
            ArrayList<Session> sessions = new ArrayList<>();
            String sql = "SELECT s.stdname, s.stdid, ses.[date],ses.[index], ses.tid, t.[description], r.rname,\n"
                    + "	l.lname, g.gname, ses.attanded,isnull(a.[description],'') [description] \n,a.present"
                    + "  FROM [Session] ses  \n"
                    + "  inner join [Group] g on ses.gid = g.gid\n"
                    + "  inner join [Subject] sub on sub.subid = g.subid\n"
                    + "  inner join [Student_Group] sg on sg.gid = g.gid\n"
                    + "  inner join [Student] s on sg.stdid = s.stdid\n"
                    + "  inner join [TimeSlot] t on t.tid = ses.tid\n"
                    + "  inner join [Room] r on r.rid = ses.rid\n"
                    + "  inner join [Lecturer] l on l.lid = ses.lid\n"
                    + " left join [Attandance] a on a.sesid = ses.sesid and s.stdid = a.stdid\n"
                    + "  where sub.subid = ? and s.stdid = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subid);
            stm.setInt(2, stdid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Session ses= new Session();
                Group g = new Group();
                Subject sub = new Subject();
                Student std= new Student();
                TimeSlot t = new TimeSlot();
                Room r = new Room();
                Lecturer l = new Lecturer();
                Attandance a = new Attandance();
                //set student
                std.setId(rs.getInt("stdid"));
                std.setName(rs.getString("stdname"));
                g.getStudents().add(std);
                //set group
                g.setName(rs.getString("gname"));
                ses.setGroup(g);
                //set session(date)(index)(attendance)
                ses.setDate(rs.getDate("date"));
                ses.setIndex(rs.getInt("index"));
                ses.setAttanded(rs.getBoolean("attanded"));
                //set slot
                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString(6));
                ses.setSlot(t);
                //set room
                r.setName(rs.getString("rname"));
                ses.setRoom(r);
                //set lecturer
                l.setName(rs.getString("lname"));
                ses.setLecturer(l);
                //set attandance(description)
                a.setDescription(rs.getString(11));
                a.setPresent(rs.getBoolean("present"));
                ses.getAtts().add(a);
                sessions.add(ses);
            }
            return sessions;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Session> filterByGidAndLid(int gid, int lid) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {

            String sql = "SELECT ses.sesid, g.gid, ses.rid, ses.[date], ses.tid, ses.[index], ses.lid, ses.attanded, g.gname,\n"
                    + "g.subid, g.sem, g.[year], s.stdid, s.stdname, sub.subname, t.description, r.rname, l.lname\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "INNER JOIN Student_Group stg on g.gid = stg.gid\n"
                    + "INNER JOIN Student s ON stg.stdid = s.stdid\n"
                    + "INNER JOIN [Subject] sub ON g.subid = sub.subid\n"
                    + "INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "where ses.gid = ? and ses.lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            stm.setInt(2, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                Group group = new Group();
                Subject subject = new Subject();
                Room room = new Room();
                TimeSlot timeslot = new TimeSlot();
                Lecturer lecturer = new Lecturer();
                //id
                session.setId(rs.getInt("sesid"));
                //group
                group.setId(rs.getInt("gid"));
                group.setName(rs.getString("gname"));
                session.setGroup(group);
                //room
                room.setId(rs.getInt("rid"));
                room.setName(rs.getString("rname"));
                session.setRoom(room);
                //lecturer
                lecturer.setId(rs.getInt("lid"));
                lecturer.setName(rs.getString("lname"));
                session.setLecturer(lecturer);
                //slot
                timeslot.setId(rs.getInt("tid"));
                timeslot.setDescription(rs.getString("description"));
                session.setSlot(timeslot);
                //date
                session.setDate(rs.getDate("date"));
                //index
                session.setIndex(rs.getInt("index"));
                //attanded
                session.setAttanded(rs.getBoolean("attanded"));
                sessions.add(session);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;

    }

    public ArrayList<Session> getSessionsForStudent(int stdid, Date from, Date to) {
        try {
            ArrayList<Session> sessions = new ArrayList<>();
            String sql = "SELECT  ses.sesid, ses.tid, t.[description], \n"
                    + "      ses.rid, r.rname, ses.lid, ses.[index],\n"
                    + "	  ses.gid, g.gname, sub.subid, sub.subname, ses.[date],\n"
                    + "	  st.stdid, st.stdname, ses.attanded"
                    + "  FROM [Session] ses\n"
                    + "  left join [TimeSlot] t on t.tid = ses.tid\n"
                    + "  left join [Room] r on r.rid = ses.rid\n"
                    + "  left join [Group] g on ses.gid = g.gid\n"
                    + "  left join [Subject] sub on sub.subid = g.subid\n"
                    + "  left join [Student_Group] sg on sg.gid = g.gid\n"
                    + "  left join [Student] st on st.stdid = sg.stdid\n"
                    + "  where st.stdid = ? and ses.[date] >= ? \n"
                    + "  and ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, stdid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                Student std = new Student();
                Room r = new Room();
                Group g = new Group();
                TimeSlot t = new TimeSlot();
                Subject sub = new Subject();

                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setAttanded(rs.getBoolean("attanded"));

                std.setId(rs.getInt("stdid"));
                std.setName(rs.getString("stdname"));
                g.getStudents().add(std);

                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                session.setRoom(r);

                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                session.setSlot(t);

                sessions.add(session);
            }
            return sessions;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Session> filterByLidAndDate(int lid, Date from, Date to) {
        ArrayList<Session> sessions = new ArrayList<>();
        try {
            String sql = "SELECT  \n"
                    + "	ses.sesid,ses.[date],ses.[index],ses.attanded\n"
                    + "	,l.lid,l.lname\n"
                    + "	,g.gid,g.gname\n"
                    + "	,sub.subid,sub.subname\n"
                    + "	,r.rid,r.rname\n"
                    + "	,t.tid,t.[description]\n"
                    + "FROM [Session] ses \n"
                    + "			INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "			INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "			INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "			INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "			INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "WHERE\n"
                    + "l.lid = ?\n"
                    + "AND ses.[date] >= ?\n"
                    + "AND ses.[date] <= ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Session session = new Session();
                Lecturer l = new Lecturer();
                Room r = new Room();
                Group g = new Group();
                TimeSlot t = new TimeSlot();
                Subject sub = new Subject();

                session.setId(rs.getInt("sesid"));
                session.setDate(rs.getDate("date"));
                session.setIndex(rs.getInt("index"));
                session.setAttanded(rs.getBoolean("attanded"));

                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                session.setLecturer(l);

                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                session.setGroup(g);

                sub.setId(rs.getInt("subid"));
                sub.setName(rs.getString("subname"));
                g.setSubject(sub);

                r.setId(rs.getInt("rid"));
                r.setName(rs.getString("rname"));
                session.setRoom(r);

                t.setId(rs.getInt("tid"));
                t.setDescription(rs.getString("description"));
                session.setSlot(t);

                sessions.add(session);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sessions;
    }

    @Override
    public void insert(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Session model) {
        try {
            connection.setAutoCommit(false);
            String sql = "UPDATE [Session] SET attanded = 1 WHERE sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getId());
            stm.executeUpdate();

            //remove old attandances
            sql = "DELETE Attandance WHERE sesid = ?";
            PreparedStatement stm_delete = connection.prepareStatement(sql);
            stm_delete.setInt(1, model.getId());
            stm_delete.executeUpdate();

            //insert new attandances
            for (Attandance att : model.getAtts()) {
                sql = "INSERT INTO [Attandance]\n" +
"                                   ([sesid]\n" +
"                                   ,[stdid]\n" +
"                                   ,[present]\n" +
"                                   ,[description]\n" +
"                                   ,[record_time])\n" +
"                             VALUES\n" +
"                                   (?\n" +
"                                   ,?\n" +
"                                   ,?\n" +
"                                   ,?\n" +
"                                   ,GETDATE())";
                PreparedStatement stm_insert = connection.prepareStatement(sql);
                stm_insert.setInt(1, model.getId());
                stm_insert.setInt(2, att.getStudent().getId());
                stm_insert.setBoolean(3, att.isPresent());
                stm_insert.setString(4, att.getDescription());
                stm_insert.executeUpdate();
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void delete(Session model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Session get(int id) {
        try {
            String sql = "SELECT ses.sesid,ses.[index],ses.date,ses.attanded\n"
                    + "                    ,g.gid,g.gname, g.sem, g.year\n"
                    + "                    ,r.rid,r.rname\n"
                    + "                    ,t.tid,t.[description] tdescription\n"
                    + "                    ,l.lid,l.lname\n"
                    + "                    ,sub.subid,sub.subname\n"
                    + "                    ,s.stdid,s.stdname\n"
                    + "                    ,ISNULL(a.present,0) present, ISNULL(a.[description],'') [description]\n ,a.record_time"
                    + "                    FROM [Session] ses\n"
                    + "                    INNER JOIN Room r ON r.rid = ses.rid\n"
                    + "                    INNER JOIN TimeSlot t ON t.tid = ses.tid\n"
                    + "                    INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "                    INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "                    INNER JOIN [Subject] sub ON sub.subid = g.subid\n"
                    + "                    INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "                    INNER JOIN [Student] s ON s.stdid = sg.stdid\n"
                    + "                    LEFT JOIN Attandance a ON s.stdid = a.stdid AND ses.sesid = a.sesid\n"
                    + "                    WHERE ses.sesid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Session ses = null;
            while (rs.next()) {
                if (ses == null) {
                    ses = new Session();
                    //set room
                    Room r = new Room();
                    r.setId(rs.getInt("rid"));
                    r.setName(rs.getString("rname"));
                    ses.setRoom(r);

                    TimeSlot t = new TimeSlot();
                    t.setId(rs.getInt("tid"));
                    t.setDescription(rs.getString("tdescription"));
                    ses.setSlot(t);
                    //set lecturer
                    Lecturer l = new Lecturer();
                    l.setId(rs.getInt("lid"));
                    l.setName(rs.getString("lname"));
                    ses.setLecturer(l);
                    //set group
                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));
                    g.setSem(rs.getString("sem"));
                    g.setYear(rs.getInt("year"));
                    ses.setGroup(g);
                    //set subject
                    Subject sub = new Subject();
                    sub.setId(rs.getInt("subid"));
                    sub.setName(rs.getString("subname"));
                    g.setSubject(sub);
                    //set date
                    ses.setDate(rs.getDate("date"));
                    //set index
                    ses.setIndex(rs.getInt("index"));
                    //set attandance
                    ses.setAttanded(rs.getBoolean("attanded"));

                }
                //read student
                Student s = new Student();
                s.setId(rs.getInt("stdid"));
                s.setName(rs.getString("stdname"));
                //read attandance
                Attandance a = new Attandance();
                a.setStudent(s);
                a.setSession(ses);
                a.setPresent(rs.getBoolean("present"));
                a.setDescription(rs.getString("description"));
                a.setRecord_time(rs.getTimestamp("record_time"));
                ses.getAtts().add(a);
            }
            return ses;
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Session> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
