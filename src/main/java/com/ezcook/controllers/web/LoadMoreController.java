package com.ezcook.controllers.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.Collection;

import com.ezcook.daos.impls.FoodDao;
import com.ezcook.entities.FoodType;
import com.ezcook.services.impls.FoodService;
import com.ezcook.daos.impls.FoodTypeDao;
import com.ezcook.services.impls.FoodTypeService;
import com.ezcook.entities.Food;

import java.util.List;
import java.io.PrintStream;
import java.util.Collections;
import java.util.Random;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = {"/loadMoreHome", "/loadMoreCategory"})
public class LoadMoreController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html;charset=UTF-8");
        //PrintStream out = new PrintStream(System.out, true, "UTF-8");
//        req.setCharacterEncoding("UTF-8");
//        resp.setCharacterEncoding("UTF-8");
//        resp.setContentType("text/html; charset=UTF-8");
        if (req.getServletPath().equals("/loadMoreHome")) {
            int count = Integer.parseInt(req.getParameter("count"));
            FoodDao foodDao = new FoodDao();
            FoodService cs = new FoodService();
            List<Food> listFoodNew = foodDao.getListFoodNew(count, 6);
            //PrintWriter out=resp.getWriter();
            ServletOutputStream out = resp.getOutputStream();
            for (Food food : listFoodNew) {
                out.write("<div class=\"food item text-center\">\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\">\n".getBytes("UTF-8"));
                out.write("<img src=\"".getBytes("UTF-8"));
                out.write(food.getImage().getBytes("UTF-8"));
                out.write("\" alt=\"".getBytes("UTF-8"));
                out.write(food.getName().getBytes("UTF-8"));
                out.write("\"/></a>\n".getBytes("UTF-8"));
                out.write("<div>\n".getBytes("UTF-8"));
                out.write("<span>Ezook <i class=\"fal fa-utensils-alt\"></i> Đồ uống</span>\n".getBytes("UTF-8"));
                out.write(" <a href=\"<c:url value='/#'/>\">\n".getBytes("UTF-8"));
                out.write("<h5>".getBytes("UTF-8"));
                out.write(food.getName().getBytes("UTF-8"));
                out.write("</h5>\n".getBytes("UTF-8"));
                out.write("</a>\n".getBytes("UTF-8"));
                out.write("<span class=\"author\">by <a href=\"<c:url value='/#'/>\">Ezcook</a></span>\n".getBytes("UTF-8"));
                out.write("<p id=\"demo\"></p>\n".getBytes("UTF-8"));
                out.write("\n".getBytes("UTF-8"));
                out.write("<hr>\n".getBytes("UTF-8"));
                out.write("<p class=\"content-food\">".getBytes("UTF-8"));
                out.write(cs.getTextBetweenTags("p", food.getContent()).getBytes("UTF-8"));
                out.write("</p>\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\">Xem tiếp...</a>\n".getBytes("UTF-8"));
                out.write("<div class=\"social-icon\">\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-facebook-f\"></i></a>\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-google-plus-g\"></i></a>\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-twitter\"></i></a>\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-instagram\"></i></a>\n".getBytes("UTF-8"));
                out.write("</div>\n".getBytes("UTF-8"));
                out.write("</div>\n".getBytes("UTF-8"));
                out.write("</div>".getBytes("UTF-8"));
            }
        }
        else
        {
//            FoodDao foodDao = new FoodDao();
//            String id = req.getParameter("id");
//            long foodTypeID = Long.parseLong(id);
//            int count = Integer.parseInt(req.getParameter("count"));
//            List <Food> listFood = foodDao.getListByFoodTypeIDAndCount(foodTypeID,count,6);
//
            String id = (String) req.getSession().getAttribute("id");
            System.out.println(id);
            long foodTypeID = Long.parseLong(id);
            int count = Integer.parseInt(req.getParameter("count"));
            FoodDao foodDao = new FoodDao();
            FoodService cs = new FoodService();
            List<Food> listFood = foodDao.getListByFoodTypeIDAndCount(foodTypeID,count,6);
            //PrintWriter out=resp.getWriter();
            ServletOutputStream out = resp.getOutputStream();
            for (Food food : listFood) {
                out.write("<div class=\"food content\">\n".getBytes("UTF-8"));
                out.write("<div class=\"image\">".getBytes(StandardCharsets.UTF_8));
                out.write("<a href=\"<c:url value='/blog'/>\">\n".getBytes("UTF-8"));
                out.write("<img src=\"".getBytes("UTF-8"));
                out.write(food.getImage().getBytes("UTF-8"));
                out.write("\" alt=\"".getBytes("UTF-8"));
                out.write(food.getName().getBytes("UTF-8"));
                out.write("\"/></a>\n".getBytes("UTF-8"));
                out.write("</div>".getBytes(StandardCharsets.UTF_8));
                out.write("<div class=\"item text-center\">\n".getBytes("UTF-8"));
                out.write("<span>Ezook <i class=\"fal fa-utensils-alt\"></i>".getBytes(StandardCharsets.UTF_8));
                out.write(food.getFoodtype().getName().getBytes(StandardCharsets.UTF_8));
                out.write("</span>\n".getBytes("UTF-8"));
                out.write(" <a href=\"<c:url value='/#'/>\">\n".getBytes("UTF-8"));
                out.write("<h5>".getBytes("UTF-8"));
                out.write(food.getName().getBytes("UTF-8"));
                out.write("</h5>\n".getBytes("UTF-8"));
                out.write("</a>\n".getBytes("UTF-8"));
                out.write("<span class=\"author\">written by <a href=\"<c:url value='/#'/>\">Ezcook | </a></span>\n".getBytes("UTF-8"));
                out.write(cs.formatTime(food.getCreatedOn()).getBytes(StandardCharsets.UTF_8));
                out.write("<p id=\"demo\"></p>\n".getBytes("UTF-8"));
                out.write("\n".getBytes("UTF-8"));
                out.write("<hr>\n".getBytes("UTF-8"));
                out.write("<p class=\"food-content\">".getBytes("UTF-8"));
                out.write(cs.getTextBetweenTags("p", food.getContent()).getBytes("UTF-8"));
                out.write("</p>\n".getBytes("UTF-8"));
                out.write("<a href=\"<c:url value='/#'/>\">Xem tiếp...</a>\n".getBytes("UTF-8"));
                out.write("</div>\n".getBytes("UTF-8"));
                out.write("</div>\n".getBytes("UTF-8"));
                out.write("<hr>".getBytes("UTF-8"));
            }
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