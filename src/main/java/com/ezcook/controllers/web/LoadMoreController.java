package com.ezcook.controllers.web;

import com.ezcook.daos.impls.FoodDao;
import com.ezcook.entities.Food;
import com.ezcook.services.impls.FoodService;
import com.ezcook.utils.SessionUtil;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet(urlPatterns = {"/loadMoreHome", "/loadMoreCategory"})
public class LoadMoreController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "user")!= null){
            if (req.getServletPath().equals("/loadMoreHome")) {
                int count = Integer.parseInt(req.getParameter("count"));
                FoodDao foodDao = new FoodDao();
                FoodService cs = new FoodService();
                List<Food> listFoodNew = foodDao.getListFoodNew(count, 6);
                //PrintWriter out=resp.getWriter();
                ServletOutputStream out = resp.getOutputStream();
                for (Food food : listFoodNew) {
                  //  ("<a href=\"" + cc + "\"")
                    String cc= "/blog?id=" + food.getId();
                    out.write("<div class=\"food item text-center\">\n".getBytes(StandardCharsets.UTF_8));

                    out.write(("<a href=\"/blog?id=" + food.getId() + "\">").getBytes(StandardCharsets.UTF_8));
                   /* out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write(">".getBytes(StandardCharsets.UTF_8));*/

                    out.write("<img src=\"".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getImage().getBytes(StandardCharsets.UTF_8));
                    out.write("\" alt=\"".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getName().getBytes(StandardCharsets.UTF_8));
                    out.write("\"/></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<div>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<span>Ezook <i class=\"fal fa-utensils-alt\"></i> Đồ uống</span>\n".getBytes(StandardCharsets.UTF_8));

                    out.write(("<a href=\"/blog?id=" + food.getId() + "\">").getBytes(StandardCharsets.UTF_8));
                   /* out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write(">".getBytes(StandardCharsets.UTF_8));*/

                    out.write("<h5>".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getName().getBytes(StandardCharsets.UTF_8));
                    out.write("</h5>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<span class=\"author\">by <a href=\"<c:url value='/#'/>\">Ezcook</a></span>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<p id=\"demo\"></p>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<hr>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<p class=\"content-food\">".getBytes(StandardCharsets.UTF_8));
                    out.write(cs.getTextBetweenTags("p", food.getContent()).getBytes(StandardCharsets.UTF_8));
                    out.write("</p>\n".getBytes(StandardCharsets.UTF_8));

                    out.write(("<a href=\"/blog?id=" + food.getId() + "\">").getBytes(StandardCharsets.UTF_8));
                    /*out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write("\">Xem tiếp...</a>\n".getBytes(StandardCharsets.UTF_8));*/

                    out.write("<div class=\"social-icon\">\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-facebook-f\"></i></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-google-plus-g\"></i></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-twitter\"></i></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<a href=\"<c:url value='/#'/>\"><i class=\"fab fa-instagram\"></i></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</div>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</div>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</div>".getBytes(StandardCharsets.UTF_8));
                }
            }
            else
            {
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
                    out.write("<div class=\"food content\">\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<div class=\"image\">".getBytes(StandardCharsets.UTF_8));

                    out.write(("<a href=\"/blog?id=" + food.getId() + "\">").getBytes(StandardCharsets.UTF_8));
                    /*out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write(">".getBytes(StandardCharsets.UTF_8));*/

                    out.write("<img src=\"".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getImage().getBytes(StandardCharsets.UTF_8));
                    out.write("\" alt=\"".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getName().getBytes(StandardCharsets.UTF_8));
                    out.write("\"/></a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</div>".getBytes(StandardCharsets.UTF_8));
                    out.write("<div class=\"item text-center\">\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<span>Ezook <i class=\"fal fa-utensils-alt\"></i>".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getFoodtype().getName().getBytes(StandardCharsets.UTF_8));
                    out.write("</span>\n".getBytes(StandardCharsets.UTF_8));

                    out.write(("<a href=\"/blog?id=" + food.getId() + "\">").getBytes(StandardCharsets.UTF_8));
                    /*out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write(">".getBytes(StandardCharsets.UTF_8));*/

                    out.write("<h5>".getBytes(StandardCharsets.UTF_8));
                    out.write(food.getName().getBytes(StandardCharsets.UTF_8));
                    out.write("</h5>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</a>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<span class=\"author\">written by <a href=\"<c:url value='/#'/>\">Ezcook | </a></span>\n".getBytes(StandardCharsets.UTF_8));
                    out.write(cs.formatTime(food.getCreatedOn()).getBytes(StandardCharsets.UTF_8));
                    out.write("<p id=\"demo\"></p>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<hr>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<p class=\"food-content\">".getBytes(StandardCharsets.UTF_8));
                    out.write(cs.getTextBetweenTags("p", food.getContent()).getBytes(StandardCharsets.UTF_8));
                    out.write("</p>\n".getBytes(StandardCharsets.UTF_8));

                    out.write("<a href=\"/blog?id=".getBytes(StandardCharsets.UTF_8));
                    out.write(String.valueOf(food.getId()).getBytes("UTF-8"));
                    out.write("\">Xem tiếp...</a>\n".getBytes(StandardCharsets.UTF_8));

                    out.write("</div>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("</div>\n".getBytes(StandardCharsets.UTF_8));
                    out.write("<hr>".getBytes(StandardCharsets.UTF_8));
                }
            }
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