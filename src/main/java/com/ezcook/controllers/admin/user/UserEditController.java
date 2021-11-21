package com.ezcook.controllers.admin.user;

import com.ezcook.command.UserCommand;
import com.ezcook.dtos.RoleDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.SingletonServiceUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-user-list/edit"})
public class UserEditController extends HttpServlet {

    private static final Long serialVersionUID = 1L;
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        List<RoleDto> roles= SingletonServiceUtil.getRoleServiceInstance().getAllRole();
        req.setAttribute("roles", roles);
        if(req.getParameter("userId")!=null) {
            Integer id = Integer.valueOf(req.getParameter("userId"));
            UserDto dto = SingletonServiceUtil.getUserServiceInstance().findEqualUnique("id", id);
            req.setAttribute("user",dto);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/edit.jsp");
        rd.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        if (pojo.getId_user() !=null){ // sua
            RoleDto roleDto= RoleBeanUtil.entity2Dto(SingletonServiceUtil.getRoleServiceInstance().findEqualUnique("name", command.getRole()));
            pojo.setRoleDto(roleDto);
            SingletonServiceUtil.getUserServiceInstance().updateUser(pojo);
            resp.sendRedirect("/admin-user-list");
        }
    }
}