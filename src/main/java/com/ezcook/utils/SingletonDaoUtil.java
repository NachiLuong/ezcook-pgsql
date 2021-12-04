package com.ezcook.utils;


import com.ezcook.daos.impls.*;

public class SingletonDaoUtil {
    private static UserDao userDaoImpl = null;
    private static RoleDao roleDaoImpl = null;
    private static FoodDao foodDaoImpl = null;
    private static FoodTypeDao foodTypeDaoImpl = null;
    private static StatisticsDao statisticsDaoImpl = null;

    public static StatisticsDao getStatisticsDaoInstance() {
        if (statisticsDaoImpl == null) {
            statisticsDaoImpl = new StatisticsDao();
        }
        return statisticsDaoImpl;
    }
    public static FoodDao getFoodDaoInstance() {
        if (foodDaoImpl == null) {
            foodDaoImpl = new FoodDao();
        }
        return foodDaoImpl;
    }
    public static FoodTypeDao getFoodTypeDaoInstance() {
        if (foodTypeDaoImpl == null) {
            foodTypeDaoImpl = new FoodTypeDao();
        }
        return foodTypeDaoImpl;
    }
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
