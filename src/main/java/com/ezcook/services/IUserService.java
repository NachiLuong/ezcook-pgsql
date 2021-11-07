package com.ezcook.services;

import com.ezcook.dtos.CheckLogin;
import com.ezcook.entities.User;

import java.util.Map;

public interface IUserService {

    CheckLogin checkLogin(String username, String password_user);
    User findById(int id);
    boolean isExistEmail(String email);
    User findOneByEmail(String email);
    void save(User user);
    //Object[] findUserByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit);
    Object[] findUsersByProperties(String property, Object value, String sortExpression, String sortDirection, Integer offset, Integer limit);

}
