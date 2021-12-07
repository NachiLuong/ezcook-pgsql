package com.ezcook.controllers.admin.user;

import com.ezcook.command.UserCommand;
import com.ezcook.dtos.UserDto;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/user"})
public class UserController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "useradmin") != null) {
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            UserCommand command = FormUtil.populate(UserCommand.class, req);
            UserDto pojo = command.getPojo();
            String search = req.getParameter("txt");
            List<UserDto> users;
            if (search == "" || search == null) {
                users = SingletonServiceUtil.getUserServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            } else {
                users = SingletonServiceUtil.getUserServiceInstance().paginationSearch(command.getPage(), command.getMaxPageItems(), search);
            }
            int sotrang;
            if (SingletonServiceUtil.getUserServiceInstance().countUser() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems() + 1;

            command.setTotalItems(sotrang);

            req.setAttribute("users", users);
            checkMessage(req);
            req.setAttribute("pojo", command);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/listUser.jsp");
            rd.forward(req, resp);

        } else {
            resp.sendRedirect("/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        UserCommand command = FormUtil.populate(UserCommand.class, req);
        UserDto pojo = command.getPojo();
        int sotrang;
        List<UserDto> users;
        Integer id = Integer.parseInt(req.getParameter("idDelete"));
        try {
            List ids = new ArrayList();
            ids.add(id);
            SingletonServiceUtil.getUserServiceInstance().delete(ids);
            users = SingletonServiceUtil.getUserServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            if (SingletonServiceUtil.getUserServiceInstance().countUser() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getUserServiceInstance().countUser() / command.getMaxPageItems() + 1;
            command.setTotalItems(sotrang);
            req.setAttribute("messageResponse", "Xóa tài khoản thành công");
        } catch (Exception e) {
            users = SingletonServiceUtil.getUserServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            req.setAttribute("messageResponse", "Xóa tài khoản thất bại");
        }
        req.setAttribute("users", users);

        req.setAttribute("pojo", command);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/user/listUser.jsp");
        rd.forward(req, resp);
    }

    public void checkMessage(HttpServletRequest request) {
        String message = request.getParameter("messageResponse");
        if (message != null) {
            if (message.trim().equals("updateSuss")) {
                request.setAttribute("messageResponse", "Cập nhật tài khoản thành công");
            } else if (message.trim().equals("addSuss")) {
                request.setAttribute("messageResponse", "Thêm tài khoản thành công");
            } else if (message.trim().equals("fail")) {
                request.setAttribute("messageResponse", "Thao tác thất bại");
            }
        }
    }
}