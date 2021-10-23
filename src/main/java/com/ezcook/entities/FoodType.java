package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

@Entity
public class FoodType {
    private int id;
    private Timestamp createddate;
    private Timestamp modifieddate;
    private String nameFoodtype;
    private Collection<Food> foods;

    @Id
    @Column(name = "id_foodtype")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    @Column(name = "modifieddate")
    public Timestamp getModifieddate() {
        return modifieddate;
    }

    public void setModifieddate(Timestamp modifieddate) {
        this.modifieddate = modifieddate;
    }

    @Basic
    @Column(name = "name_foodtype")
    public String getNameFoodtype() {
        return nameFoodtype;
    }

    public void setNameFoodtype(String nameFoodtype) {
        this.nameFoodtype = nameFoodtype;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FoodType foodtype = (FoodType) o;

        if (id != foodtype.id) return false;
        if (createddate != null ? !createddate.equals(foodtype.createddate) : foodtype.createddate != null)
            return false;
        if (modifieddate != null ? !modifieddate.equals(foodtype.modifieddate) : foodtype.modifieddate != null)
            return false;
        if (nameFoodtype != null ? !nameFoodtype.equals(foodtype.nameFoodtype) : foodtype.nameFoodtype != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createddate != null ? createddate.hashCode() : 0);
        result = 31 * result + (modifieddate != null ? modifieddate.hashCode() : 0);
        result = 31 * result + (nameFoodtype != null ? nameFoodtype.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "foodtype")
    public Collection<Food> getFoods() {
        return foods;
    }

    public void setFoods(Collection<Food> foods) {
        this.foods = foods;
    }
}
