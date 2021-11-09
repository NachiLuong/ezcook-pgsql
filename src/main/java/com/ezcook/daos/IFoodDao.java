package com.ezcook.daos;

import com.ezcook.entities.Food;

import java.util.List;
import java.util.Map;

public interface IFoodDao extends IGenericDao<Integer, Food> {
    List<Food> findAll();
    Food update(Food food);
    Food findEqualUnique(String property, Object value);

}
