package com.Teamairlines.flightManagementSystem.controller;



import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.Teamairlines.flightManagementSystem.bean.Airport;
import com.Teamairlines.flightManagementSystem.bean.Flight;
import com.Teamairlines.flightManagementSystem.dao.AirportDao;
import com.Teamairlines.flightManagementSystem.dao.AirportRepository;
import com.Teamairlines.flightManagementSystem.dao.FlightDaoImpl;


@RestController
public class AirportController {

    @Autowired
    private AirportDao airportDao;
    
    @Autowired
    FlightDaoImpl flightDaoImpl;
    @Autowired
    AirportRepository repo;
    

    @GetMapping("/airport")
    public ModelAndView showAddAirportPage() {
        ModelAndView mv = new ModelAndView("addAirport");
        mv.addObject("airportDetails", new Airport());
        return mv;
    }

    @PostMapping("/airport")
    public ModelAndView saveAirport(@ModelAttribute("airportRecord") Airport airport) {
        airport.setAirportCode(airport.getAirportCode().toUpperCase());
        airport.setAirportLocation(airport.getAirportLocation().toUpperCase());
        airportDao.addAirport(airport);
        return new ModelAndView("index");
    }

    @GetMapping("/airport-select")
    public ModelAndView showAirportSelectPage() {
        List<String> airportList = airportDao.findAllAirportCodes();
        ModelAndView mv = new ModelAndView("airportSelectPage");
        mv.addObject("airportList", airportList);
        return mv;
    }

    @PostMapping("/airport-select")
    public ModelAndView showSingleAirportPage1(@RequestParam("airport-code") String id) {
        List<String> airportList = airportDao.findAllAirportCodes();
        Optional<Airport> airportOpt = Optional.ofNullable(airportDao.findAirportById(id));
        ModelAndView mv = new ModelAndView("airportShowPage");
        mv.addObject("airportList", airportList);
        airportOpt.ifPresent(airport -> mv.addObject("airport", airport));
        return mv;
    }
    @GetMapping("/airport/{id}")
    public ModelAndView showSingleAirportPage(@PathVariable("id") String id) {
        Airport airport = airportDao.findAirportById(id);
        ModelAndView mv = new ModelAndView("airportShowPage");
        mv.addObject("airport", airport);
        return mv;
    }
    @GetMapping("/airports")
    public ModelAndView showAirportReportPage() {
        List<Airport> airportList = airportDao.findAllAirports();
        ModelAndView mv = new ModelAndView("airportReportPage");
        mv.addObject("airportList", airportList);
        return mv;
    }
    @GetMapping("/airports1")
    public ModelAndView showAirportReportPage1() {
        List<Airport> airportList = airportDao.findAllAirports();
        ModelAndView mv = new ModelAndView("airportreport1");
        mv.addObject("airportList", airportList);
        return mv;
    }
    @GetMapping("/airport/update/{id}")
    public ModelAndView showUpdateAirportPage(@PathVariable("id") String id) {
        Airport airport = airportDao.findAirportById(id);
        ModelAndView mv = new ModelAndView("UpdateAirport");
        mv.addObject("airportRecord", airport);
        return mv;
    }

    @PostMapping("/airport/update")
    public ModelAndView updateAirport(@ModelAttribute("airportRecord") Airport airport) {
        airportDao.updateAirport(airport);
        
        ModelAndView mv = new ModelAndView("redirect:/airports"); // Redirect to a list page or another view
        mv.addObject("message", "Airport updated successfully");
        return mv;
    }




    @PostMapping("/airport/delete/{id}")
    public ModelAndView deleteAirport(@PathVariable("id") String id) {
        airportDao.deleteAirport(id); // Assuming you have this method implemented
        return new ModelAndView("redirect:/airports");
    }

   

   


    }
