package com.ezcook.daos;

import com.ezcook.entities.FoodType;

import java.util.List;

public interface IFoodTypeDao extends IGenericDao<Integer, FoodType> {
    String getNameFoodType(long foodTypeId);
    FoodType update(FoodType foodType);
    FoodType findEqualUnique(String property, Object value);
}
