package com.Teamairlines.flightManagementSystem.controller;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Teamairlines.flightManagementSystem.bean.FlightUser;
import com.Teamairlines.flightManagementSystem.service.FlightUserService;

@Controller
public class LoginController {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private FlightUserService service;

    @GetMapping("/index1")
    public ModelAndView showHomePage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        
        FlightUser user = service.findByUsername(username);

        System.out.println("Authenticated user: " + user);
        if (user != null) {
            System.out.println("User type: " + user.getType());
        } else {
            System.out.println("User object is null");
        }

        if (user != null) {
            if ("ADMIN".equalsIgnoreCase(user.getType())) {
                return new ModelAndView("Admindashboard");
            }  else if ("USER".equalsIgnoreCase(user.getType()) || "Customer".equalsIgnoreCase(user.getType())) {  
            	return new ModelAndView("index");
            }
        }

        return new ModelAndView("error");
    }



    @GetMapping("/register")
    public ModelAndView showUserRegistrationPage() {
        FlightUser user = new FlightUser();
        return new ModelAndView("newUserEntry", "userRecord", user);
    }

    @PostMapping("/register")
    public ModelAndView saveUserRegistrationPage(@ModelAttribute("userRecord") FlightUser user) {
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);
        service.save(user);
        return new ModelAndView("loginPage");
    }

    @GetMapping("/login")
    public ModelAndView showLoginPage() {
        return new ModelAndView("loginPage");
    }
  
    @GetMapping("/loginErrorPage")
    public ModelAndView showLoginErrorPage() {
        return new ModelAndView("loginError");
    }
    @PostMapping("/login")
    public ModelAndView login(@RequestParam String username, @RequestParam String password) {
        ModelAndView modelAndView = new ModelAndView("loginPage");
        boolean isAuthenticated = authenticateUser(username, password);

		if (!isAuthenticated) {
		    modelAndView.addObject("error", "Invalid username or password");
		} else {
		    return new ModelAndView("redirect:/index1");
		}
        return modelAndView;
    }




	private boolean authenticateUser(String username, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@GetMapping("/contactUs")
    public ModelAndView showContactPage() {
        return new ModelAndView("contact_us");
    }

}


