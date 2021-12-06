package com.ezcook.daos.impls;

import com.ezcook.daos.IFoodDao;
import com.ezcook.entities.Food;;
import com.ezcook.utils.SingletonDaoUtil;
import org.hibernate.HibernateException;

public class FoodDao extends AbstractDao<Integer, Food> implements IFoodDao {
    public boolean foodUnique(Food entity) {
        try {
            if (isUnique("name", entity.getName())) {
                SingletonDaoUtil.getFoodDaoInstance().save(entity);
                return true;
            }
        } catch (HibernateException e) {
            throw e;
        }
        return false;
    }
}
