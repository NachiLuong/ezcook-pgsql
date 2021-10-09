package com.ezcook.entity;
import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "commenttable")
public class CommentEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_comment;

    @Column(name = "content_comment")
    private String content_comment;

    @Column(name = "createddate")
    private Timestamp createdate;

    @Column(name = "modifieddate")
    private Timestamp modifieddate;

    @Column(name = "time_comment")
    private Timestamp time_comment;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private UserEntity user;

    @ManyToOne
    @JoinColumn(name = "id_food")
    private FoodEntity food;

    public Integer getId_comment() {
        return id_comment;
    }

    public FoodEntity getFood() {
        return food;
    }

    public void setFood(FoodEntity food) {
        this.food = food;
    }

    public Timestamp getTime_comment() {
        return time_comment;
    }

    public void setTime_comment(Timestamp time_comment) {
        this.time_comment = time_comment;
    }

    public void setId_comment(Integer id_comment) {
        this.id_comment = id_comment;
    }

    public String getContent_comment() {
        return content_comment;
    }

    public void setContent_comment(String content_comment) {
        this.content_comment = content_comment;
    }

    public Timestamp getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Timestamp createdate) {
        this.createdate = createdate;
    }

    public Timestamp getModifieddate() {
        return modifieddate;
    }

    public void setModifieddate(Timestamp modifieddate) {
        this.modifieddate = modifieddate;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }


}
