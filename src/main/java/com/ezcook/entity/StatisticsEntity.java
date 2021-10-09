package com.ezcook.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "statisticstable")
public class StatisticsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id_statistics;

    @Column(name = "visits")
    private Integer visits;

    @Column(name = "comment_count")
    private Integer comment_count;

    @Column(name = "createddate")
    private Timestamp createdate;

    @Column(name = "modifieddate")
    private Timestamp modifieddate;

    public Integer getId_statistics() {
        return id_statistics;
    }

    public void setId_statistics(Integer id_statistics) {
        this.id_statistics = id_statistics;
    }

    public Integer getVisits() {
        return visits;
    }

    public void setVisits(Integer visits) {
        this.visits = visits;
    }

    public Integer getComment_count() {
        return comment_count;
    }

    public void setComment_count(Integer comment_count) {
        this.comment_count = comment_count;
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
}
