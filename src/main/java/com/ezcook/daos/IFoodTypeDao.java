package com.ezcook.daos;

import com.ezcook.entities.FoodType;

import java.util.List;

public interface IFoodTypeDao extends IGenericDao<Integer, FoodType> {
    List<FoodType> findAll();
    FoodType update(FoodType foodType);
    FoodType findEqualUnique(String property, Object value);
}
