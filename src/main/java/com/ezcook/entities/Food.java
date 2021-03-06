package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class Food {
    private int id;
    private String contentFood;
    private Timestamp createddate;
    private String image;
    private String linkVideo;
    private Timestamp modifieddate;
    private String nameFood;
    private Integer idFoodtype;
    private Collection<Comment> comments;
    private FoodType foodtype;

    @Id
    @Column(name = "id_food")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "content_food")
    public String getContentFood() {
        return contentFood;
    }

    public void setContentFood(String contentFood) {
        this.contentFood = contentFood;
    }

    @Basic
    @Column(name = "createddate")
    public Timestamp getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Timestamp createddate) {
        this.createddate = createddate;
    }

    @Basic
    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Basic
    @Column(name = "link_video")
    public String getLinkVideo() {
        return linkVideo;
    }

    public void setLinkVideo(String linkVideo) {
        this.linkVideo = linkVideo;
    }

    @Basic
    @Column(name = "modifieddate")
    public Timestamp getModifieddate() {
        return modifieddate;
    }

    public void setModifieddate(Timestamp modifieddate) {
        this.modifieddate = modifieddate;
    }

    @Basic
    @Column(name = "name_food")
    public String getNameFood() {
        return nameFood;
    }

    public void setNameFood(String nameFood) {
        this.nameFood = nameFood;
    }

    @Basic
    @Column(name = "id_foodtype", insertable = false, updatable = false)
    public Integer getIdFoodtype() {
        return idFoodtype;
    }

    public void setIdFoodtype(Integer idFoodtype) {
        this.idFoodtype = idFoodtype;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Food food = (Food) o;

        if (id != food.id) return false;
        if (contentFood != null ? !contentFood.equals(food.contentFood) : food.contentFood != null) return false;
        if (createddate != null ? !createddate.equals(food.createddate) : food.createddate != null) return false;
        if (image != null ? !image.equals(food.image) : food.image != null) return false;
        if (linkVideo != null ? !linkVideo.equals(food.linkVideo) : food.linkVideo != null) return false;
        if (modifieddate != null ? !modifieddate.equals(food.modifieddate) : food.modifieddate != null) return false;
        if (nameFood != null ? !nameFood.equals(food.nameFood) : food.nameFood != null) return false;
        if (idFoodtype != null ? !idFoodtype.equals(food.idFoodtype) : food.idFoodtype != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (contentFood != null ? contentFood.hashCode() : 0);
        result = 31 * result + (createddate != null ? createddate.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (linkVideo != null ? linkVideo.hashCode() : 0);
        result = 31 * result + (modifieddate != null ? modifieddate.hashCode() : 0);
        result = 31 * result + (nameFood != null ? nameFood.hashCode() : 0);
        result = 31 * result + (idFoodtype != null ? idFoodtype.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "food")
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne
    @JoinColumn(name = "id_foodtype", referencedColumnName = "id_foodtype")
    public FoodType getFoodtype() {
        return foodtype;
    }

    public void setFoodtype(FoodType foodtype) {
        this.foodtype = foodtype;
    }
}
