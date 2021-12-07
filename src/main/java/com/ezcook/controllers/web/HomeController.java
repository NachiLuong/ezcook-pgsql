package com.ezcook.controllers.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import com.ezcook.entities.FoodType;
import com.ezcook.services.IFoodService;

import com.ezcook.services.IFoodTypeService;
import com.ezcook.entities.Food;
import com.ezcook.utils.SessionUtil;
import com.ezcook.utils.SingletonServiceUtil;


@WebServlet(urlPatterns = {"/home", "/search"})
public class HomeController extends HttpServlet {

    private final IFoodService foodService = SingletonServiceUtil.getFoodServiceInstance();
    private final IFoodTypeService foodTypeService = SingletonServiceUtil.getFoodTypeServiceInstance();

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
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

        Random random1 = new Random();
        int foodTypeID1 = random1.nextInt(9) + 1;
        Random random2 = new Random();
        int foodTypeID2 = random2.nextInt(9) + 1;
        while (foodTypeID1 == foodTypeID2) {
            random2 = new Random();
            foodTypeID2 = random2.nextInt(9) + 1;
        }

        List<Food> listFoodNew = foodService.getListFoodNew(0, 6);
        req.setAttribute("listFoodNew", listFoodNew);

        List<Food> listFood1 = foodService.getListByFoodTypeIDAndLimit(foodTypeID1, 6);
        req.setAttribute("listFood1", listFood1);
        String nameListFood1 = foodTypeService.getNameFoodType(foodTypeID1);
        req.setAttribute("nameListFood1", nameListFood1);

        List<Food> listFood2 = foodService.getListByFoodTypeIDAndLimit(foodTypeID2, 6);
        req.setAttribute("listFood2", listFood2);
        String nameListFood2 = foodTypeService.getNameFoodType(foodTypeID2);
        req.setAttribute("nameListFood2", nameListFood2);

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
        rd.forward(req, resp);
       /* if (SessionUtil.getInstance().getValue(req, "user")!= null){

        }else {
            resp.sendRedirect("/login");
        }*/
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