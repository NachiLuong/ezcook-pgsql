package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.UserDto;
import com.ezcook.entities.User;

public class UserBeanUtil {
    public static UserDto entity2Dto(User entity){
        UserDto dto=new UserDto();
        dto.setCreatedate(entity.getCreatedOn());
        dto.setEmail(entity.getEmail());
        dto.setId_user(entity.getId());
        dto.setFullname(entity.getName());
        dto.setPassword(entity.getPassword());
        dto.setModifieddate(entity.getModifiedOn());
        dto.setUsername(entity.getUsername());
        dto.setRoleDto(RoleBeanUtil.entity2Dto(entity.getRole()));
        return dto;
    }
    public static User dto2Entity(UserDto dto){
        User entity=new User();
        entity.setName(dto.getFullname());
        entity.setCreatedOn(dto.getCreatedate());
        entity.setId(dto.getId_user());
        entity.setEmail(dto.getEmail());
        entity.setUsername(dto.getUsername());
        entity.setRole(RoleBeanUtil.dto2Entity(dto.getRoleDto()));
        entity.setPassword(dto.getPassword());
        entity.setModifiedOn(dto.getModifieddate());
        return entity;
    }
}
