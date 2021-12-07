package com.ezcook.controllers.admin.food;

import com.ezcook.command.FoodCommand;
import com.ezcook.dtos.FoodDto;
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

@WebServlet(urlPatterns = {"/admin/food"})
public class FoodController extends HttpServlet {

    private static final Long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (SessionUtil.getInstance().getValue(req, "useradmin")!= null){
            resp.setContentType("text/html");
            resp.setCharacterEncoding("UTF-8");
            req.setCharacterEncoding("UTF-8");
            FoodCommand command = FormUtil.populate(FoodCommand.class, req);
            FoodDto pojo = command.getPojo();
            String search = req.getParameter("txt");
            List<FoodDto> foods;
            if (search == "" || search == null) {
                foods = SingletonServiceUtil.getFoodServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            } else {
                foods = SingletonServiceUtil.getFoodServiceInstance().paginationSearch(command.getPage(), command.getMaxPageItems(), search);
            }
            int sotrang;
            if (SingletonServiceUtil.getFoodServiceInstance().countFood() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems() + 1;

            command.setTotalItems(sotrang);

            req.setAttribute("foods", foods);
            checkMessage(req);
            req.setAttribute("pojo", command);
            RequestDispatcher rd = req.getRequestDispatcher("/views/admin/food/listFood.jsp");
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
        int sotrang;
        List<FoodDto> foods;
        Integer id = Integer.parseInt(req.getParameter("idDelete"));
        try {
            List ids = new ArrayList();
            ids.add(id);
            SingletonServiceUtil.getFoodServiceInstance().delete(ids);
            foods = SingletonServiceUtil.getFoodServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            if (SingletonServiceUtil.getFoodServiceInstance().countFood() % command.getMaxPageItems() == 0)
                sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems();
            else
                sotrang = SingletonServiceUtil.getFoodServiceInstance().countFood() / command.getMaxPageItems() + 1;
            command.setTotalItems(sotrang);
            req.setAttribute("messageResponse", "Xóa món ăn thành công");
        } catch (Exception e) {
            foods = SingletonServiceUtil.getFoodServiceInstance().pagination(command.getPage(), command.getMaxPageItems());
            req.setAttribute("messageResponse", "Xóa món ăn thất bại");
        }
        req.setAttribute("foods", foods);

        req.setAttribute("pojo", command);
        RequestDispatcher rd = req.getRequestDispatcher("/views/admin/food/listFood.jsp");
        rd.forward(req, resp);
    }

    public void checkMessage(HttpServletRequest request) {
        String message = request.getParameter("messageResponse");
        if(message != null) {
            if(message.trim().equals("updateSuss")) {
                request.setAttribute("messageResponse","Cập nhật món ăn thành công");
            } else if (message.trim().equals("addSuss")){
                request.setAttribute("messageResponse","Thêm món ăn thành công");
            } else if (message.trim().equals("fail")) {
                request.setAttribute("messageResponse","Thao tác thất bại");
            }
        }
    }
}