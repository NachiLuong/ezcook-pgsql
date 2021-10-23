package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;

public class UserBeanUtil {
    public static UserDto entity2Dto(User entity){
        UserDto dto=new UserDto();
        dto.setCreatedate(entity.getCreatedate());
        dto.setEmail(entity.getEmail());
        dto.setId_user(entity.getId_user());
        dto.setFullname(entity.getFullname());
        dto.setPassword_user(entity.getPassword_user());
        dto.setModifieddate(entity.getModifieddate());
        dto.setUsername(entity.getUsername());
        dto.setRoleDto(RoleBeanUtil.entity2Dto(entity.getRole()));
        return dto;
    }
    public static User dto2Entity(UserDto dto){
        User entity=new User();
        entity.setFullname(dto.getFullname());
        entity.setCreatedate(dto.getCreatedate());
        entity.setId_user(dto.getId_user());
        entity.setEmail(dto.getEmail());
        entity.setUsername(dto.getUsername());
        entity.setRole(RoleBeanUtil.dto2Entity(dto.getRoleDto()));
        entity.setPassword_user(dto.getPassword_user());
        entity.setModifieddate(dto.getModifieddate());
        return entity;
    }
}
