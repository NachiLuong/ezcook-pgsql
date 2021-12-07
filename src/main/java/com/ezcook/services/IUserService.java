package com.ezcook.services;

import com.ezcook.dtos.CheckLogin;
import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;

import java.util.List;
import java.util.Map;

public interface IUserService {

    CheckLogin checkLogin(String username, String password);
    User findById(int id);
    boolean isExistEmail(String email);
    User findOneByEmail(String email);
    void save(User user);
    void delete(List<Integer> ids);
    List<UserDto> pagination(Integer pageNumber, Integer pageSize);
    List<UserDto> paginationSearch(Integer pageNumber, Integer pageSize, Object value);
    Integer countUser();
    User findByUsername(String username);

}
