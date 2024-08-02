package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;
import com.Teamairlines.flightManagementSystem.bean.FeedBack;

public interface FeedbackDao {

    void saveFeedback(FeedBack feedback);

    FeedBack findFeedbackById(Long id);

    List<FeedBack> findAllFeedback();

    void deleteFeedback(Long id);

    List<FeedBack> findFeedbackByUsername(String username);
}
