package com.ezcook.services;

import com.ezcook.entities.Food;

import java.sql.Timestamp;
import java.util.Collection;
import java.util.List;

public interface IFoodService {
    Food findById(int id);

    String randomImg();

    Collection<Food> getRelatedFood(Food food);

    String getTextBetweenTags(String tag, String searchText);
    String formatTime(Timestamp timestamp);
    List<Food> findAllByKey(String key);
    List<Food> getListFoodNew(int start,int limit);
    List<Food> getListByFoodTypeIDAndLimit(long foodTypeId,int limit);
    List<Food> findAll();
}
