package com.ezcook.services;

import com.ezcook.entities.Food;
import com.ezcook.entities.FoodType;

import java.util.List;

public interface IFoodTypeService {
    String getNameFoodType(long foodTypeId);
    List<FoodType> findAll();
}
