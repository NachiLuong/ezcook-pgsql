package com.ezcook.controllers.web.apis;

import com.ezcook.entities.Comment;
import com.ezcook.entities.User;
import com.ezcook.services.ICommentService;
import com.ezcook.services.impls.CommentService;
import com.ezcook.services.impls.FoodService;
import com.ezcook.utils.JsonToEntityUtil;
import com.ezcook.utils.PrintWriterUtil;
import com.ezcook.utils.SessionUtil;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet(urlPatterns = {"/api-comment"})
public class CommentAPI extends HttpServlet {

    private final ICommentService commentService = new CommentService();

    private final PrintWriterUtil printWriterUtil = new PrintWriterUtil();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        printWriterUtil.getInstance(resp);
        try {
            Comment comment = JsonToEntityUtil.of(req.getReader()).toModel(Comment.class);
            User user = (User) SessionUtil.getInstance().getValue(req, "user");
            comment.setUser(user);
            comment.setFood(new FoodService().findById(comment.getIdFood()));
            comment.setTime(Timestamp.from(Instant.now()));
            commentService.save(comment);
            printWriterUtil.println(true);
        } catch (Exception e) {
            printWriterUtil.println(false);
        }
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
