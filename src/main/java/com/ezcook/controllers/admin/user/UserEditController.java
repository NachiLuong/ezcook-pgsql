package com.ezcook.controllers.admin.user;

import com.ezcook.command.UserCommand;
import com.ezcook.dtos.RoleDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SingletonServiceUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-user-list/edit"})
public class UserEditController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        List<RoleDto> roles = SingletonServiceUtil.getRoleServiceInstance().getAllRole();
        req.setAttribute("roles", roles);
        if (req.getParameter("userId") != null) { //sua
            Integer id = Integer.valueOf(req.getParameter("userId"));
            UserDto dto = SingletonServiceUtil.getUserServiceInstance().findEqualUnique("id", id);
            req.setAttribute("user", dto);
        }
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/edit.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        Integer a = pojo.getId_user();
        RoleDto roleDto = RoleBeanUtil.entity2Dto(SingletonServiceUtil.getRoleServiceInstance().findEqualUnique("name", command.getRole()));
        pojo.setRoleDto(roleDto);
        try {
            if (a != null && a != 0) { // sua
                SingletonServiceUtil.getUserServiceInstance().updateUser(pojo);
                req.setAttribute("messageResponse", "Cập nhật tài khoản thành công");
            } else { //them
                SingletonServiceUtil.getUserServiceInstance().saveUser(pojo);
                req.setAttribute("messageResponse", "Thêm tài khoản thành công");
            }
        } catch (Exception e) {
            req.setAttribute("messageResponse", "Thao tác thất bại");
        }
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
}