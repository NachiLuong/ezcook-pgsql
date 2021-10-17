package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.RoleDto;
import com.ezcook.entity.RoleEntity;

public class RoleBeanUtil {
    public static RoleDto entity2Dto(RoleEntity entity){
        RoleDto dto=new RoleDto();
        dto.setId_role(entity.getId_role());
        dto.setCreatedate(entity.getCreatedate());
        dto.setModifieddate(entity.getModifieddate());
        dto.setName_role(entity.getName_role());
        return dto;
    }
    public static RoleEntity dto2Entity(RoleDto dto){
        RoleEntity entity=new RoleEntity();
        entity.setModifieddate(dto.getModifieddate());
        entity.setName_role(dto.getName_role());
        entity.setId_role(dto.getId_role());
        entity.setCreatedate(dto.getCreatedate());
        return entity;
    }
}
