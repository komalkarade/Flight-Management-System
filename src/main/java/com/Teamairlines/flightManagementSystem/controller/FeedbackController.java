package com.Teamairlines.flightManagementSystem.controller;

import com.Teamairlines.flightManagementSystem.bean.FeedBack;
import com.Teamairlines.flightManagementSystem.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/feedback")
    public ModelAndView showFeedbackForm() {
        ModelAndView mv = new ModelAndView("feebackPage");
        mv.addObject("feedback", new FeedBack()); // Add a new FeedBack object to the model
        return mv;
    }
 

    @PostMapping("/feedback")
    public ModelAndView submitFeedback(@ModelAttribute("feedback") FeedBack feedback) {
        feedbackService.saveFeedback(feedback);
        return new ModelAndView("redirect:/feedback/success");
    }

    @GetMapping("/feedback/success")
    public ModelAndView showFeedbackSuccess() {
        ModelAndView mv = new ModelAndView("FeedbackSuccess"); 
        mv.addObject("message", "Thank you for your feedback!");
        return mv;
    }

    @GetMapping("/feedback/list")
    public ModelAndView listFeedback() {
        ModelAndView mv = new ModelAndView("feedbackReport"); // Ensure "FeedbackList.jsp" exists in the correct directory
        mv.addObject("feedbackList", feedbackService.getAllFeedback());
        return mv;
    }

    @GetMapping("/feedback/delete/{id}")
    public ModelAndView deleteFeedback(@PathVariable("id") Long id) {
        feedbackService.deleteFeedback(id);
        return new ModelAndView("redirect:/feedback/list");
    }

    @GetMapping("/feedback/user/{username}")
    public ModelAndView getFeedbackByUsername(@PathVariable("username") String username) {
        ModelAndView mv = new ModelAndView("FeedbackList"); // Ensure "FeedbackList.jsp" exists in the correct directory
        mv.addObject("feedbackList", feedbackService.getFeedbackByUsername(username));
        return mv;
    }
}
