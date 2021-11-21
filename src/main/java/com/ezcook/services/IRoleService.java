package com.ezcook.services;

import com.ezcook.daos.IGenericDao;
import com.ezcook.daos.IRoleDao;
import com.ezcook.daos.IUserDao;
import com.ezcook.daos.impls.RoleDao;
import com.ezcook.daos.impls.UserDao;
import com.ezcook.dtos.RoleDto;
import com.ezcook.entities.Role;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface IRoleService{

     List<RoleDto> getAllRole();
}
