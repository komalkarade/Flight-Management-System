package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.bean.TicketPassengerEmbed;

@Repository
public class PassengerDaoImpl implements PassengerDao {

    @Autowired
    private PassengerRepository repo;

    @Override
    public void save(Passenger passenger) {
        repo.save(passenger);
    }

    @Override
    public List<Passenger> findByFlightNumber(String flightNumber) {
        Long ticketNumber = Long.valueOf(flightNumber); // Assuming flightNumber can be converted to Long
        return repo.findByEmbeddedIdTicketNumber(ticketNumber);
    }

    @Override
    public Optional<Passenger> findByTicketNumberAndSerialNumber(Long ticketNumber, Integer serialNumber) {
        TicketPassengerEmbed embeddedId = new TicketPassengerEmbed(ticketNumber, serialNumber);
        return repo.findByEmbeddedId(embeddedId);
    }

    @Override
    public List<Passenger> findAll() {
        return repo.findAll();
    }

    @Override
    @Transactional
    public void deleteByTicketNumber(Long ticketNumber) {
        repo.deleteByTicketNumber(ticketNumber);
    }

    @Override
    public List<Passenger> findByTicketNumber(Long ticketNumber) {
        return repo.findByEmbeddedIdTicketNumber(ticketNumber);
    }
}
