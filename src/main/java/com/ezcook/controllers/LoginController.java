package com.ezcook.controllers;

import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.dtos.UserDto;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.FormUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

//    ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");
    ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        IUserService userService = new UserService();
        if (pojo != null) {
            CheckLogin login = userService.checkLogin(pojo.getUsername(), pojo.getPassword_user());
            if (login.isUserExist()) {
                if (login.getRoleName().equals(WebConstant.ROLE_ADMIN)) {
                    resp.sendRedirect("/admin-home");
                } else if (login.getRoleName().equals(WebConstant.ROLE_USER)) {
                    resp.sendRedirect("/home");
                }
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/views/admin/login.jsp");
                rd.forward(req, resp);
            }
        }
    }
}