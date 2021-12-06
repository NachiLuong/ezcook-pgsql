package com.ezcook.utils.beanUtils;


import com.ezcook.dtos.FoodDto;
import com.ezcook.entities.Food;

public class FoodBeanUtil {
    public static FoodDto entity2Dto(Food entity){
        FoodDto dto=new FoodDto();
        dto.setId(entity.getId());
        dto.setName(entity.getName());
        dto.setContent(entity.getContent());
        dto.setImage(entity.getImage());
        dto.setVideo(entity.getVideo());
        dto.setFoodTypeDto(FoodTypeBeanUtil.entity2Dto(entity.getFoodtype()));
        return dto;
    }
    public static Food dto2Entity(FoodDto dto){
        Food entity=new Food();
        entity.setName(dto.getName());
        entity.setId(dto.getId());
        entity.setContent(dto.getContent());
        entity.setImage(dto.getImage());
        entity.setFoodtype(FoodTypeBeanUtil.dto2Entity(dto.getFoodTypeDto()));
        entity.setVideo(dto.getVideo());
        return entity;
    }
}
