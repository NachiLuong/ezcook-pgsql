package com.ezcook.services.impls;

import com.ezcook.daos.ICommentDao;
import com.ezcook.daos.impls.CommentDao;
import com.ezcook.entities.Comment;
import com.ezcook.services.ICommentService;

public class CommentService implements ICommentService {
    private final ICommentDao commentDao = new CommentDao();
    @Override
    public void save(Comment comment) {
        commentDao.save(comment);
    }
}
