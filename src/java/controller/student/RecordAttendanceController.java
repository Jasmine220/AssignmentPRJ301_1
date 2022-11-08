/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import controller.auth.BaseRoleController;
import dal.GroupDBContext;
import dal.SessionDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Account;
import model.Group;
import model.Session;

/**
 *
 * @author Administrator
 */
public class RecordAttendanceController extends BaseRoleController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int subid = Integer.parseInt(req.getParameter("subid"));
        int stdid = Integer.parseInt(req.getParameter("stdid"));
        SessionDBContext sessionDB = new SessionDBContext();
        ArrayList<Session> sessions = sessionDB.getStatusForStudent(subid, stdid);
        req.setAttribute("sessions", sessions);
        req.getRequestDispatcher("/view/student/recordattendance.jsp").forward(req, resp);

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
