package com.ezcook.daos.impls;

import com.ezcook.daos.IFoodDao;
import com.ezcook.entities.Food;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

public class FoodDao extends AbstractDao<Integer,Food> implements IFoodDao {
    private final String className = "Food";

    @Override
    public List<Food> findAll() {
        return super.findAll();
    }
}
