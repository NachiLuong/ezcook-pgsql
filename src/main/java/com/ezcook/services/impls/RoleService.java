package com.ezcook.services.impls;

import com.ezcook.daos.IRoleDao;
import com.ezcook.daos.impls.AbstractDao;
import com.ezcook.daos.impls.RoleDao;
import com.ezcook.dtos.RoleDto;
import com.ezcook.entities.Role;
import com.ezcook.services.IRoleService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import java.util.ArrayList;
import java.util.List;

public class RoleService extends AbstractDao<Integer, Role> implements IRoleService  {
    IRoleDao roleDao = new RoleDao();
    @Override
    public List<RoleDto> getAllRole() {
        List<RoleDto> dtos=new ArrayList<>();
        List<Role> entitys= SingletonDaoUtil.getRoleDaoInstance().findAll();
        for (Role role: entitys) {
            dtos.add(RoleBeanUtil.entity2Dto(role));
        }
        return dtos;
    }
    /*public RoleDto findRoleUnique(String property, Object value){
        Role entity= SingletonDaoUtil.getRoleDaoInstance().findEqualUnique(property, value);
        RoleDto dto= RoleBeanUtil.entity2Dto(entity);
        return dto;
    }*/


}
