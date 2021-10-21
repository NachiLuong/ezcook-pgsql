package com.ezcook.controllers;

import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.dtos.UserDto;
import com.ezcook.services.UserService;
import com.ezcook.services.serviceimpls.UserServiceImpl;
import com.ezcook.utils.FormUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
//    ResourceBundle bundle = ResourceBundle.getBundle("ApplicationResources");

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws SecurityException, IOException, ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/login.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws SecurityException, IOException, ServletException {
        UserCommand command = FormUtil.populate(UserCommand.class, request);
        UserDto pojo = command.getPojo();
        UserService userService = new UserServiceImpl();
        if (pojo != null) {
            CheckLogin login = userService.checkLogin(pojo.getUsername(), pojo.getPassword_user());
            if (login.isUserExist()) {
                if (login.getRoleName().equals(WebConstant.ROLE_ADMIN)) {
                    response.sendRedirect("/admin-home");
                } else if (login.getRoleName().equals(WebConstant.ROLE_USER)) {
                    response.sendRedirect("/home");
                }
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("/views/admin/login.jsp");
                rd.forward(request, response);
            }
        }
    }
}