package com.ezcook.controllers.web;

import com.ezcook.daos.impls.FoodDao;
import com.ezcook.daos.impls.FoodTypeDao;
import com.ezcook.entities.Food;
import com.ezcook.entities.FoodType;
import com.ezcook.utils.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws SecurityException, IOException, ServletException {
        if (SessionUtil.getInstance().getValue(req, "user")!= null){
            FoodTypeDao foodTypeDao=new FoodTypeDao();
            List<FoodType> listFoodType=foodTypeDao.findAll();
            FoodDao foodDao=new FoodDao();
            String id = req.getParameter("id");
            req.getSession().setAttribute("id",id);
            long foodTypeID = Long.parseLong(id);
            List <Food> listFood = foodDao.getListByFoodTypeIDAndLimit(foodTypeID,6);
            req.setAttribute("listFood",listFood);
            String nameListFood=foodTypeDao.getNameFoodType(foodTypeID);
            req.setAttribute("nameListFood",nameListFood);

            RequestDispatcher rd=req.getRequestDispatcher("/views/web/category.jsp");
            rd.forward(req,resp);
        }else {
            resp.sendRedirect("/login");
        }


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws SecurityException, IOException, ServletException {
//        super.doPost(req, resp);
        RequestDispatcher rd=request.getRequestDispatcher("/views/web/category.jsp");
        rd.forward(request,response);

    }
}
