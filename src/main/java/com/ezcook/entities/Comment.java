<<<<<<< HEAD:src/main/java/com/ezcook/entities/Comment.java
package com.ezcook.entities;
=======
package com.ezcook.entity;
import org.hibernate.annotations.Nationalized;
import org.hibernate.annotations.Type;
>>>>>>> 8eb3027fdeb4c0b0afb0bedf64a5833b754613fe:src/main/java/com/ezcook/entity/CommentEntity.java

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "commenttable")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_comment;

    @Column(name = "content_comment", length = 65000, columnDefinition ="TEXT")
    @Type(type="text")
    private String content_comment;

    @Column(name = "createddate")
    private Timestamp createdate;

    @Column(name = "modifieddate")
    private Timestamp modifieddate;

    @Column(name = "time_comment")
    private Timestamp time_comment;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    @ManyToOne
    @JoinColumn(name = "id_food")
    private Food food;

    public Integer getId_comment() {
        return id_comment;
    }

<<<<<<< HEAD:src/main/java/com/ezcook/entities/Comment.java
    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    public Timestamp getTime_comment() {
        return time_comment;
    }

    public void setTime_comment(Timestamp time_comment) {
        this.time_comment = time_comment;
    }

=======
>>>>>>> 8eb3027fdeb4c0b0afb0bedf64a5833b754613fe:src/main/java/com/ezcook/entity/CommentEntity.java
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

<<<<<<< HEAD:src/main/java/com/ezcook/entities/Comment.java
    public User getUser() {
=======
    public Timestamp getTime_comment() {
        return time_comment;
    }

    public void setTime_comment(Timestamp time_comment) {
        this.time_comment = time_comment;
    }

    public UserEntity getUser() {
>>>>>>> 8eb3027fdeb4c0b0afb0bedf64a5833b754613fe:src/main/java/com/ezcook/entity/CommentEntity.java
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
<<<<<<< HEAD:src/main/java/com/ezcook/entities/Comment.java
=======

    public FoodEntity getFood() {
        return food;
    }

    public void setFood(FoodEntity food) {
        this.food = food;
    }
>>>>>>> 8eb3027fdeb4c0b0afb0bedf64a5833b754613fe:src/main/java/com/ezcook/entity/CommentEntity.java
}
