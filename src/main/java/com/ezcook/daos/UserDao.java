package com.ezcook.daos;

import com.ezcook.entity.UserEntity;

public interface UserDao extends GenericDao<Integer, UserEntity>{
//    UserEntity isUserExist(String username, String password);
//    UserEntity findRoleByUser(String username, String password);
    Object[] checkLogin(String username, String password_user);
}
