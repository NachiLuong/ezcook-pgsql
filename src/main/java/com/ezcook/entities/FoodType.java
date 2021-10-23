package com.ezcook.entities;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "foodtype")
public class FoodType {
    @Id
    @Column(name = "id_foodtype")
    private Integer id_foodtype;

    @Column(name = "name_foodtype")
    private  String name_foodtype;

    @Column(name = "createddate")
    private Timestamp createdate;

    @Column(name = "modifieddate")
    private Timestamp modifieddate;

    @OneToMany(mappedBy = "foodtype", fetch = FetchType.LAZY)
    private  List<Food> foodList;

    public Integer getId_foodtype() {
        return id_foodtype;
    }

    public void setId_foodtype(Integer id_foodtype) {
        this.id_foodtype = id_foodtype;
    }

    public String getName_foodtype() {
        return name_foodtype;
    }

    public void setName_foodtype(String name_foodtype) {
        this.name_foodtype = name_foodtype;
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

    public List<Food> getFoodList() {
        return foodList;
    }

    public void setFoodList(List<Food> foodList) {
        this.foodList = foodList;
    }
}
