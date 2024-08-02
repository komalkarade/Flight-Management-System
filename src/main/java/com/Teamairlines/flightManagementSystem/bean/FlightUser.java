package com.Teamairlines.flightManagementSystem.bean;



import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class FlightUser extends User
{
	@Id
	private String username;
	private String password;
    private String type; 

	public FlightUser() {
		super("abc","pqr",new ArrayList<>());
		// TODO Auto-generated constructor stub
	}

	public FlightUser(String username, String password, Collection<? extends GrantedAuthority> authorities, String type) {
        super(username, password, authorities);
        this.username = username;
        this.password = password;
        this.type = type;
    }


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	


	@Override
	public String toString() {
		return "FlightUser [username=" + username + ", password=" + password + ", type=" + type + "]";
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
	    return Collections.singleton(new SimpleGrantedAuthority("ROLE_" + this.getType()));
	}

	    public boolean isAccountNonExpired() { return true; }
	    @Override
	    public boolean isAccountNonLocked() { return true; }
	    @Override
	    public boolean isCredentialsNonExpired() { return true; }
	    @Override
	    public boolean isEnabled() { return true; }
	
	}