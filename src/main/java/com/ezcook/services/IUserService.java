package com.ezcook.services;

import com.ezcook.dtos.CheckLogin;

public interface IUserService {
    CheckLogin checkLogin(String username, String password_user);
}
