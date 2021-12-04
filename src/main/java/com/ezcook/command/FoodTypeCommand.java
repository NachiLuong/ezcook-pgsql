package com.ezcook.command;

import com.ezcook.dtos.FoodTypeDto;

public class FoodTypeCommand extends AbstractCommand<FoodTypeDto>{
    public FoodTypeCommand() {
        this.pojo= new FoodTypeDto();
    }
}
