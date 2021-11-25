package com.ezcook.daos.impls;

import com.ezcook.daos.IFoodTypeDao;
import com.ezcook.entities.Food;
import com.ezcook.entities.FoodType;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


import java.util.Collections;
import java.util.List;

public class FoodTypeDao extends AbstractDao<Integer, FoodType> implements IFoodTypeDao {
    private final String className = "FoodType";

    public  String getNameFoodType(long foodTypeId)
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();

            String hql = "SELECT name FROM FoodType WHERE id = :foodTypeId";
            String foodTypeName = (String) session.createQuery(hql).setLong("foodTypeId", foodTypeId).uniqueResult();
            return foodTypeName;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
        } finally {
            session.flush();
            session.close();
        }
        return null;
    }
    @Override
    public List<FoodType> findAll() {
        return super.findAll();
    }
}
