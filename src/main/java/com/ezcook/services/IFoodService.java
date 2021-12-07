package com.ezcook.services;

import com.ezcook.entities.Food;

import java.util.Collection;

public interface IFoodService {
    Food findById(int id);

    String randomImg();

    Collection<Food> getRelatedFood(Food food);
}
