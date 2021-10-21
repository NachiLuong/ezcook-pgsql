package com.ezcook.entity;

import org.hibernate.annotations.Nationalized;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "food")
public class FoodEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_food;

    @Column(name = "name_food")
    private String name_food;

    @Column(name = "image")
    private String image;


    @Column(name = "content_food", length = 65000, columnDefinition ="TEXT")
    @Type(type="text")
    private String content_food;

    @Column(name = "link_video")
    private String link_video;

    @Column(name = "createddate")
    private Timestamp createdate;

    @Column(name = "modifieddate")
    private Timestamp modifieddate;

    @ManyToOne
    @JoinColumn(name = "id_foodtype")
    private FoodTypeEntity foodtype;

    @OneToMany(mappedBy = "food", fetch = FetchType.LAZY)
    private List<CommentEntity> commentEntityList;

    public Integer getId_food() {
        return id_food;
    }

    public void setId_food(Integer id_food) {
        this.id_food = id_food;
    }

    public String getName_food() {
        return name_food;
    }

    public void setName_food(String name_food) {
        this.name_food = name_food;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent_food() {
        return content_food;
    }

    public void setContent_food(String content_food) {
        this.content_food = content_food;
    }

    public String getLink_video() {
        return link_video;
    }

    public void setLink_video(String link_video) {
        this.link_video = link_video;
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

    public FoodTypeEntity getFoodtype() {
        return foodtype;
    }

    public void setFoodtype(FoodTypeEntity foodtype) {
        this.foodtype = foodtype;
    }

    public List<CommentEntity> getCommentEntityList() {
        return commentEntityList;
    }

    public void setCommentEntityList(List<CommentEntity> commentEntityList) {
        this.commentEntityList = commentEntityList;
    }
}
