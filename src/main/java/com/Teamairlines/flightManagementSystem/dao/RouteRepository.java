package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.Teamairlines.flightManagementSystem.bean.Route;
@Repository

public interface RouteRepository extends JpaRepository<Route,Long> {
	
	 @Query("select max(routeId) from Route")
	    Long findLastRouteId();

	    @Query("select a from Route a where sourceAirportCode = ?1 and destinationAirportCode = ?2")
	    Route findRouteBySourceAndDestination(String sourceAirportCode, String destinationAirportCode);

	    @Query("select routeId from Route")
	    List<Long> findAllRoutesId();
}
