package com.ezcook.controllers.login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/login/forgotpass"})
public class ForgotPassController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {

        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/forgotPass.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/forgotPass.jsp");
        rd.forward(req, resp);
    }
}
