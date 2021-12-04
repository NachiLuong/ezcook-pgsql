package com.ezcook.controllers.login;


import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.UserDto;
import com.ezcook.utils.FormUtil;
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
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        boolean checkEmailAndUsername = SingletonServiceUtil.getUserServiceInstance().userUnique(pojo);
        try{
            if(checkEmailAndUsername){ //khong trung

                RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
                rd.forward(req, resp);
            }else {
                req.setAttribute("messexist", WebConstant.USER_NOT_UNIQUE);
                RequestDispatcher rd = req.getRequestDispatcher("/views/web/login.jsp");
                rd.forward(req, resp);
            }
        }catch (Exception e){
            throw e;
        }
    }
}
