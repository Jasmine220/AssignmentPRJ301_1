/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import dal.AccountDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Role;

/**
 *
 * @author Administrator
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountDBContext accountDB = new AccountDBContext();
        Account account = accountDB.get(username, password);
        //if account not valid
        if (account == null) {

            resp.sendRedirect("login");
//            req.getRequestDispatcher("/view/student/login.jsp").forward(req, resp);

        } else {
            req.getSession().setAttribute("account", account);
            //get role
            Role role = account.getRoles().get(0);
            //if have role, phan quyen
            if (role != null) {
                if (role.getId() == 2) {
                    resp.sendRedirect("student/home");
//                    req.getRequestDispatcher("/view/student/home.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("lecturer/home");
                }
            } else {
                resp.getWriter().println("This account doesn't have any role");
            }
        }

    }

}
