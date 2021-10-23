package com.ezcook.daos.impls;

import com.ezcook.constants.WebConstant;
import com.ezcook.daos.IGenericDao;

import com.ezcook.utils.HibernateUtil;
import javassist.tools.rmi.ObjectNotFoundException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

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
            @SuppressWarnings("unchecked")
            Query<T> query = session.createQuery("from " + this.getPersistenceClassName());

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
        T result = null;
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
            result = session.get(persistenceClass, id);
            if (result == null) {
                throw new ObjectNotFoundException("Not found" + id);
            }
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
    public Object[] findByProperty(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        List<T> list;
        Object total = 0;
        String[] params = new String[property.size()];
        Object[] values = new String[property.size()];
        int i = 0;
        for (Map.Entry item : property.entrySet()) {
            params[i] = (String) item.getKey();
            values[i] = item.getValue();
            i++;
        }
        try {
            StringBuilder sql = new StringBuilder("from ");
            sql.append(getPersistenceClassName()).append(" where 1=1 ");
            if (property.size() > 0) {
                for (String param : params) {
                    sql.append(" and ").append("LOWER(").append(param).append(") LIKE '%' || :").append(param).append(" || '%'");
                }
            }
            if (sortDirection != null && sortExpression != null) {
                sql.append(" order by ").append(sortExpression);
                sql.append(" ").append(sortDirection.equals(WebConstant.SORT_ASC) ? "asc" : "desc");
            }
            @SuppressWarnings("unchecked")
            Query<T> query1 = session.createQuery(sql.toString());
            if (property.size() > 0) {
                for (int i1 = 0; i1 < params.length; i1++) {
                    query1.setParameter(params[i1], values[i1]);
                }
            }
            if (offset != null && offset >= 0) {
                query1.setFirstResult(offset);
            }
            if (limit != null && limit > 0) {
                query1.setMaxResults(limit);
            }
            list = query1.list();
            //
            StringBuilder sql1 = new StringBuilder("select count(*) from ");
            sql1.append(getPersistenceClassName()).append(" where 1=1 ");
            if (property.size() > 0) {
                for (String param : params) {
                    sql1.append(" and ").append("LOWER(").append(param).append(") LIKE '%' || :").append(param).append(" || '%'");
                }
            }
            @SuppressWarnings("unchecked")
            Query<T> query2 = session.createQuery(sql1.toString());
            if (property.size() > 0) {
                for (int k1 = 0; k1 < params.length; k1++) {
                    query2.setParameter(params[k1], values[k1]);
                }
            }
            total = query2.list().get(0);
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return new Object[]{total, list};
    }

    @Override
    public Integer delete(List<ID> ids) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Integer count = 0;
        try {
            for (ID item : ids) {
                T t = session.get(persistenceClass, item);
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
            Query<T> query = session.createQuery(sql);
            query.setParameter("value", value);
            result = query.uniqueResult();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
}
