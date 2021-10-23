package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.RoleDto;
import com.ezcook.entities.Role;

public class RoleBeanUtil {
    public static RoleDto entity2Dto(Role entity){
        RoleDto dto=new RoleDto();
        dto.setId_role(entity.getId_role());
        dto.setCreatedate(entity.getCreatedate());
        dto.setModifieddate(entity.getModifieddate());
        dto.setName_role(entity.getName_role());
        return dto;
    }
    public static Role dto2Entity(RoleDto dto){
        Role entity=new Role();
        entity.setModifieddate(dto.getModifieddate());
        entity.setName_role(dto.getName_role());
        entity.setId_role(dto.getId_role());
        entity.setCreatedate(dto.getCreatedate());
        return entity;
    }
}
