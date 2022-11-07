/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import controller.auth.BaseRoleController;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import dal.TimeSlotDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import model.Account;
import model.Lecturer;
import model.Session;
import model.Student;
import model.TimeSlot;
import util.DateTimeHelper;

/**
 *
 * @author Administrator
 */
public class TimeTableController extends BaseRoleController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int stdid = Integer.parseInt(account.getId());
        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        java.sql.Date from = null;
        java.sql.Date to = null;
        if (raw_from == null || raw_from.length() == 0) {
            Date today = new Date();
            //get ra thứ hôm nay: trả về thứ 5
            int todayOfWeek = DateTimeHelper.getDayofWeek(today);
            //
            Date e_from = DateTimeHelper.addDays(today, 2 - todayOfWeek);
            Date e_to = DateTimeHelper.addDays(today, 8 - todayOfWeek);
            from = DateTimeHelper.toDateSql(e_from);
            to = DateTimeHelper.toDateSql(e_to);
        } else {
            from = java.sql.Date.valueOf(raw_from);
            to = java.sql.Date.valueOf(raw_to);
        }

        req.setAttribute("from", from);
        req.setAttribute("to", to);
        //get ra 1 list ngày từ from - to
        req.setAttribute("dates", DateTimeHelper.getDateList(from, to));

        TimeSlotDBContext slotDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = slotDB.list();
        req.setAttribute("slots", slots);

        SessionDBContext sesDB = new SessionDBContext();
        ArrayList<Session> sessions = sesDB.getSessionsForStudent(stdid, from, to);
        req.setAttribute("sessions", sessions);

        StudentDBContext studentDB = new StudentDBContext();
        Student student = studentDB.getStudentByStdid(stdid);
        req.setAttribute("student", student);
        req.getRequestDispatcher("../view/student/timetable.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

}
