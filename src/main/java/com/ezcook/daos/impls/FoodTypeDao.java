package com.ezcook.daos.impls;

import com.ezcook.daos.IFoodTypeDao;
import com.ezcook.entities.FoodType;
import com.ezcook.entities.User;
import com.ezcook.utils.HibernateUtil;
import com.ezcook.utils.SingletonDaoUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

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

    @Override
    public String getNameFoodType(long foodTypeId) {
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
}
