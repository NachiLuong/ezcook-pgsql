package com.ezcook.controllers;

import com.ezcook.entities.User;
import com.ezcook.services.IUserService;
import com.ezcook.services.impls.UserService;
import com.ezcook.utils.GoogleUtil;
import com.ezcook.utils.SessionUtil;

//import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login-google"})
public class LoginGoogleController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

//    @Inject
    IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("action") == null) {
            String code = req.getParameter("code");

            if (code == null || code.isEmpty()) {
                RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                rd.forward(req, resp);
            } else {
                String access_token = GoogleUtil.getToken(code);
                User user = GoogleUtil.getUserInfo(access_token);
                int id;
                if (!userService.isExistEmail(user.getEmail())) {
                    userService.save(user);
                }
                id = userService.findOneByEmail(user.getEmail()).getId();
                SessionUtil.getInstance().putValue(req, "user", userService.findById(id));
                RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                rd.forward(req, resp);
            }
        } else {
            doDelete(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        SessionUtil.getInstance().remove(req, "user");
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
    }
}
