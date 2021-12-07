package com.ezcook.controllers.web;

import com.ezcook.entities.Food;
import com.ezcook.entities.FoodType;
import com.ezcook.services.ICommonService;
import com.ezcook.services.IFoodService;
import com.ezcook.services.IFoodTypeService;
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

@WebServlet(urlPatterns = {"/blog"})
public class BlogController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    private final IFoodService foodService = SingletonServiceUtil.getFoodServiceInstance();

    private final ICommonService commonService = SingletonServiceUtil.getCommonServiceInstance();
    private final IFoodTypeService foodTypeService = SingletonServiceUtil.getFoodTypeServiceInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      if (SessionUtil.getInstance().getValue(req, "user")!= null){
          List<FoodType> listFoodType = foodTypeService.findAll();
          req.setAttribute("listFoodType", listFoodType);

          List<Food> foodsResult = null;
          String key = "";
          boolean isSearch = false;

          if (req.getServletPath().equals("/search")) {
              key = req.getParameter("key");
              foodsResult = foodService.findAllByKey(key);
              isSearch = true;
          }

          req.setAttribute("foodsResult", foodsResult == null ? new ArrayList<>() : foodsResult);
          req.setAttribute("isSearch", isSearch);
          req.setAttribute("key", key);
          int idFood = 0;
          try {
              idFood = Integer.parseInt(req.getParameter("id"));
          } catch (Exception e) {
              e.printStackTrace();
          }

          req.setAttribute("food", foodService.findById(idFood));
          req.setAttribute("fService", foodService);
          req.setAttribute("cservice", commonService);

          RequestDispatcher rd = req.getRequestDispatcher("/views/web/blog.jsp");
          rd.forward(req, resp);
      }else {
          resp.sendRedirect("/login");
      }

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
