package com.ezcook.entities;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "statistical", schema = "public", catalog = "d37tfeuqn9sfbb")
public class Statistics {
    private int id;
    private Integer commentCount;
    private Timestamp createddate;
    private Timestamp modifieddate;
    private Integer visits;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "comments")
    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    @Basic
    @Column(name = "created_on")
    public Timestamp getCreateddate() {
        return createddate;
    }

    public void setCreateddate(Timestamp createddate) {
        this.createddate = createddate;
    }

    @Basic
    @Column(name = "modified_on")
    public Timestamp getModifieddate() {
        return modifieddate;
    }

    public void setModifieddate(Timestamp modifieddate) {
        this.modifieddate = modifieddate;
    }

    @Basic
    @Column(name = "visits")
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

        Statistics that = (Statistics) o;

        if (id != that.id) return false;
        if (commentCount != null ? !commentCount.equals(that.commentCount) : that.commentCount != null) return false;
        if (createddate != null ? !createddate.equals(that.createddate) : that.createddate != null) return false;
        if (modifieddate != null ? !modifieddate.equals(that.modifieddate) : that.modifieddate != null) return false;
        if (visits != null ? !visits.equals(that.visits) : that.visits != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (commentCount != null ? commentCount.hashCode() : 0);
        result = 31 * result + (createddate != null ? createddate.hashCode() : 0);
        result = 31 * result + (modifieddate != null ? modifieddate.hashCode() : 0);
        result = 31 * result + (visits != null ? visits.hashCode() : 0);
        return result;
    }
}
