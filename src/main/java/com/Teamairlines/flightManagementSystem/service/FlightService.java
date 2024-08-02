package com.Teamairlines.flightManagementSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Teamairlines.flightManagementSystem.bean.Route;
import com.Teamairlines.flightManagementSystem.bean.Flight;
import com.Teamairlines.flightManagementSystem.dao.FlightDao;
import com.Teamairlines.flightManagementSystem.dao.RouteDao;
@Service
public class FlightService {
	
	@Autowired
	private RouteDao routeDao;
	
	public Flight createReturnFlight(Flight flight,String dtime,String atime) {
		Long newId = flight.getFlightNumber()+1;
		Route route = routeDao.findRouteById(flight.getRouteId());
		String sourceCode = route.getDestinationAirportCode();
		String destinationCode = route.getSourceAirportCode();
		Route route2 = routeDao.findRouteBySourceAndDestination(sourceCode, destinationCode);
		return new Flight(newId,flight.getCarrierName(),route2.getRouteId(),flight.getSeatCapacity(),dtime,atime);
	}

}