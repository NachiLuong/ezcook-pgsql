package com.ezcook.services.impls;

import com.ezcook.daos.IUserDao;
import com.ezcook.daos.impls.UserDao;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.entities.User;
import com.ezcook.services.IUserService;

//import javax.inject.Inject;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

public class UserService implements IUserService {

//    @Inject
    IUserDao userDao = new UserDao();

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

    @Override
    public User findById(int id) {
        return userDao.findByID(Math.toIntExact(id));
    }

    @Override
    public boolean isExistEmail(String email) {
        List<User> users = userDao.findAll();
        for (User user : users) {
            if (user.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public User findOneByEmail(String email) {
        List<User> users = userDao.findAll();
        for (User user : users) {
            if (user.getEmail().equals(email)) {
                return user;
            }
        }
        return null;
    }

    @Override
    public void save(User user) {
        user.setCreateddate(Timestamp.from(Instant.now()));
        user.setModifieddate(Timestamp.from(Instant.now()));
        userDao.save(user);
    }
}
