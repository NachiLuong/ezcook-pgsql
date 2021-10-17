package com.ezcook.daos.daoimpls;

import com.ezcook.daos.UserDao;
import com.ezcook.entity.UserEntity;
import com.ezcook.utils.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class UserDaoImpl extends AbstractDao<Integer, UserEntity> implements UserDao {

    @Override
    public Object[] checkLogin(String username, String password_user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        boolean isUserExist = false;
        String roleName = null;
        try {
            StringBuilder sql = new StringBuilder(" FROM UserEntity ue WHERE ue.username= :username AND ue.password_user= :password_user");
            Query query = session.createQuery(sql.toString());
            query.setParameter("username", username);
            query.setParameter("password_user", password_user);
            if (query.list().size() > 0) {
                isUserExist = true;
                UserEntity userEntity = (UserEntity) query.uniqueResult();
                roleName = userEntity.getRole().getName_role();
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
