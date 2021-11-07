package com.ezcook.utils;


import com.ezcook.services.impls.RoleService;
import com.ezcook.services.impls.UserService;

public class SingletonServiceUtil {
    private static UserService userServiceImpl = null;
    private static RoleService roleServiceImpl = null;

    public static UserService getUserServiceInstance() {
        if (userServiceImpl == null) {
            userServiceImpl = new UserService();
        }
        return userServiceImpl;
    }

    public static RoleService getRoleServiceInstance() {
        if (roleServiceImpl == null) {
            roleServiceImpl = new RoleService();
        }
        return roleServiceImpl;
    }

}
