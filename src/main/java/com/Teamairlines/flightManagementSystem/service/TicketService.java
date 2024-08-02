package com.Teamairlines.flightManagementSystem.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Teamairlines.flightManagementSystem.bean.Flight;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.bean.Ticket;
import com.Teamairlines.flightManagementSystem.dao.FlightDao;
import com.Teamairlines.flightManagementSystem.dao.PassengerDao;
import com.Teamairlines.flightManagementSystem.dao.PassengerRepository;
import com.Teamairlines.flightManagementSystem.dao.TicketDao;
import com.Teamairlines.flightManagementSystem.dao.TicketRepository;
import com.Teamairlines.flightManagementSystem.exception.TicketNotFoundException;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfDocument;
import com.itextpdf.text.pdf.PdfWriter;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.stereotype.Service;
import java.io.IOException;

@Service
public class TicketService {
    @Autowired
    private FlightDao flightdao;
    @Autowired
    private PassengerDao passengerDao;
    @Autowired
    private TicketDao ticketDao;
@Autowired
private TicketRepository ticketRepository;

@Autowired
private PassengerRepository passengerRepository;
    private static int ageCalculation(String dob) {
        LocalDate today = LocalDate.now();
        String[] dateArr = dob.split("-");
        LocalDate birthDay = LocalDate.of(
                Integer.parseInt(dateArr[0]), // Year
                Integer.parseInt(dateArr[1]), // Month
                Integer.parseInt(dateArr[2])  // Day
        );
        Period period = Period.between(birthDay, today);
        int age = period.getYears();
        return age;
    }

    public static Double discountedFareCalculation(Passenger passenger) {
        int age = ageCalculation(passenger.getPassengerDOB());
        double finalFare = 0.0;

        if (age <= 14) {
            finalFare = passenger.getFare() / 2;
        } else if (age >= 60) {
            finalFare = passenger.getFare() - (passenger.getFare() * 0.30);
        } else {
            finalFare = passenger.getFare();
        }

        return finalFare;
    }

    public boolean capacityCalculation(int numberOfSeatBooking, long flightNumber) {
        Flight flight = flightdao.findFlightsById(flightNumber);
        int seatbook = 0;
        if (flight.getSeatBooked() != null)
            seatbook = flight.getSeatBooked();
        
        int bookedSeat = seatbook + numberOfSeatBooking;
        int balance = flight.getSeatCapacity() - bookedSeat;
        if (balance < 0)
            return false;
        else {
            flight.setSeatBooked(bookedSeat);
            flightdao.save(flight);
            return true;
        }
    }

    public Double totalBillCalculation(List<Passenger> passengerList) {
        double totalValue = 0.0;
        for (Passenger passenger : passengerList) {
            totalValue += discountedFareCalculation(passenger);
        }
        return totalValue;
    }

    public Map<String, Double> calculateTotalWithGST(List<Passenger> passengerList, double gstRate) {
        double totalFare = totalBillCalculation(passengerList);
        double gstAmount = totalFare * gstRate / 100;
        double grandTotal = totalFare + gstAmount;

        Map<String, Double> totals = new HashMap<>();
        totals.put("totalFare", totalFare);
        totals.put("gstAmount", gstAmount);
        totals.put("grandTotal", grandTotal);

        return totals;
    }

    

    public double calculateTotalFare(String ticketNumber) {
        List<Passenger> passengers = getPassengersByTicket(ticketNumber);
        return totalBillCalculation(passengers);
    }

	private List<Passenger> getPassengersByTicket(String ticketNumber) {
		 Long ticketId = Long.parseLong(ticketNumber);
	        return passengerRepository.findByEmbeddedIdTicketNumber(ticketId);
	}

	public Ticket findTicketByNumber(Long ticketNumber) {
		    return ticketRepository.findById(ticketNumber).orElseThrow(() -> new TicketNotFoundException("Ticket not found"));
		}

	public boolean cancelTicket(String ticketNumber) {
	    try {
	        System.out.println("Attempting to cancel ticket number: " + ticketNumber);
	        Optional<Ticket> ticketOptional = ticketRepository.findByTicketNumber(ticketNumber);
	        if (ticketOptional.isPresent()) {
	            Ticket ticket = ticketOptional.get();
	            ticketRepository.delete(ticket);
	            System.out.println("Ticket canceled successfully.");
	            return true; // Ticket successfully canceled
	        } else {
	            System.out.println("Ticket not found.");
	            return false; // Ticket not found
	        }
	    } catch (Exception e) {
	        System.out.println("Error while canceling ticket: " + e.getMessage());
	        return false;
	    }
	}

	public boolean cancelTicket(Long ticketNumber) {
		 Optional<Ticket> ticketOptional = ticketRepository.findById(ticketNumber);
	        
	        if (ticketOptional.isPresent()) {
	            // If present, delete the ticket
	            ticketRepository.delete(ticketOptional.get());
	            return true; // Ticket successfully canceled
	        }
	        
	        return false; // Ticket not found or could not be canceled
	    }
	}



   

   
   

    

