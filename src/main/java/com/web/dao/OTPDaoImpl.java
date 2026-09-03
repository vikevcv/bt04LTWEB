package com.web.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import com.web.entity.EmailOTP;
import com.web.configs.JPAConfig;

public class OTPDaoImpl implements OTPDao {

    @Override
    public void insert(EmailOTP otp) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            enma.persist(otp);
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public void deleteByEmail(String email) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try {
            trans.begin();
            EmailOTP existing = findByEmail(email);
            if (existing != null) {
                enma.remove(enma.merge(existing));
            }
            trans.commit();
        } catch (Exception e) {
            e.printStackTrace();
            trans.rollback();
        } finally {
            enma.close();
        }
    }

    @Override
    public EmailOTP findByEmail(String email) {
        EntityManager enma = JPAConfig.getEntityManager();
        try {
            TypedQuery<EmailOTP> query = enma.createQuery(
                "SELECT e FROM EmailOTP e WHERE e.email = :email", EmailOTP.class);
            query.setParameter("email", email);
            return query.getResultList().stream().findFirst().orElse(null);
        } finally {
            enma.close();
        }
    }
}
