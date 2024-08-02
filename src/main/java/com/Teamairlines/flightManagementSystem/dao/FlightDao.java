package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import com.Teamairlines.flightManagementSystem.bean.Flight;

public interface FlightDao {
	public void save(Flight flight1);
	public List<Flight>  findAllFlights();
	public void addFlight(Flight flight);
	public List<Flight> findFlightsByRouteId(Long routeId);

    public Flight findFlightsById(Long id);

	}

