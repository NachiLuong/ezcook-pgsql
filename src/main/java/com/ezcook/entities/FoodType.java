package com.ezcook.entities;

import org.hibernate.annotations.Cascade;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "foodtype",schema = "public")
public class FoodType {
    private Integer id;
    private Timestamp createdOn;
    private Timestamp modifiedOn;
    private String name;
    private Collection<Food> foods;

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
    @Column(name = "name", nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FoodType foodtype = (FoodType) o;

        if (id != foodtype.id) return false;
        if (!Objects.equals(createdOn, foodtype.createdOn))
            return false;
        if (!Objects.equals(modifiedOn, foodtype.modifiedOn))
            return false;
        if (!Objects.equals(name, foodtype.name))
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createdOn != null ? createdOn.hashCode() : 0);
        result = 31 * result + (modifiedOn != null ? modifiedOn.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "foodtype")
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    public Collection<Food> getFoods() {
        return foods;
    }

    public void setFoods(Collection<Food> foods) {
        this.foods = foods;
    }
}