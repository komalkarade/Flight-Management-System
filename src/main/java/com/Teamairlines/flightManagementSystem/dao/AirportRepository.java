package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Teamairlines.flightManagementSystem.bean.Airport;

public interface AirportRepository  extends JpaRepository<Airport,String>{
	 @Query("SELECT airport.airportCode FROM Airport airport")
	    List<String> findAllAirportCodes();

	    @Query("SELECT airport.airportCode FROM Airport airport WHERE airport.airportLocation = :location")
	    String findAirportCodeByLocation(@Param("location") String location);

	    @Query("SELECT airport.airportLocation FROM Airport airport WHERE airport.airportCode = :code")
	    String findAirportLocationByCode(@Param("code") String code);

	    Airport findByAirportCode(String airportCode); 





}
