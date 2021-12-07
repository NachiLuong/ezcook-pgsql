package com.ezcook.daos;

import com.ezcook.entities.Food;

import java.util.List;

public interface IFoodDao extends IGenericDao<Integer, Food> {
    List<Food> findAll();
    Food update(Food food);
    Food findEqualUnique(String property, Object value);
    List<Food> getListByFoodTypeIDAndLimit(long foodTypeId,int limit);
    List<Food> getListFoodNew(int first,int limit);
}
