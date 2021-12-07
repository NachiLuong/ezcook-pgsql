package com.ezcook.controllers.admin;

import com.ezcook.utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-home")
public class AdminController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        if (SessionUtil.getInstance().getValue(req, "useradmin")!= null){
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
            rd.forward(req, resp);
        }else {
            resp.sendRedirect("/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/home.jsp");
        rd.forward(req, resp);

    }
}
