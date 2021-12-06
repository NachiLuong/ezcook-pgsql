package com.ezcook.services.impls;

import com.ezcook.daos.impls.FoodDao;
import com.ezcook.entities.FoodType;
import com.ezcook.services.IFoodService;
import com.ezcook.daos.IFoodDao;
import com.ezcook.entities.Food;

import java.sql.Timestamp;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


public class FoodService implements IFoodService {

    private IFoodDao foodDao=new FoodDao();

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
