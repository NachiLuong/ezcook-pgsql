package com.ezcook.controllers.admin.foodType;

import com.ezcook.command.FoodTypeCommand;
import com.ezcook.command.UserCommand;
import com.ezcook.constants.WebConstant;
import com.ezcook.dtos.FoodTypeDto;
import com.ezcook.dtos.RoleDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.utils.FormUtil;
import com.ezcook.utils.SessionUtil;
import com.ezcook.utils.SingletonServiceUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/foodtype/edit"})
public class FoodTypeEditController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "useradmin")!= null){
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            FoodTypeCommand command= FormUtil.populate(FoodTypeCommand.class, req);

            if (req.getParameter("foodtypeId") != null) { //sua
                Integer id = Integer.valueOf(req.getParameter("foodtypeId"));
                FoodTypeDto dto = SingletonServiceUtil.getFoodTypeServiceInstance().findEqualUnique("id", id);
                req.setAttribute("foodtype", dto);
            }
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/foodtype/edit.jsp");
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
        FoodTypeCommand command= FormUtil.populate(FoodTypeCommand.class, req);

        FoodTypeDto pojo = command.getPojo();
        Integer a = pojo.getId();
        List<FoodTypeDto> foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
        int sotrang;
        if (SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() % command.getMaxPageItems() == 0)
            sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems();
        else
            sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems() + 1;
        command.setTotalItems(sotrang);
        boolean checkName = SingletonServiceUtil.getFoodTypeServiceInstance().foodTypeUnique(pojo);
        try {
            if (a != null && a != 0) { // sua
                SingletonServiceUtil.getFoodTypeServiceInstance().updateFoodType(pojo);
                resp.sendRedirect("/admin/foodtype?messageResponse=updateSuss");
            } else { //them
                if (checkName) { //username hoac emai chua ton tai
                    SingletonServiceUtil.getFoodTypeServiceInstance().saveFoodType(pojo);
                    resp.sendRedirect("/admin/foodtype?messageResponse=addSuss");
                } else { //da ton tai
                    req.setAttribute("messexist", WebConstant.FOODTYPE_NOT_UNIQUE);
                    RequestDispatcher rd = req.getRequestDispatcher("/views/admin/foodtype/edit.jsp");
                    rd.forward(req, resp);
                }
            }
        } catch (Exception e) {
            resp.sendRedirect("/admin/foodtype?messageResponse=fail");
        }
    }

}
