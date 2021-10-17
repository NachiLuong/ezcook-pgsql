package com.ezcook.services.serviceimpls;

import com.ezcook.daos.UserDao;
import com.ezcook.daos.daoimpls.UserDaoImpl;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.services.UserService;

public class UserServiceImpl implements UserService {
    @Override
    public CheckLogin checkLogin(String username, String password_user) {
        CheckLogin checkLogin = new CheckLogin();
        UserDao userDao=new UserDaoImpl();
        if (username != null && password_user != null) {
            Object[] objects = userDao.checkLogin(username, password_user);
            checkLogin.setUserExist((Boolean) objects[0]);
            if (checkLogin.isUserExist()) {
                checkLogin.setRoleName(objects[1].toString());
            }
        }
        return checkLogin;
    }
}
