package com.ezcook.controllers.web;

import com.ezcook.services.ICommonService;
import com.ezcook.services.IFoodService;
import com.ezcook.utils.SingletonServiceUtil;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/blog"})
public class BlogController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    private final IFoodService foodService = SingletonServiceUtil.getFoodServiceInstance();

    private final ICommonService commonService = SingletonServiceUtil.getCommonServiceInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int idFood = 0;
        try {
            idFood = Integer.parseInt(req.getParameter("id"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("food", foodService.findById(idFood));
        req.setAttribute("fService", foodService);
        req.setAttribute("cs", commonService);

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/blog.jsp");
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
