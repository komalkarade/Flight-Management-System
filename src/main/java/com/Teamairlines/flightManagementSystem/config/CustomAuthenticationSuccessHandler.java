package com.Teamairlines.flightManagementSystem.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
	                                        Authentication authentication) throws IOException, ServletException {
	    System.out.println("Authenticated user roles: " + authentication.getAuthorities());
	    
	    String targetUrl = "/";
	    for (GrantedAuthority authority : authentication.getAuthorities()) {
	        if (authority.getAuthority().equals("ROLE_ADMIN")) {
	            targetUrl = "/Admindashboard";
	            break;
	        } else if (authority.getAuthority().equals("ROLE_USER")) {
	            targetUrl = "/index";
	            break;
	        }
	    }
	    response.sendRedirect(targetUrl);
	}
}