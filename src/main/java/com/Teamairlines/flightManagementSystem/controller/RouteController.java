package com.Teamairlines.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Teamairlines.flightManagementSystem.bean.Airport;
import com.Teamairlines.flightManagementSystem.bean.Flight;
import com.Teamairlines.flightManagementSystem.bean.Route;
import com.Teamairlines.flightManagementSystem.dao.AirportDao;
import com.Teamairlines.flightManagementSystem.dao.FlightDao;
import com.Teamairlines.flightManagementSystem.dao.RouteDao;
import com.Teamairlines.flightManagementSystem.exception.FlightNotFoundException;
import com.Teamairlines.flightManagementSystem.exception.RouteException;
import com.Teamairlines.flightManagementSystem.service.FlightService;
import com.Teamairlines.flightManagementSystem.service.RouteService;

import java.util.List;

import javax.transaction.Transactional;

@ControllerAdvice
@RestController
public class RouteController {

	@Autowired
	private RouteDao routeDao;
	@Autowired
	private RouteService routeService;
	@Autowired
	private AirportDao airportDao;
	@Autowired
	private FlightService service;
	@Autowired
	private FlightDao flightDao;
	  @GetMapping("/route")
	    public ModelAndView showRouteEntryPage() {
	        Long newRouteId = routeDao.generateRouteId();
	        Route route = new Route();
	        route.setRouteId(newRouteId);

	        List<Airport> airportList = airportDao.findAllAirports();

	        ModelAndView mv = new ModelAndView("routeEntryPage");
	        mv.addObject("routeRecord", route);
	        mv.addObject("airportList", airportList);
	        return mv;
	    }

	    @PostMapping("/route")
	    public ModelAndView saveRoutes(@ModelAttribute("routeRecord") Route route1) {
	        String source = route1.getSourceAirportCode().toUpperCase();
	        String destination = route1.getDestinationAirportCode().toUpperCase();
	      String sourceCode = airportDao.findAirportCodeByLocation(source);
	      String destinationCode = airportDao.findAirportCodeByLocation(destination);
	      route1.setSourceAirportCode(sourceCode);
	      route1.setDestinationAirportCode(destinationCode);
	        Route route2 = routeService.createReturnRoute(route1);
	        routeDao.save(route1);
	        routeDao.save(route2);
	        return new ModelAndView("index");
	    }

	    @GetMapping("/routes")
	    public ModelAndView viewAllRoutes() {
	        List<Route> routeList = routeDao.findAllRoutes();
	        ModelAndView mv = new ModelAndView("viewRoutes");
	        mv.addObject("routeList", routeList);
	        return mv;
	    }
	    @GetMapping("/viewRoutes")
	    public ModelAndView showRouteReportPage() {
	        List<Route> routeList = routeDao.findAllRoutes();
	        ModelAndView mv = new ModelAndView("routeReportPage");
	        mv.addObject("routeList", routeList);
	        return mv;
	    }


	    @GetMapping("/flight")
		public ModelAndView showFlightEntryPage() {
			List<Long> routeList = routeDao.findAllRoutesId();
			Flight flight = new Flight();
			ModelAndView mv =new ModelAndView("flightEntryPage");
			mv.addObject("flightRecord",flight);
			mv.addObject("routeList",routeList);
			return mv;
		}
		
		@PostMapping("/flight")
		public ModelAndView saveFlights(@ModelAttribute("flightRecord")Flight flight1, @RequestParam("dtime") String dtime,@RequestParam("atime") String atime) {
			Flight flight2 = service.createReturnFlight(flight1, dtime, atime);
			flightDao.save(flight1);
			flightDao.save(flight2);
			return new ModelAndView("index");
			
		}
		
		@GetMapping("/flights")
		public ModelAndView showFlightReportPage() {
			List<Flight> flightList = flightDao.findAllFlights();
			ModelAndView mv = new  ModelAndView("flightReportPage");
			mv.addObject("flightList",flightList);
			return mv;
		}
		

	
		@GetMapping("/searchflight")
		public ModelAndView showRouteSelectionPage(@RequestParam(value = "errorMessage", required = false) String errorMessage) {
		    ModelAndView mv = new ModelAndView("routeSelectPage");
		    try {
		        List<Airport> airportList = airportDao.findAllAirports();
		        mv.addObject("airportList", airportList);
		        if (errorMessage != null) {
		            mv.addObject("errorMessage", errorMessage);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        mv.addObject("errorMessage", "An error occurred while fetching airport data.");
		    }
		    return mv;
		}

		@PostMapping("/searchflight")
		public ModelAndView showRouteFlightPage(@RequestParam("fromCity") String fromCity, @RequestParam("toCity") String toCity) {
		    try {
		        fromCity = fromCity.toUpperCase();
		        toCity = toCity.toUpperCase();

		        String fromAirport = airportDao.findAirportCodeByLocation(fromCity);
		        String toAirport = airportDao.findAirportCodeByLocation(toCity);

		        if (fromAirport == null || toAirport == null) {
		            return new ModelAndView("redirect:/searchflight?errorMessage=Invalid source or destination city.");
		        }

		        if (fromAirport.equalsIgnoreCase(toAirport)) {
		            return new ModelAndView("redirect:/searchflight?errorMessage=Source and Destination City cannot be the same.");
		        }

		        Route route = routeDao.findRouteBySourceAndDestination(fromAirport, toAirport);

		        if (route == null) {
		            return new ModelAndView("redirect:/searchflight?errorMessage=No route found between the selected cities.");
		        }

		        List<Flight> flightList = flightDao.findFlightsByRouteId(route.getRouteId());

		        if (flightList.isEmpty()) {
		            return new ModelAndView("redirect:/searchflight?errorMessage=No flights available for the selected route.");
		        }

		        ModelAndView mv = new ModelAndView("routeFlightShowPage");
		        mv.addObject("flightList", flightList);
		        mv.addObject("fromAirport", fromCity);
		        mv.addObject("toAirport", toCity);
		        mv.addObject("fare", route.getFare());
		        return mv;
		    } catch (Exception e) {
		        return new ModelAndView("redirect:/searchflight?errorMessage=An unexpected error occurred.");
		    }
		}

	public ModelAndView handlingRouteException(RouteException exception) {
		String msg = "Source And Destination City Can Not Be Same !!!";
		ModelAndView mv = new ModelAndView("routeErrorPage");
		mv.addObject("errorMessage",msg);
		return mv;
	}

}
