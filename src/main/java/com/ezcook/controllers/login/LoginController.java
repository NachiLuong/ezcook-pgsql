package com.ezcook.controllers.login;

import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ResourceBundle;
@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    private static final Long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        try {
            if (req.getParameter("action").equals("logout")){
                SessionUtil.getInstance().remove(req,"user");
                SessionUtil.getInstance().remove(req,"useradmin");
            }
        }catch (Exception e){
        }

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/login.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        String name= req.getParameter("username");
        String pass= req.getParameter("password");

        IUserService userService = new UserService();
        if (name !=null && pass !=null) {
            CheckLogin login = userService.checkLogin(name, pass);
            if (login.isUserExist()) {
                if (login.getRoleName().equals(WebConstant.ROLE_ADMIN)) {
                    SessionUtil.getInstance().putValue(req, "useradmin", userService.findByUsername(name));
                    resp.sendRedirect("/admin-home");
                } else if (login.getRoleName().equals(WebConstant.ROLE_USER)) {
                    SessionUtil.getInstance().putValue(req, "user", userService.findByUsername(name));
                    resp.sendRedirect("/home");
                }
            } else {
                req.setAttribute("messageResponse", "Tài khoản hoặc mật khẩu sai");
                RequestDispatcher rd = req.getRequestDispatcher("/views/admin/login.jsp");
                rd.forward(req, resp);
            }
        }
    }
}
