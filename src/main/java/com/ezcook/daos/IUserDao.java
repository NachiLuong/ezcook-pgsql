package com.ezcook.daos;

import com.ezcook.entities.User;

public interface IUserDao extends IGenericDao<Integer, User> {
//    UserEntity isUserExist(String username, String password);
//    UserEntity findRoleByUser(String username, String password);
    Object[] checkLogin(String username, String password);

}
