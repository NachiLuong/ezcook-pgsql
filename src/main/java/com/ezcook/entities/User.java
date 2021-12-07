package com.ezcook.entities;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Nationalized;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "user", schema = "public")
public class User {

    private Integer id;;
    private String email;
    private String name;
    private Timestamp createdOn;
    private Timestamp modifiedOn;
    private String password;
    private String username;
    private Integer idRole;
    private Collection<Comment> comments;
    private Role role;
    public User(){

    }
    public User(String email, String name, String username, String password, Integer id, Timestamp createdOn, Timestamp modifiedOn) {
        this.email=email;
        this.name=name;
        this.createdOn=createdOn;
        this.modifiedOn=modifiedOn;
        this.id=id;
        this.username=username;
        this.password=password;
    }
    public User(String email, String name, String username, String password, Timestamp createdOn, Timestamp modifiedOn) {
        this.email=email;
        this.name=name;
        this.createdOn=createdOn;
        this.modifiedOn=modifiedOn;
        this.username=username;
        this.password=password;
    }
    @Id
    @Column(name = "id", nullable = false)
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
    @Column(name = "email", nullable = false)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "name", nullable = false)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "role_id" , insertable = false, updatable = false)
    public Integer getIdRole() {
        return idRole;
    }

    public void setIdRole(Integer idRole) {
        this.idRole = idRole;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (id != user.id) return false;
        if (!Objects.equals(createdOn, user.createdOn)) return false;
        if (!Objects.equals(email, user.email)) return false;
        if (!Objects.equals(name, user.name)) return false;
        if (!Objects.equals(modifiedOn, user.modifiedOn)) return false;
        if (!Objects.equals(password, user.password)) return false;
        if (!Objects.equals(username, user.username)) return false;
        if (!Objects.equals(idRole, user.idRole)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createdOn != null ? createdOn.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (modifiedOn != null ? modifiedOn.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (idRole != null ? idRole.hashCode() : 0);
        return result;
    }

    @OneToMany(mappedBy = "user")
    @Cascade(value = {org.hibernate.annotations.CascadeType.ALL})
    public Collection<Comment> getComments() {
        return comments;
    }

    public void setComments(Collection<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne
    @JoinColumn(name = "role_id", referencedColumnName = "id")
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}