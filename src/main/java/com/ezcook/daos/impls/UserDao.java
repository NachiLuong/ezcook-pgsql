package com.ezcook.daos.impls;

import com.ezcook.daos.IUserDao;
import com.ezcook.entities.User;
import com.ezcook.utils.HibernateUtil;
import com.ezcook.utils.SingletonDaoUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.time.Instant;

public class UserDao extends AbstractDao<Integer, User> implements IUserDao {
    @Override
    public void save(User user) {
        user.setCreatedOn(Timestamp.from(Instant.now()));
        user.setModifiedOn(Timestamp.from(Instant.now()));
        super.save(user);
    }
    public User findByUsernameAndEmail(String username, String email){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM User WHERE username = :username and email=:email");
            query.setParameter("username",username);
            query.setParameter("email",email);
            transaction.commit();
            return (User) query.uniqueResult();
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
    public Object[] checkLogin(String username, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        boolean isUserExist = false;
        String roleName = null;
        try {
            Query query = session.createQuery(" FROM User ue WHERE ue.username= :username AND ue.password= :password");
            query.setParameter("username", username);
            query.setParameter("password", password);
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

    public boolean userUnique(User entity) {
        try {
            if (isUnique("email", entity.getEmail()) && isUnique("username", entity.getUsername())) {
                SingletonDaoUtil.getUserDaoInstance().save(entity);
                return true;
            }
        } catch (HibernateException e) {
            throw e;
        }
        return false;
    }
}
