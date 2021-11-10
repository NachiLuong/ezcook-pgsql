package com.ezcook.daos.impls;

import com.ezcook.daos.IUserDao;
import com.ezcook.entities.User;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDao extends AbstractDao<Integer, User> implements IUserDao {

    @Override
    public Object[] checkLogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        boolean isUserExist = false;
        String roleName = null;
        try {
            StringBuilder sql= new StringBuilder("FROM user ue WHERE ue.username=" + username + " AND ue.password=" + password);
            Query query = session.createQuery(sql.toString());
//            Query query = session.createQuery(" FROM user ue WHERE ue.username= :username AND ue.password= :password");
//            query.setParameter("username", username);
//            query.setParameter("password", password);
            if (query.list().size() > 0) {
                isUserExist = true;
                User userEntity = (User) query.uniqueResult();
                roleName = userEntity.getRole().getName();
            }
        } catch (HibernateException e) {
            transaction.rollback();
            throw e;
        } finally {
            session.close();
        }
        return new Object[]{isUserExist, roleName};
    }
}
