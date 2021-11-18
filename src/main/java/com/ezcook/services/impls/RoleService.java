package com.ezcook.services.impls;

import com.ezcook.daos.IRoleDao;
import com.ezcook.daos.impls.RoleDao;
import com.ezcook.dtos.RoleDto;
import com.ezcook.entities.Role;
import com.ezcook.services.IRoleService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.RoleBeanUtil;

import java.util.ArrayList;
import java.util.List;

public class RoleService implements IRoleService {
    IRoleDao roleDao = new RoleDao();
    @Override
    public List<RoleDto> getAllRole() {
        List<RoleDto> dtos=new ArrayList<>();
        List<Role> entitys= SingletonDaoUtil.getRoleDaoInstance().findAll();
        for (Role role: entitys) {
            dtos.add(RoleBeanUtil.entity2Dto((Role) entitys));
        }
        return dtos;
    }
}
