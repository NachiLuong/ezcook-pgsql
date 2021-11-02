package com.ezcook.services;

import com.ezcook.dtos.CheckLogin;
import com.ezcook.entities.User;

public interface IUserService {

    CheckLogin checkLogin(String username, String password_user);

    User findById(int id);

    boolean isExistEmail(String email);

    User findOneByEmail(String email);

    void save(User user);
}
