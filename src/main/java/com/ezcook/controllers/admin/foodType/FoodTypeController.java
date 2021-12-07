package com.ezcook.controllers.admin.foodType;

import com.ezcook.command.FoodTypeCommand;
import com.ezcook.dtos.FoodTypeDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.utils.FormUtil;
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

@WebServlet(urlPatterns = {"/admin/foodtype"})
public class FoodTypeController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "useradmin")!= null){
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            FoodTypeCommand command= FormUtil.populate(FoodTypeCommand.class, req);

            FoodTypeDto pojo= command.getPojo();
            String search = req.getParameter("txt");
            List<FoodTypeDto> foodtypes;
            if (search == "" || search == null) {
                foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            } else {
                foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().paginationSearch(command.getPage(), command.getMaxPageItems(), search);
            }
            int sotrang;
            if (SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems() + 1;

            command.setTotalItems(sotrang);

            req.setAttribute("foodtypes", foodtypes);
            checkMessage(req);
            req.setAttribute("pojo", command);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/foodtype/listFoodType.jsp");
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

        FoodTypeDto pojo= command.getPojo();
        int sotrang;
        List<FoodTypeDto> foodtypes;
        Integer id = Integer.parseInt(req.getParameter("idDelete"));
        try {
            List ids = new ArrayList();
            ids.add(id);
            SingletonServiceUtil.getFoodTypeServiceInstance().delete(ids);
            foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            if (SingletonServiceUtil.getUserServiceInstance().countUser() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getFoodTypeServiceInstance().countFoodType() / command.getMaxPageItems() + 1;
            command.setTotalItems(sotrang);
            req.setAttribute("messageResponse", "Xóa loại thức ăn thành công");
        } catch (Exception e) {
            foodtypes = SingletonServiceUtil.getFoodTypeServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            req.setAttribute("messageResponse", "Xóa loại thức ăn thất bại");
        }
        req.setAttribute("foodtypes", foodtypes);
        req.setAttribute("pojo", command);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/foodtype/listFoodType.jsp");
        rd.forward(req, resp);
    }

    public void checkMessage(HttpServletRequest request) {
        String message = request.getParameter("messageResponse");
        if(message != null) {
            if(message.trim().equals("updateSuss")) {
                request.setAttribute("messageResponse","Cập nhật loại thức ăn thành công");
            } else if (message.trim().equals("addSuss")){
                request.setAttribute("messageResponse","Thêm loại thức ăn thành công");
            } else if (message.trim().equals("fail")) {
                request.setAttribute("messageResponse","Thao tác thất bại");
            }
        }
    }
}