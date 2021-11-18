package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
@Table(name = "statistical", schema = "public")
public class Statistical {
    private Integer id;
    private Integer comments;
    private Timestamp createdOn;
    private Timestamp modifiedOn;
    private Integer visits;

    public Statistical() {

    }

    public Statistical(Integer comments, Integer visits) {
        this.comments = comments;
        this.visits = visits;
    }
    @Id
    @Column(name = "id" , nullable = false)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "comments" , nullable = false)
    public Integer getComments() {
        return comments;
    }

    public void setComments(Integer comments) {
        this.comments = comments;
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
    @Column(name = "visits" , nullable = false)
    public Integer getVisits() {
        return visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Statistical that = (Statistical) o;

        if (id != that.id) return false;
        if (!Objects.equals(comments, that.comments)) return false;
        if (!Objects.equals(createdOn, that.createdOn)) return false;
        if (!Objects.equals(modifiedOn, that.modifiedOn)) return false;
        if (!Objects.equals(visits, that.visits)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (comments != null ? comments.hashCode() : 0);
        result = 31 * result + (createdOn != null ? createdOn.hashCode() : 0);
        result = 31 * result + (modifiedOn != null ? modifiedOn.hashCode() : 0);
        result = 31 * result + (visits != null ? visits.hashCode() : 0);
        return result;
    }
}