package com.ezcook.controllers.login;


import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.RoleDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SessionUtil;
import com.ezcook.utils.SingletonServiceUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        IUserService userService = new UserService();
        boolean checkEmailAndUsername = SingletonServiceUtil.getUserServiceInstance().userUnique(pojo);
        try{
            if(checkEmailAndUsername){ //khong trung
                String name = req.getParameter("pojo.username");
                SingletonServiceUtil.getUserServiceInstance().saveUser(pojo);
                SessionUtil.getInstance().putValue(req, "user", userService.findByUsername(name));
                resp.sendRedirect("/home");
            }else {
//                req.setAttribute("messexist", WebConstant.USER_NOT_UNIQUE);
                resp.sendRedirect("/login?message=regisfail");

            }
        }catch (Exception e){
            throw e;
        }
    }
}
