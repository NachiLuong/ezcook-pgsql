package com.ezcook.services.impls;


import com.ezcook.daos.IFoodDao;
import com.ezcook.daos.impls.FoodDao;
import com.ezcook.dtos.FoodDto;
import com.ezcook.entities.Food;
import com.ezcook.services.IFoodService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.FoodBeanUtil;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class FoodService implements IFoodService {
    IFoodDao foodDao=new FoodDao();
    public void delete(List<Integer> ids) {
        foodDao.delete(ids);
    }
    public List<FoodDto> pagination(Integer pageNumber, Integer pageSize) {
        List<Food> foodList= SingletonDaoUtil.getFoodDaoInstance().pagination(pageNumber,pageSize);
        List<FoodDto> dtos=new ArrayList<FoodDto>();
        for (Food food:foodList)  {
            dtos.add(FoodBeanUtil.entity2Dto(food));
        }
        return dtos;
    }
    public List<FoodDto> paginationSearch(Integer pageNumber, Integer pageSize, Object value) {
        List<Food> foodList= SingletonDaoUtil.getFoodDaoInstance().paginationSearch(pageNumber,pageSize,"name",value);
        List<FoodDto> dtos=new ArrayList<FoodDto>();
        for (Food food:foodList)  {
            dtos.add(FoodBeanUtil.entity2Dto(food));
        }
        return dtos;
    }
    public Integer countFood() {
        return Math.toIntExact(SingletonDaoUtil.getFoodDaoInstance().count());
    }
    public FoodDto  findEqualUnique(String property, Object value){
        Food entity = SingletonDaoUtil.getFoodDaoInstance().findEqualUnique(property,value);
        FoodDto foodDto= FoodBeanUtil.entity2Dto(entity);
        return foodDto;
    }
    public FoodDto updateFood(FoodDto foodDto){
        Food entity= FoodBeanUtil.dto2Entity(foodDto);
        entity.setModifiedOn(Timestamp.from(Instant.now()));
        entity=SingletonDaoUtil.getFoodDaoInstance().update(entity);
        foodDto= FoodBeanUtil.entity2Dto(entity);

        return foodDto;
    }
    public FoodDto saveFood(FoodDto foodDto){
        Food entity= FoodBeanUtil.dto2Entity(foodDto);
        entity.setCreatedOn(Timestamp.from(Instant.now()));
        entity.setModifiedOn(Timestamp.from(Instant.now()));
        entity=SingletonDaoUtil.getFoodDaoInstance().update(entity);
        foodDto= FoodBeanUtil.entity2Dto(entity);
        return foodDto;
    }
    public boolean foodUnique(FoodDto foodDto){
        Food entity= FoodBeanUtil.dto2Entity(foodDto);
        boolean a = SingletonDaoUtil.getFoodDaoInstance().isUnique("name", foodDto.getName());
        return a;
    }
}
