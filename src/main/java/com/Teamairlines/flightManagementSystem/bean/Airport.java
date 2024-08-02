package com.Teamairlines.flightManagementSystem.bean;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Airport {
	@Id
private String airportCode;
private String airportLocation;


public Airport() {
	super();
	// TODO Auto-generated constructor stub
}


public Airport(String airportCode, String airportLocation) {
	super();
	this.airportCode = airportCode;
	this.airportLocation = airportLocation;
}


public String getAirportCode() {
	return airportCode;
}


public void setAirportCode(String airportCode) {
	this.airportCode = airportCode;
}


public String getAirportLocation() {
	return airportLocation;
}


public void setAirportLocation(String airportLocation) {
	this.airportLocation = airportLocation;
}


@Override
public String toString() {
	return "Airport [airportCode=" + airportCode + ", airportLocation=" + airportLocation + "]";
}


}
