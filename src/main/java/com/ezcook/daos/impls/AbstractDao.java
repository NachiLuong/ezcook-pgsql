package com.ezcook.daos.impls;

import com.ezcook.daos.IGenericDao;
import com.ezcook.utils.HibernateUtil;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.List;
import javassist.tools.rmi.ObjectNotFoundException;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;




public class AbstractDao<ID extends Serializable, T> implements IGenericDao<ID, T> {

    private final Class<T> persistenceClass;

    public AbstractDao() {
        this.persistenceClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    public String getPersistenceClassName() {
        return persistenceClass.getSimpleName();
    }

    @Override
    public List<T> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List list;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            // Query use HQL
            Query query = session.createQuery("from " + this.getPersistenceClassName());
            list = query.list();
            transaction.commit();
        } catch (HibernateException e) {
            assert transaction != null;
            transaction.rollback();
            System.out.println("Transectione is Null: " + e);
            throw e;
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public T update(T entity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        T result;
        Transaction transaction = session.beginTransaction();
        try {
            Object object = session.merge(entity);
            result = (T) object;
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    @Override
    public void save(T entity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.persist(entity);
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }

    }

    @Override
    public T findByID(ID id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        T result = null;
        try {
            result = (T) session.get(persistenceClass, id);
            if (result == null) {
                throw new ObjectNotFoundException("Not found" + id);
            }
            result = (T) session.get(persistenceClass, id);
            if (result == null) throw new ObjectNotFoundException("Not found" + id, null);
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } catch (ObjectNotFoundException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return result;
    }


    @Override
    public Integer delete(List<ID> ids) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Integer count = 0;
        try {
            for (ID item : ids) {
                T t = (T) session.get(persistenceClass, item);
                session.delete(t);
                count++;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return count;
    }

    @Override
    public T findEqualUnique(String property, Object value) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        T result;
        try {
            String sql = " FROM " + getPersistenceClassName() + " model WHERE model." + property + "= :value";
            @SuppressWarnings("unchecked")
            Query query = session.createQuery(sql);
            query.setParameter("value", value);
            result = (T) query.uniqueResult();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
    public List<T> paginationSearch(Integer pageNumber, Integer pageSize, String key, Object value){
        List<T> listResult = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(persistenceClass);
            criteria.add(Restrictions.ilike(key, "%"+value+"%"));
            criteria.setFirstResult((pageNumber - 1) * pageSize);
            criteria.setMaxResults(pageSize);
            criteria.addOrder(Order.asc("id"));

            listResult = (List<T>) criteria.list();
            session.getTransaction().commit();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }

        return listResult;
    }
    public List<T> pagination(Integer pageNumber, Integer pageSize){
        List<T> listResult = new ArrayList<>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(persistenceClass );
            criteria.setFirstResult((pageNumber - 1) * pageSize);
            criteria.setMaxResults(pageSize);
            criteria.addOrder(Order.asc("id"));

            listResult = (List<T>) criteria.list();
            session.getTransaction().commit();
        }
        catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }

        return listResult;
    }
    public Long count() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Long countResults;
        try {
            // Query use HQL
            String countQ = "select count(id) from " + this.getPersistenceClassName() ;
            Query query = session.createQuery(countQ);
            countResults = (long) query.uniqueResult();
            transaction.commit();
        } catch (HibernateException e) {
            assert transaction != null;
            transaction.rollback();
            System.out.println("Transectione is Null: " + e);
            throw e;
        } finally {
            session.close();
        }

        return countResults;
    }
    public boolean isUnique(String property, String value){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            String sql= "FROM "+ this.getPersistenceClassName() + " u WHERE u." +property+ "= :value";
            Query query = session.createQuery(sql);
            query.setParameter("value", value);
            if(query.list().size() >0) {
                transaction.commit();
                return false;
            }
        }catch (HibernateException e){
            transaction.rollback();
            throw e;
        }finally {
            session.close();
        }
        return true;
    }

    @Override
    public List<T> querySelector(String hqlQuery) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        // Get session current
//        Session session = factory.getCurrentSession();

        try {
            // Begin transaction
            session.getTransaction().begin();

            @SuppressWarnings("unchecked")
            Query query = session.createQuery(hqlQuery);

            return query.list();

        } catch (Exception e) {

            // Log error
            e.printStackTrace();

            // Rollback if error
            session.getTransaction().rollback();
        } finally {

            // Close transaction
            // factory.close();
            session.close();
        }
        return null;
    }
}