package com.ezcook.daos;

import com.ezcook.entities.Role;

public interface IRoleDao extends IGenericDao<Integer, Role> {
    Role getRoleByName(String roleName);
}
