package com.ezcook.utils;


import com.ezcook.services.impls.*;

public class SingletonServiceUtil {
    private static UserService userServiceImpl = null;
    private static RoleService roleServiceImpl = null;
    private static FoodService foodServiceImpl = null;
    private static FoodTypeService foodTypeServiceImpl = null;
    private static StatisticsService statisticsServiceImpl = null;
    private static CommonService commonServiceImpl =null;

    public static CommonService getCommonServiceInstance() {
        if (commonServiceImpl == null) {
            commonServiceImpl = new CommonService();
        }
        return commonServiceImpl;
    }
    public static UserService getUserServiceInstance() {
        if (userServiceImpl == null) {
            userServiceImpl = new UserService();
        }
        return userServiceImpl;
    }
    public static StatisticsService getStatisticsServiceInstance() {
        if (statisticsServiceImpl == null) {
            statisticsServiceImpl = new StatisticsService();
        }
        return statisticsServiceImpl;
    }
    public static FoodTypeService getFoodTypeServiceInstance() {
        if (foodTypeServiceImpl == null) {
            foodTypeServiceImpl = new FoodTypeService();
        }
        return foodTypeServiceImpl;
    }
    public static RoleService getRoleServiceInstance() {
        if (roleServiceImpl == null) {
            roleServiceImpl = new RoleService();
        }
        return roleServiceImpl;
    }
    public static FoodService getFoodServiceInstance() {
        if (foodServiceImpl == null) {
            foodServiceImpl = new FoodService();
        }
        return foodServiceImpl;
    }
}
