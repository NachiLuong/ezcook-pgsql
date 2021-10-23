package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.RoleDto;
import com.ezcook.entities.Role;

public class RoleBeanUtil {
    public static RoleDto entity2Dto(Role role){
        RoleDto dto=new RoleDto();
        dto.setId_role(role.getId());
        dto.setCreatedate(role.getCreateddate());
        dto.setModifieddate(role.getModifieddate());
        dto.setName_role(role.getName());
        return dto;
    }
    public static Role dto2Entity(RoleDto dto){
        Role entity=new Role();
        entity.setModifieddate(dto.getModifieddate());
        entity.setName(dto.getName_role());
        entity.setId(dto.getId_role());
        entity.setCreateddate(dto.getCreatedate());
        return entity;
    }
}
