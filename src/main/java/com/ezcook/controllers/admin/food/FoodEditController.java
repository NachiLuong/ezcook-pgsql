package com.ezcook.controllers.admin.food;

import com.ezcook.command.FoodCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.FoodDto;
import com.ezcook.dtos.FoodTypeDto;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SessionUtil;
import com.ezcook.utils.SingletonServiceUtil;
import com.ezcook.utils.beanUtils.FoodTypeBeanUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/food/edit"})
public class FoodEditController  extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "useradmin")!= null){
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            FoodCommand command = FormUtil.populate(FoodCommand.class, req);

            List<FoodTypeDto> foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().getAllFoodType();
            req.setAttribute("foodtypes", foodtypes);
            if (req.getParameter("foodId") != null) { //sua
                Integer id = Integer.valueOf(req.getParameter("foodId"));
                FoodDto dto = SingletonServiceUtil.getFoodServiceInstance().findEqualUnique("id", id);
                req.setAttribute("food", dto);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/food/edit.jsp");
            rd.forward(req, resp);
        }else {
            resp.sendRedirect("/login");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        FoodCommand command = FormUtil.populate(FoodCommand.class, req);

        FoodDto pojo = command.getPojo();
        Integer a = pojo.getId();
        String b= command.getFoodtype();
        FoodTypeDto foodTypeDto = SingletonServiceUtil.getFoodTypeServiceInstance().findEqualUnique("name", command.getFoodtype());
        pojo.setFoodTypeDto(foodTypeDto);
        List<FoodDto> foods = SingletonServiceUtil.getFoodServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
        int sotrang;
        if (SingletonServiceUtil.getFoodServiceInstance().countFood() % command.getMaxPageItems() == 0)
            sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems();
        else
            sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems() + 1;
        command.setTotalItems(sotrang);
        boolean checkEmailAndUsername = SingletonServiceUtil.getFoodServiceInstance().foodUnique(pojo);
        try {
            if (a != null && a != 0) { // sua
                SingletonServiceUtil.getFoodServiceInstance().updateFood(pojo);
                resp.sendRedirect("/admin/food?messageResponse=updateSuss");
            } else { //them
                if (checkEmailAndUsername) { //username hoac emai chua ton tai
                    SingletonServiceUtil.getFoodServiceInstance().saveFood(pojo);
                    resp.sendRedirect("/admin/food?messageResponse=addSuss");
                } else { //da ton tai
                    req.setAttribute("messexist", WebConstant.FOOD_NOT_UNIQUE);
                    List<FoodTypeDto> foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().getAllFoodType();
                    req.setAttribute("foodtypes", foodtypes);
                    RequestDispatcher rd = req.getRequestDispatcher("/views/admin/food/edit.jsp");
                    rd.forward(req, resp);
                }
            }
        } catch (Exception e) {
            resp.sendRedirect("/admin/food?messageResponse=fail");
        }
    }
}
