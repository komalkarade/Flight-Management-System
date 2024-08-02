package com.Teamairlines.flightManagementSystem.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Teamairlines.flightManagementSystem.bean.Flight;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.bean.Route;
import com.Teamairlines.flightManagementSystem.bean.Ticket;
import com.Teamairlines.flightManagementSystem.bean.TicketPassengerEmbed;
import com.Teamairlines.flightManagementSystem.dao.FlightDao;
import com.Teamairlines.flightManagementSystem.dao.PassengerDao;
import com.Teamairlines.flightManagementSystem.dao.RouteDao;
import com.Teamairlines.flightManagementSystem.dao.TicketDao;
import com.Teamairlines.flightManagementSystem.exception.FlightNotFoundException;
import com.Teamairlines.flightManagementSystem.exception.SeatNotFoundException;
import com.Teamairlines.flightManagementSystem.exception.TicketNotFoundException;
import com.Teamairlines.flightManagementSystem.service.PassengerService;
import com.Teamairlines.flightManagementSystem.service.TicketService;

@Controller
public class TicketController {

    @Autowired
    private TicketDao ticketDao;

    @Autowired
    private FlightDao flightDao;

    @Autowired
    private RouteDao routeDao;

    @Autowired 
    private TicketService ticketService;

    @Autowired
    private PassengerDao passengerDao;

    @Autowired
    private PassengerService passengerService;

    @GetMapping("/ticket/{id}")
    public ModelAndView showTicketBookingPage(@PathVariable Long id) {
        Flight flight = flightDao.findFlightsById(id);
        if (flight == null) {
            throw new FlightNotFoundException("Flight not found for ID: " + id);
        }

        Route route = routeDao.findRouteById(flight.getRouteId());
        Long newTicketId = ticketDao.findLastTicketNumber();
        Ticket ticket = new Ticket();
        ticket.setTicketNumber(newTicketId);
        ticket.setFlightNumber(flight.getFlightNumber());
        ticket.setCarrierName(flight.getCarrierName());
        
        ModelAndView mv = new ModelAndView("ticketBookingPage");
        mv.addObject("ticketRecord", ticket);
        mv.addObject("flight", flight);
        mv.addObject("route", route);
        
        return mv;
    }

    @PostMapping("/ticket")
    public ModelAndView openShowTicketPage(@ModelAttribute("ticketRecord") Ticket ticket, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("showTicketPage");

        String fromCity = request.getParameter("fromLocation");
        String toCity = request.getParameter("toLocation");
        Double fare = Double.parseDouble(request.getParameter("fare"));
      
        List<Passenger> passengerList = new ArrayList<>();
        for (int i = 1; i <= 6; i++) {
            String pname = request.getParameter("name" + i);
            if (pname != null && !pname.trim().isEmpty() && !pname.equals("--")) {
                String dob = request.getParameter("dob" + i);
                TicketPassengerEmbed embed = new TicketPassengerEmbed(ticket.getTicketNumber(), i);
                Passenger passenger = new Passenger(embed, pname, dob, fare);
                Double pfare = ticketService.discountedFareCalculation(passenger);
                passenger.setFare(pfare);
                passengerList.add(passenger);
            }
        }

        if (passengerList.isEmpty()) {
            throw new SeatNotFoundException("No valid passengers found");
        }

        Map<String, Double> totals = ticketService.calculateTotalWithGST(passengerList, 18.0);
        ticket.setTotalAmount(totals.get("totalFare"));

        if (ticketService.capacityCalculation(passengerList.size(), ticket.getFlightNumber())) {
            ticketDao.save(ticket);
            for (Passenger passenger : passengerList) {
                passengerDao.save(passenger);
            }
        } else {
            throw new SeatNotFoundException("Not enough seats available");
        }

        mv.addObject("ticket", ticket);
        mv.addObject("fromCity", fromCity);
        mv.addObject("toCity", toCity);
        mv.addObject("passengerList", passengerList);
        mv.addObject("totalFare", totals.get("totalFare"));
        mv.addObject("gstAmount", totals.get("gstAmount"));
        mv.addObject("grandTotal", totals.get("grandTotal"));
        mv.addObject("fare", fare);
        return mv;
    }

    @GetMapping("/inquire-passenger/{ticketNumber}")
    public ModelAndView inquirePassenger(@PathVariable("ticketNumber") Long ticketNumber) {
        List<Passenger> passengerList = passengerService.getPassengerByTicketNumber(ticketNumber);

        ModelAndView mv = new ModelAndView("passengerDetails");
        mv.addObject("passengerList", passengerList);
        return mv;
    }
    @GetMapping("/searchTicket")
    public String searchTicket(@RequestParam(value = "ticketNumber", required = false) String ticketNumber, Model model) {
        if (ticketNumber == null || ticketNumber.trim().isEmpty()) {
            model.addAttribute("message", "Ticket number is required.");
            return "searchTicket"; // Displays the form page with an error message
        }

        try {
            Ticket ticket = ticketService.findTicketByNumber(Long.parseLong(ticketNumber));
            List<Passenger> passengerList = passengerService.getPassengerByTicketNumber(ticketNumber);
            double totalFare = ticketService.totalBillCalculation(passengerList);
            double gstAmount = totalFare * 0.18; // 18% GST
            double grandTotal = totalFare + gstAmount;

            model.addAttribute("ticket", ticket);
            model.addAttribute("passengerList", passengerList);
            model.addAttribute("totalFare", totalFare);
            model.addAttribute("gstAmount", gstAmount);
            model.addAttribute("grandTotal", grandTotal);
            return "ticketDetails"; // If ticket details are shown on another page
        } catch (TicketNotFoundException ex) {
            model.addAttribute("message", ex.getMessage());
            return "searchTicket"; // Displays the form page with an error message
        }
    }


    @PostMapping("/cancelTicket")
    public String cancelTicket(@RequestParam("ticketNumber") Long ticketNumber, Model model) {
        try {
            boolean isCanceled = ticketService.cancelTicket(ticketNumber);
            if (isCanceled) {
                model.addAttribute("cancellationSuccess", true);
            } else {
                model.addAttribute("cancellationError", "Ticket not found or could not be canceled.");
            }
        } catch (Exception e) {
            model.addAttribute("cancellationError", "An error occurred while processing your request.");
        }
        return "cancelTicket";
    }

    @GetMapping("/cancelTicket")
    public String showCancelTicketForm() {
        return "cancelTicket";
    }


}
