package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "comment", schema = "public", catalog = "d37tfeuqn9sfbb")
public class Comment {
    private int id;
    private String contentComment;
    private Timestamp createddate;
    private Timestamp modifieddate;
    private Timestamp timeComment;
    private Integer idFood;
    private Integer idUser;
    private Food food;
    private User user;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "content")
    public String getContentComment() {
        return contentComment;
    }

    public void setContentComment(String contentComment) {
        this.contentComment = contentComment;
    }

    @Basic
    @Column(name = "created_on")
    public Timestamp getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Timestamp createddate) {
        this.createddate = createddate;
    }

    @Basic
    @Column(name = "modified_on")
    public Timestamp getModifieddate() {
        return modifieddate;
    }

    public void setModifieddate(Timestamp modifieddate) {
        this.modifieddate = modifieddate;
    }

    @Basic
    @Column(name = "time")
    public Timestamp getTimeComment() {
        return timeComment;
    }

    public void setTimeComment(Timestamp timeComment) {
        this.timeComment = timeComment;
    }

    @Basic
    @Column(name = "food_id", insertable = false, updatable = false)
    public Integer getIdFood() {
        return idFood;
    }

    public void setIdFood(Integer idFood) {
        this.idFood = idFood;
    }

    @Basic
    @Column(name = "user_id" , insertable = false, updatable = false)
    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (id != comment.id) return false;
        if (contentComment != null ? !contentComment.equals(comment.contentComment) : comment.contentComment != null)
            return false;
        if (createddate != null ? !createddate.equals(comment.createddate) : comment.createddate != null) return false;
        if (modifieddate != null ? !modifieddate.equals(comment.modifieddate) : comment.modifieddate != null)
            return false;
        if (timeComment != null ? !timeComment.equals(comment.timeComment) : comment.timeComment != null) return false;
        if (idFood != null ? !idFood.equals(comment.idFood) : comment.idFood != null) return false;
        if (idUser != null ? !idUser.equals(comment.idUser) : comment.idUser != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (contentComment != null ? contentComment.hashCode() : 0);
        result = 31 * result + (createddate != null ? createddate.hashCode() : 0);
        result = 31 * result + (modifieddate != null ? modifieddate.hashCode() : 0);
        result = 31 * result + (timeComment != null ? timeComment.hashCode() : 0);
        result = 31 * result + (idFood != null ? idFood.hashCode() : 0);
        result = 31 * result + (idUser != null ? idUser.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "food_id", referencedColumnName = "id")
    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
