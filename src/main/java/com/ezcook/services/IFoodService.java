package com.ezcook.services;

import com.ezcook.entities.Food;
import com.ezcook.daos.impls.FoodDao;

import java.sql.Timestamp;
import java.util.List;

public interface IFoodService {
        String getTextBetweenTags(String tag, String searchText);
        String formatTime(Timestamp timestamp);
        List<Food> findAllByKey(String key);
        List<Food> getListFoodNew(int start,int limit);
        List<Food> getListByFoodTypeIDAndLimit(long foodTypeId,int limit);
        List<Food> findAll();

}
