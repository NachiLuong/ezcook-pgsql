package com.ezcook.services.impls;

import com.ezcook.daos.impls.FoodTypeDao;
import com.ezcook.entities.FoodType;
import com.ezcook.services.IFoodTypeService;
import com.ezcook.daos.IFoodTypeDao;

import java.util.List;

public class FoodTypeService implements IFoodTypeService {
    private IFoodTypeDao foodTypeDao=new FoodTypeDao();
    @Override
    public List<FoodType> findAll() {
        return foodTypeDao.findAll();
    }
    @Override
    public String getNameFoodType(long foodTypeId) {
        return foodTypeDao.getNameFoodType(foodTypeId);
    }
}
