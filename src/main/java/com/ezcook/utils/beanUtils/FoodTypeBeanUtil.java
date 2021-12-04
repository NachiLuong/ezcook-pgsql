package com.ezcook.utils.beanUtils;

import com.ezcook.dtos.FoodTypeDto;
import com.ezcook.dtos.UserDto;
import com.ezcook.entities.FoodType;
import com.ezcook.entities.User;

public class FoodTypeBeanUtil {
    public static FoodTypeDto entity2Dto(FoodType entity){
        FoodTypeDto dto=new FoodTypeDto();
        dto.setId(entity.getId());
        dto.setName(entity.getName());

        return dto;
    }
    public static FoodType dto2Entity(FoodTypeDto dto){
        FoodType entity=new FoodType();
        entity.setId(dto.getId());
        entity.setName(dto.getName());
        return entity;
    }
}
