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
        user.setIdRole(1);
        userDao.save(user);
    }

    @Override
    public void delete(List<Integer> ids) {
        userDao.delete(ids);
    }


    @Override
    public List<UserDto> pagination(Integer pageNumber, Integer pageSize) {
        List<User> userList= SingletonDaoUtil.getUserDaoInstance().pagination(pageNumber,pageSize);
        List<UserDto> dtos=new ArrayList<UserDto>();
        for (User user:userList)  {
            dtos.add(UserBeanUtil.entity2Dto(user));
        }
        return dtos;
    }

    @Override
    public List<UserDto> paginationSearch(Integer pageNumber, Integer pageSize, Object value) {
        List<User> userList= SingletonDaoUtil.getUserDaoInstance().paginationSearch(pageNumber,pageSize,"username",value);
        List<UserDto> dtos=new ArrayList<UserDto>();
        for (User user:userList)  {
            dtos.add(UserBeanUtil.entity2Dto(user));
        }
        return dtos;
    }

    @Override
    public Integer countUser() {
        return Math.toIntExact(SingletonDaoUtil.getUserDaoInstance().count());
    }

}
