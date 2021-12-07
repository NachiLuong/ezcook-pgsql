package com.ezcook.services.impls;


import com.ezcook.daos.IFoodDao;
import com.ezcook.daos.impls.FoodDao;
import com.ezcook.dtos.FoodDto;
import com.ezcook.entities.Food;
import com.ezcook.services.IFoodService;
import com.ezcook.services.IFoodTypeService;
import com.ezcook.utils.SingletonDaoUtil;
import com.ezcook.utils.beanUtils.FoodBeanUtil;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.*;

public class FoodService implements IFoodService {
    IFoodDao foodDao=new FoodDao();
    private final IFoodTypeService foodTypeService = new FoodTypeService();
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
        entity.setCreatedOn(Timestamp.from(Instant.now()));
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

    @Override
    public Food findById(int id) {
        return foodDao.findByID(id);
    }

    @Override
    public String randomImg() {
        Random random = new Random();
        int key = random.nextInt(3);
        switch (key) {
            case 1: return "/templates/web/blog/imgs/user1.png";
            case 2: return "/templates/web/blog/imgs/user2.png";
        }
        return "/templates/web/blog/imgs/user3.png";
    }

    @Override
    public Collection<Food> getRelatedFood(Food food) {
        Collection<Food> foods = foodTypeService.findById(food.getIdFoodtype()).getFoods();
        Collections.shuffle((List<Food>) foods);
        foods.remove(food);
        Collection<Food> result = new ArrayList<>();
        result.add(((List<Food>) foods).get(0));
        result.add(((List<Food>) foods).get(1));
        result.add(((List<Food>) foods).get(2));
        return result;
    }

    @Override
    public List<Food> getListByFoodTypeIDAndLimit(long foodTypeId,int first) {
        return foodDao.getListByFoodTypeIDAndLimit(foodTypeId, first);
    }

    @Override
    public List<Food> getListFoodNew(int start,int limit) {
        return foodDao.getListFoodNew(start,limit);
    }
    @Override
    public List<Food> findAll() {
        return foodDao.findAll();
    }
    @Override
    public String getTextBetweenTags(String tag, String searchText) {
        String startTag = "<" + tag + ">";
        String endTag = "</" + tag + ">";
        String result="";
        int index1 = -1;
        int index2 = -1;
        int index=0;
        while (result.length()<100)
        {
            index1=searchText.indexOf(startTag,index);
            index2=searchText.indexOf(endTag,index);
            if (index1 == -1 || index2 == -1) {
                return null;
            }
            else
            {
                index1 = index1 + startTag.length();
                result = result+searchText.substring(index1, index2);
                index=index2+endTag.length();
            }
        }

        return result.replace("<strong>"," ").replace("<strong >","").replace("</strong>"," ").replace("<br/>"," ").replace("<br>"," ").replace("<em>"," ").replace("</em>"," ");
    }
    @Override
    public String formatTime(Timestamp timestamp) {
        long time = timestamp.getTime();
        SimpleDateFormat formatter = new SimpleDateFormat("MMMMMMMMM dd, yyyy");
        String strDate = formatter.format(time);
        return strDate;
    }
    @Override
    public List<Food> findAllByKey(String key) {
        String hqlQuery = "select f from Food f where "
                + "f.name like '%" + key + "%'" +
                " or f.content like '%" + key + "%'";
        return foodDao.querySelector(hqlQuery);
    }
}
