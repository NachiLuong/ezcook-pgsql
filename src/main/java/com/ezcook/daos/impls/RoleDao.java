package com.ezcook.daos.impls;

import com.ezcook.daos.IRoleDao;
import com.ezcook.entities.Role;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RoleDao extends AbstractDao<Integer, Role> implements IRoleDao {
    public Role getRoleByName(String roleName) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Query query = session.createQuery(" FROM Role c WHERE c.name= :roleName");
            query.setParameter("roleName", roleName);
            return (Role) query.uniqueResult();
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
}
