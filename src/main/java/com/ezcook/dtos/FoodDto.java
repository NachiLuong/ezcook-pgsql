package com.ezcook.dtos;

import java.io.Serializable;


public class FoodDto implements Serializable {
    private Integer id;
    private String content;
    private String image;
    private String video;
    private String name;
    private FoodTypeDto foodTypeDto;

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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public FoodTypeDto getFoodTypeDto() {
        return foodTypeDto;
    }

    public void setFoodTypeDto(FoodTypeDto foodTypeDto) {
        this.foodTypeDto = foodTypeDto;
    }
}
