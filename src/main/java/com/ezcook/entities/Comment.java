package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "comment", schema = "public")
public class Comment {
    private Integer id;
    private String content;
    private Timestamp createdOn;
    private Timestamp modifiedOn;
    private Timestamp time;
    private Integer idFood;
    private Integer idUser;
    private Food food;
    private User user;
    public Comment() {

    }

    public Comment(String content, Timestamp time, Integer foodId, Integer userId) {
        this.content = content;
        this.time = time;
        this.idFood = foodId;
        this.idUser = userId;
    }

    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "content" , nullable = false)

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "created_on")
    public Timestamp getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Timestamp createdOn) {
        this.createdOn = createdOn;
    }

    @Basic
    @Column(name = "modified_on")
    public Timestamp getModifiedOn() {
        return modifiedOn;
    }

    public void setModifiedOn(Timestamp modifiedOn) {
        this.modifiedOn = modifiedOn;
    }

    @Basic
    @Column(name = "time" , nullable = false)
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
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
        if (!Objects.equals(content, comment.content))
            return false;
        if (!Objects.equals(createdOn, comment.createdOn)) return false;
        if (!Objects.equals(modifiedOn, comment.modifiedOn))
            return false;
        if (!Objects.equals(time, comment.time)) return false;
        if (!Objects.equals(idFood, comment.idFood)) return false;
        if (!Objects.equals(idUser, comment.idUser)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createdOn != null ? createdOn.hashCode() : 0);
        result = 31 * result + (modifiedOn != null ? modifiedOn.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
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