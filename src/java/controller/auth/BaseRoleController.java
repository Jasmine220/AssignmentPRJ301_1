/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import model.Feature;
import model.Role;

/**
 *
 * @author Administrator
 */
public abstract class BaseRoleController extends BaseAuthenticationController {

    public boolean isAuthorized(HttpServletRequest req) {

        Account account = (Account) req.getSession().getAttribute("account");
        //current url
        String currentUrl = req.getServletPath();
        for (Role role : account.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                //compare currentUrl with url of feature for role of account
                if (feature.getUrl().equals(currentUrl)) {
                    return true;
                }
            }
        }
        return false;
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;

    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException;

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //if have authentication
        if (isAuthorized(req)) {
            processPost(req, resp, (Account) req.getSession().getAttribute("account"));
        }
        else{
             resp.getWriter().println("access denied!");
        }
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //if have authentication
        if (isAuthorized(req)) {
            processGet(req, resp, (Account) req.getSession().getAttribute("account"));
        }
        else{
             resp.getWriter().println("access denied!");
        }
    }

}
