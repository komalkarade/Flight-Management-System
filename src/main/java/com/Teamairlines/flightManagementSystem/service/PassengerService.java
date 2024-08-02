package com.Teamairlines.flightManagementSystem.service;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.dao.PassengerDao;
import com.Teamairlines.flightManagementSystem.dao.PassengerRepository;

@Service
public class PassengerService {

    @Autowired
    private PassengerDao passengerDao;
    @Autowired
    private PassengerRepository passengerRepository;

    public void save(Passenger passenger) {
        passengerDao.save(passenger);
    }

    public List<Passenger> findAll() {
        return passengerDao.findAll();
    }

    public Optional<Passenger> findByTicketNumberAndSerialNumber(Long ticketNumber, Integer serialNumber) {
        return passengerDao.findByTicketNumberAndSerialNumber(ticketNumber, serialNumber);
    }

    public void deletePassengerByTicketNumber(Long ticketNumber) {
        passengerDao.deleteByTicketNumber(ticketNumber);
    }

    public List<Passenger> findByTicketNumber(Long ticketNumber) {
        return passengerDao.findByTicketNumber(ticketNumber);
    }

    public List<Passenger> getPassengerByTicketNumber(Long ticketNumber) {
        return passengerRepository.findByEmbeddedIdTicketNumber(ticketNumber);
    }

	public List<Passenger> getPassengerByTicketNumber(String ticketNumber) {
		 Long ticketId = Long.parseLong(ticketNumber);
	        return passengerRepository.findByEmbeddedIdTicketNumber(ticketId);
	}
}
