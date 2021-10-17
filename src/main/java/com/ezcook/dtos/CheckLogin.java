package com.ezcook.dtos;

import java.io.Serializable;

public class CheckLogin implements Serializable {
    boolean isUserExist = false;
    String roleName = null;

    public boolean isUserExist() {
        return isUserExist;
    }

    public void setUserExist(boolean userExist) {
        isUserExist = userExist;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
