package com.ezcook.services;

import com.ezcook.entities.FoodType;

import java.util.List;

public interface IFoodTypeService {
    FoodType findById(int id);
    String getNameFoodType(long foodTypeId);
    List<FoodType> findAll();
}
