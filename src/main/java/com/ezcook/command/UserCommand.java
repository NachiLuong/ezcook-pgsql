package com.ezcook.command;

import com.ezcook.dtos.UserDto;

public class  UserCommand extends AbstractCommand<UserDto>{
    public UserCommand() {
        this.pojo = new UserDto();
    }
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
