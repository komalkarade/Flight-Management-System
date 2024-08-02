package com.Teamairlines.flightManagementSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.Teamairlines.flightManagementSystem.bean.FlightUser;
import com.Teamairlines.flightManagementSystem.dao.FlightUserRepository;

@Service
public class FlightUserService implements UserDetailsService {
	@Autowired
	private FlightUserRepository repository;
	private String type;		
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    FlightUser user = repository.findById(username)
	            .orElseThrow(() -> new UsernameNotFoundException("User not found: " + username));
	    return user;
	}

	    
	    public void save(FlightUser user) {
	        repository.save(user);
	    }
	    
	    public FlightUser findByUsername(String username) {
	        return repository.findById(username).orElse(null);
	    }

			 public String getType() {
					return type;
			      
		}
	}