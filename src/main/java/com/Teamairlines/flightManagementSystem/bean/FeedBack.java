package com.Teamairlines.flightManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class FeedBack {
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY) 
	private Long id;

    private String username;
    private String message; // Ensure this property is present
	public FeedBack() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FeedBack(Long id, String username, String message) {
		super();
		this.id = id;
		this.username = username;
		this.message = message;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "FeedBack [id=" + id + ", username=" + username + ", message=" + message + "]";
	}
	
}