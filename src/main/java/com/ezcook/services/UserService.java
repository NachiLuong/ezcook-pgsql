package com.ezcook.services;

import com.ezcook.dtos.CheckLogin;

public interface UserService {
    CheckLogin checkLogin(String username, String password_user);
}
