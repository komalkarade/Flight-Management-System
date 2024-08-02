package com.Teamairlines.flightManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.dao.PassengerRepository;
import com.Teamairlines.flightManagementSystem.service.PassengerService;
import java.util.List;
import java.util.Optional;

@Controller
public class PassengerController {

    @Autowired
    private PassengerService passengerService;
    @Autowired
    private PassengerRepository repo;

    @GetMapping("/all")
    public ModelAndView showAllPassengers() {
        List<Passenger> passengerList = passengerService.findAll();
        ModelAndView mv = new ModelAndView("passengerReportPage");
        mv.addObject("passengerList", passengerList);
        return mv;
    }

    @GetMapping("/update-passenger/{ticketNumber}/{serialNumber}")
    public ModelAndView showUpdateForm(@PathVariable Long ticketNumber, @PathVariable Integer serialNumber) {
        System.out.println("Fetching passenger with Ticket Number: " + ticketNumber + " and Serial Number: " + serialNumber);

        Optional<Passenger> passengerOptional = passengerService.findByTicketNumberAndSerialNumber(ticketNumber, serialNumber);

        ModelAndView mv = new ModelAndView();
        if (passengerOptional.isPresent()) {
            mv.setViewName("updatePassengerPage");
            mv.addObject("passenger", passengerOptional.get());
        } else {
            mv.setViewName("errorPage");
            mv.addObject("errorMessage", "Passenger with Ticket Number " + ticketNumber + " and Serial Number " + serialNumber + " not found.");
        }
        return mv;
    }

    @PostMapping("/update-passenger")
    public String updatePassenger(@ModelAttribute Passenger passenger) {
        passengerService.save(passenger);
        return "redirect:/all"; // Ensure this matches your list page URL
    }

    @GetMapping("/delete-passenger/{ticketNumber}")
    public String deletePassenger(@PathVariable Long ticketNumber, RedirectAttributes redirectAttributes) {
        try {
            passengerService.deletePassengerByTicketNumber(ticketNumber);
            redirectAttributes.addFlashAttribute("successMessage", "Passenger deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Error deleting passenger: " + e.getMessage());
        }
        return "redirect:/all";
    }
}
