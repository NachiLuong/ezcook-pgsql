package com.ezcook.daos.impls;

import com.ezcook.entities.FoodType;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.*;

import com.ezcook.daos.IFoodDao;
import com.ezcook.entities.Food;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.Session;

import java.sql.Date;
import java.util.Collections;
import java.util.List;

public class FoodDao extends AbstractDao<Integer,Food> implements IFoodDao {
    private final String className = "Food";

    public List<Food> getListFoodNew(int first,int limit) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {

            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Food ORDER BY createdOn DESC ");
            query.setFirstResult(first);
            query.setMaxResults(limit);
            List<Food> list = query.list();
            transaction.commit();
            return list;
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

    public List<Food> getListByFoodTypeIDAndLimit(long foodTypeId,int limit) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Food WHERE idFoodtype = :foodTypeId ORDER BY createdOn DESC");
            query.setLong("foodTypeId", foodTypeId);
            query.setMaxResults(limit);
            List<Food> list = query.list();
            Collections.shuffle(list);
            transaction.commit();
            return list;
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
    public List<Food> findAll() {
        return super.findAll();
    }

}
