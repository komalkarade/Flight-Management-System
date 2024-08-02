package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import com.Teamairlines.flightManagementSystem.bean.Airport;

public interface AirportDao {
    public void addAirport(Airport airport);
    public List<Airport> findAllAirports();
    public Airport findAirportById(String id);
    public List<String> findAllAirportCodes(String id);
	public String findAirportCodeByLocation(String sourceAirportCode);
	List<String> findAllAirportCodes();
	public void updateAirport(String airportCode, String airportLocation);

   public  void deleteAirportByCode(String airportCode);
public void updateAirport(Airport airport);
public void deleteAirport(String airportCode);
    }
