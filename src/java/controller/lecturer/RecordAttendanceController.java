/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.auth.BaseRoleController;
import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Group;

/**
 *
 * @author Administrator
 */
public class RecordAttendanceController extends BaseRoleController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int subid = Integer.parseInt(req.getParameter("subid"));
        int lid = Integer.parseInt(req.getParameter("lid"));
        int gid = Integer.parseInt(req.getParameter("gid"));
        GroupDBContext DBGroup = new GroupDBContext();
        Group group = DBGroup.get(gid, subid, lid);
        req.setAttribute("group", group);
        req.getRequestDispatcher("/view/lecturer/recordattendance.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    processRequest(req, resp);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
    processRequest(req, resp);
    }

}
