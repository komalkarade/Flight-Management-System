package com.Teamairlines.flightManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Teamairlines.flightManagementSystem.bean.FeedBack;
import com.Teamairlines.flightManagementSystem.dao.FeedbackDao;
import com.Teamairlines.flightManagementSystem.dao.FeedbackRepository;

@Service
public class FeedbackService {
	@Autowired
    private FeedbackRepository feedbackRepository;

    public void saveFeedback(FeedBack feedback) {
        feedbackRepository.save(feedback);
    }

    public FeedBack getFeedbackById(Long id) {
        return feedbackRepository.findById(id).orElse(null);
    }

    public List<FeedBack> getAllFeedback() {
        return feedbackRepository.findAll();
    }

    public void deleteFeedback(Long id) {
        feedbackRepository.deleteById(id);
    }

    public List<FeedBack> getFeedbackByUsername(String username) {
        return feedbackRepository.findByUsername(username);
    }
}