package com.ezcook.services.impls;


import com.ezcook.daos.IFoodTypeDao;
import com.ezcook.daos.impls.AbstractDao;
import com.ezcook.daos.impls.FoodTypeDao;
import com.ezcook.dtos.FoodTypeDto;
import com.ezcook.entities.FoodType;
import com.ezcook.services.IFoodTypeService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.FoodTypeBeanUtil;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class FoodTypeService /*extends AbstractDao<Integer, FoodType>*/ implements IFoodTypeService {
    IFoodTypeDao foodTypeDao = new FoodTypeDao();

    public void delete(List<Integer> ids) {
        foodTypeDao.delete(ids);
    }

    public List<FoodTypeDto> pagination(Integer pageNumber, Integer pageSize) {
        List<FoodType> typeList= SingletonDaoUtil.getFoodTypeDaoInstance().pagination(pageNumber,pageSize);
        List<FoodTypeDto> dtos=new ArrayList<FoodTypeDto>();
        for (FoodType foodType:typeList)  {
            dtos.add(FoodTypeBeanUtil.entity2Dto(foodType));
        }
        return dtos;
    }
    public List<FoodTypeDto> paginationSearch(Integer pageNumber, Integer pageSize, Object value) {
        List<FoodType> typeList= SingletonDaoUtil.getFoodTypeDaoInstance().paginationSearch(pageNumber,pageSize,"name",value);
        List<FoodTypeDto> dtos=new ArrayList<FoodTypeDto>();
        for (FoodType foodType:typeList)  {
            dtos.add(FoodTypeBeanUtil.entity2Dto(foodType));
        }
        return dtos;
    }
    public Integer countFoodType() {
        return Math.toIntExact(SingletonDaoUtil.getFoodTypeDaoInstance().count());
    }

    public FoodTypeDto  findEqualUnique(String property, Object value){
        FoodType entity = SingletonDaoUtil.getFoodTypeDaoInstance().findEqualUnique(property,value);
        return FoodTypeBeanUtil.entity2Dto(entity);
    }
    public FoodTypeDto updateFoodType(FoodTypeDto foodTypeDto){
        FoodType entity= FoodTypeBeanUtil.dto2Entity(foodTypeDto);
        entity.setModifiedOn(Timestamp.from(Instant.now()));
        entity=SingletonDaoUtil.getFoodTypeDaoInstance().update(entity);
        foodTypeDto= FoodTypeBeanUtil.entity2Dto(entity);

        return foodTypeDto;
    }
    public FoodTypeDto saveFoodType(FoodTypeDto foodTypeDto){
        FoodType entity= FoodTypeBeanUtil.dto2Entity(foodTypeDto);
        entity.setCreatedOn(Timestamp.from(Instant.now()));
        entity.setModifiedOn(Timestamp.from(Instant.now()));
        entity=SingletonDaoUtil.getFoodTypeDaoInstance().update(entity);
        foodTypeDto= FoodTypeBeanUtil.entity2Dto(entity);
        return foodTypeDto;
    }
    public boolean foodTypeUnique(FoodTypeDto foodTypeDto){
        FoodType entity= FoodTypeBeanUtil.dto2Entity(foodTypeDto);
        boolean a = SingletonDaoUtil.getUserDaoInstance().isUnique("name", foodTypeDto.getName());
        return a;
    }
    public List<FoodTypeDto> getAllFoodType() {
        List<FoodTypeDto> dtos=new ArrayList<>();
        List<FoodType> entitys= SingletonDaoUtil.getFoodTypeDaoInstance().findAll();
        for (FoodType foodType: entitys) {
            dtos.add(FoodTypeBeanUtil.entity2Dto(foodType));
        }
        return dtos;
    }

    @Override
    public FoodType findById(int id) {
        return foodTypeDao.findByID(id);
    }
    @Override
    public List<FoodType> findAll() {
        return foodTypeDao.findAll();
    }
    @Override
    public String getNameFoodType(long foodTypeId) {
        return foodTypeDao.getNameFoodType(foodTypeId);
    }
}
