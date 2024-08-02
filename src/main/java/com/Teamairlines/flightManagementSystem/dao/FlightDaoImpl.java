package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Teamairlines.flightManagementSystem.bean.Flight;

@Repository
public class FlightDaoImpl implements FlightDao {
	@Autowired
	private FlightRepository repository;
	
	public void save(Flight flight) {
		repository.save(flight);
	}

	
	 @Override
	    public List<Flight> findAllFlights() {
	        return repository.findAll();
	    }

	    @Override
	    public void addFlight(Flight flight) {
	    }


		@Override
		public List<Flight> findFlightsByRouteId(Long routeId) {
			return  repository.findFlightsByRouteId(routeId);
		}


		@Override
		public Flight findFlightsById(Long id) {
			// TODO Auto-generated method stub
return 	repository.findById(id).get()	;}

}
