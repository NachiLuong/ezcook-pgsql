package com.ezcook.entities;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "food",schema = "public")
public class Food {
    private Integer id;
    private String content;
    private Timestamp createdOn;
    private String image;
    private String video;
    private Timestamp modifiedOn;
    private String name;
    private Integer idFoodtype;
    private Collection<Comment> comments;
    private FoodType foodtype;


    public Food() {

    }

    public Food(int id,String contentFood,Timestamp createddate,String image,String linkVideo,Timestamp modifieddate,String nameFood,Integer idFoodtype,Collection<Comment> comments,FoodType foodtype) {
        this.id=id;
        this.content=contentFood;
        this.createdOn=createddate;
        this.image=image;
        this.video=linkVideo;
        this.modifiedOn=modifieddate;
        this.name=nameFood;
        this.idFoodtype=idFoodtype;
        this.comments=comments;
        this.foodtype=foodtype;
    }
    public Food(String name, String content, String image, String video, Integer foodtypeId) {
        this.name = name;
        this.content = content;
        this.image = image;
        this.video = video;
        this.idFoodtype = foodtypeId;
    }

    @Id
    @Column(name = "id" , nullable = false)
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
    @Column(name = "image" , nullable = false)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Basic
    @Column(name = "video")
    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
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
    @Column(name = "name" , nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "foodtype_id", insertable = false, updatable = false)
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
        if (!Objects.equals(content, food.content)) return false;
        if (!Objects.equals(createdOn, food.createdOn)) return false;
        if (!Objects.equals(image, food.image)) return false;
        if (!Objects.equals(video, food.video)) return false;
        if (!Objects.equals(modifiedOn, food.modifiedOn)) return false;
        if (!Objects.equals(name, food.name)) return false;
        if (!Objects.equals(idFoodtype, food.idFoodtype)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createdOn != null ? createdOn.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (video != null ? video.hashCode() : 0);
        result = 31 * result + (modifiedOn != null ? modifiedOn.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (idFoodtype != null ? idFoodtype.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "food")
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne
    @JoinColumn(name = "foodtype_id", referencedColumnName = "id")
    public FoodType getFoodtype() {
        return foodtype;
    }

    public void setFoodtype(FoodType foodtype) {
        this.foodtype = foodtype;
    }
}