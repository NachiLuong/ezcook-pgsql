package com.ezcook.daos.impls;

import com.ezcook.daos.IFoodTypeDao;
import com.ezcook.entities.FoodType;
import com.ezcook.entities.User;
import com.ezcook.utils.SingletonDaoUtil;
import org.hibernate.HibernateException;

public class FoodTypeDao extends AbstractDao<Integer, FoodType> implements IFoodTypeDao {
    public boolean foodTypeUnique(FoodType entity) {
        try {
            if (isUnique("name", entity.getName()) ) {
                SingletonDaoUtil.getFoodTypeDaoInstance().save(entity);
                return true;
            }
        } catch (HibernateException e) {
            throw e;
        }
        return false;
    }

}
