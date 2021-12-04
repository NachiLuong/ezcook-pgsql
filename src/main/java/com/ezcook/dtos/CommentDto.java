package com.ezcook.dtos;

import java.io.Serializable;
import java.sql.Timestamp;

public class CommentDto implements Serializable {
    private Integer id;
    private String content;
    private Timestamp time;
    private UserDto userDto;
    private FoodDto foodDto;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public UserDto getUserDto() {
        return userDto;
    }

    public void setUserDto(UserDto userDto) {
        this.userDto = userDto;
    }

    public FoodDto getFoodDto() {
        return foodDto;
    }

    public void setFoodDto(FoodDto foodDto) {
        this.foodDto = foodDto;
    }
}
