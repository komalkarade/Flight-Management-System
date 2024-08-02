package com.Teamairlines.flightManagementSystem.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Teamairlines.flightManagementSystem.bean.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
    @Query("SELECT MAX(t.ticketNumber) FROM Ticket t")
    Long findLastTicketNumber();
    @Query("SELECT MAX(t.ticketNumber) FROM Ticket t")

    Optional<Ticket> findByTicketNumber(String ticketNumber);
    @Query("SELECT MAX(t.ticketNumber) FROM Ticket t")

    Ticket findByEmbeddedIdTicketNumberAndEmbeddedIdSerialNumber(Long ticketNumber);
    @Query("SELECT MAX(t.ticketNumber) FROM Ticket t")

    Optional<Ticket> findByTicketNumber(Long ticketNumber);

}
