package com.ezcook.controllers.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

import com.ezcook.daos.impls.FoodDao;
import com.ezcook.entities.FoodType;
import com.ezcook.services.impls.FoodService;
import com.ezcook.daos.impls.FoodTypeDao;
import com.ezcook.services.impls.FoodTypeService;
import com.ezcook.entities.Food;
import java.util.List;
import java.util.Collections;
import java.util.Random;


@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        FoodTypeDao foodTypeDao=new FoodTypeDao();
        List<FoodType> listFoodType=foodTypeDao.findAll();
        req.setAttribute("listFoodType",listFoodType);

        Random random1=new Random();
        int foodTypeID1= random1.nextInt(9)+1;
        Random random2=new Random();
        int foodTypeID2= random2.nextInt(9)+1;
        while (foodTypeID1==foodTypeID2)
        {
            random2=new Random();
            foodTypeID2= random2.nextInt(9)+1;
        }


        FoodDao foodDao=new FoodDao();

        List <Food> listFoodNew=foodDao.getListFoodNew(0,6);
        req.setAttribute("listFoodNew",listFoodNew);

        List <Food> listFood1=foodDao.getListByFoodTypeIDAndLimit(foodTypeID1,6);
        req.setAttribute("listFood1",listFood1);
        String nameListFood1=foodTypeDao.getNameFoodType(foodTypeID1);
        req.setAttribute("nameListFood1",nameListFood1);

        List <Food> listFood2=foodDao.getListByFoodTypeIDAndLimit(foodTypeID2,6);
        req.setAttribute("listFood2",listFood2);
        String nameListFood2=foodTypeDao.getNameFoodType(foodTypeID2);
        req.setAttribute("nameListFood2",nameListFood2);

        RequestDispatcher rd = req.getRequestDispatcher("/views/web/home.jsp");
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