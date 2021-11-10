package com.ezcook.services.impls;

import com.ezcook.daos.IUserDao;
import com.ezcook.daos.impls.UserDao;
import com.ezcook.dtos.CheckLogin;
import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;
import com.ezcook.services.IUserService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.UserBeanUtil;

//import javax.inject.Inject;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService {

//    @Inject
    IUserDao userDao = new UserDao();

    @Override
    public CheckLogin checkLogin(String username, String password) {
        CheckLogin checkLogin = new CheckLogin();
        IUserDao userDao=new UserDao();
        if (username != null && password != null) {
            Object[] objects = userDao.checkLogin(username, password);
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
        user.setCreatedOn(Timestamp.from(Instant.now()));
        user.setModifiedOn(Timestamp.from(Instant.now()));
        userDao.save(user);
    }

    @Override
    public Object[] findUsersByProperties(String property, Object value, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<UserDto> result = new ArrayList<UserDto>();
        Object[] objects = userDao.findByProperty(property, value, sortExpression, sortDirection, offset, limit);
        for (User item: (List<User>)objects[1]) {
            UserDto dto = UserBeanUtil.entity2Dto(item);
            result.add(dto);
        }
        objects[1] = result;
        return objects;
    }

   /* @Override
    public Object[] findUserByProperties(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        Object[] objects= SingletonDaoUtil.getUserDaoInstance().findByProperty(property,sortExpression,sortDirection,offset,limit);
        List<UserDto> userDTOs= new ArrayList<>();
        for (User item: (List<User>)objects[1]){
            UserDto userDTO= UserBeanUtil.entity2Dto(item);
            userDTOs.add(userDTO);
        }
        objects[1]=userDTOs;
        return objects;
    }*/
}
