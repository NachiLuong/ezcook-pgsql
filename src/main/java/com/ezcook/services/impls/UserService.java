package com.ezcook.services.impls;

import com.ezcook.daos.IUserDao;
import com.ezcook.daos.impls.UserDao;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.services.IUserService;

public class UserService implements IUserService {
    @Override
    public CheckLogin checkLogin(String username, String password_user) {
        CheckLogin checkLogin = new CheckLogin();
        IUserDao userDao=new UserDao();
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
