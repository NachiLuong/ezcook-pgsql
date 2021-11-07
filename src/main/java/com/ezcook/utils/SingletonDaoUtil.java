package com.ezcook.utils;


import com.ezcook.daos.impls.RoleDao;
import com.ezcook.daos.impls.UserDao;

public class SingletonDaoUtil {
    private static UserDao userDaoImpl = null;
    private static RoleDao roleDaoImpl = null;

    public static UserDao getUserDaoInstance() {
        if (userDaoImpl == null) {
            userDaoImpl = new UserDao();
        }
        return userDaoImpl;
    }

    public static RoleDao getRoleDaoInstance() {
        if (roleDaoImpl == null) {
            roleDaoImpl = new RoleDao();
        }
        return roleDaoImpl;
    }

}
