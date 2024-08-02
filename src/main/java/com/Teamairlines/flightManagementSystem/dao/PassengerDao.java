package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import com.Teamairlines.flightManagementSystem.bean.Passenger;

public interface PassengerDao {
    void save(Passenger passenger);
    List<Passenger> findAll();
    List<Passenger> findByFlightNumber(String flightNumber);
	List<Passenger> findByTicketNumber(Long ticketNumber);
	Optional<Passenger> findByTicketNumberAndSerialNumber(Long ticketNumber, Integer serialNumber);
    void deleteByTicketNumber(Long ticketNumber);  // New method for deleting passenger

}
