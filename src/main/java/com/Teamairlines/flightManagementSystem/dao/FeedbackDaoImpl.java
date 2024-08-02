package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import com.Teamairlines.flightManagementSystem.bean.FeedBack;

@Repository
public class FeedbackDaoImpl implements FeedbackDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void saveFeedback(FeedBack feedback) {
        if (feedback.getId() == null) {
            entityManager.persist(feedback);  
        } else {
            entityManager.merge(feedback);    
        }
    }

    @Override
    public FeedBack findFeedbackById(Long id) {
        return entityManager.find(FeedBack.class, id);
    }

    @Override
    public List<FeedBack> findAllFeedback() {
        TypedQuery<FeedBack> query = entityManager.createQuery("SELECT f FROM FeedBack f", FeedBack.class);
        return query.getResultList();
    }

    @Override
    public void deleteFeedback(Long id) {
        FeedBack feedback = findFeedbackById(id);
        if (feedback != null) {
            entityManager.remove(feedback);
        }
    }

    @Override
    public List<FeedBack> findFeedbackByUsername(String username) {
        TypedQuery<FeedBack> query = entityManager.createQuery("SELECT f FROM FeedBack f WHERE f.username = :username", FeedBack.class);
        query.setParameter("username", username);
        return query.getResultList();
    }
}
