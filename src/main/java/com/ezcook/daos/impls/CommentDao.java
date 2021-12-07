package com.ezcook.daos.impls;

import com.ezcook.daos.ICommentDao;
import com.ezcook.entities.Comment;

import java.sql.Timestamp;
import java.time.Instant;


public class CommentDao extends AbstractDao<Integer, Comment> implements ICommentDao {
    @Override
    public Comment update(Comment comment) {
        comment.setModifiedOn(Timestamp.from(Instant.now()));
        return super.update(comment);
    }

    @Override
    public void save(Comment comment) {
        comment.setCreatedOn(Timestamp.from(Instant.now()));
        comment.setModifiedOn(Timestamp.from(Instant.now()));
        super.save(comment);
    }
}
