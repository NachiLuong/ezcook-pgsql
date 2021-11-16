package com.ezcook.controllers.admin;

import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.RequestUtil;
import com.ezcook.utils.SingletonServiceUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {"/admin-user-list"})
public class UserController extends HttpServlet {

    private static final Long serialVersionUID = 1L;
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        List<UserDto> users = SingletonServiceUtil.getUserServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
        int sotrang;
        if (SingletonServiceUtil.getUserServiceInstance().countUser() % command.getMaxPageItems() == 0)
            sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems();
        else
            sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems() + 1;
        command.setTotalItems(sotrang);

        req.setAttribute("users", users);
        req.setAttribute("pojo", command);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/listUser.jsp");
        rd.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }


    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}