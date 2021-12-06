package com.ezcook.command;

import com.ezcook.dtos.FoodDto;

public class FoodCommand extends AbstractCommand<FoodDto>{
    public FoodCommand() {
        this.pojo=new FoodDto();
    }
    private String foodtype;

    public String getFoodtype() {
        return foodtype;
    }

    public void setFoodtype(String foodtype) {
        this.foodtype = foodtype;
    }
}
