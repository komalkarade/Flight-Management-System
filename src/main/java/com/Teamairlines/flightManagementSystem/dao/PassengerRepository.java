package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.Teamairlines.flightManagementSystem.bean.Passenger;
import com.Teamairlines.flightManagementSystem.bean.TicketPassengerEmbed;

@Repository
public interface PassengerRepository extends JpaRepository<Passenger, TicketPassengerEmbed> {
	@Query("SELECT p FROM Passenger p WHERE p.embeddedId.ticketNumber = :ticketNumber")
    List<Passenger> findByEmbeddedIdTicketNumber(@Param("ticketNumber") Long ticketNumber);
    Optional<Passenger> findByEmbeddedId(TicketPassengerEmbed embeddedId);

    Optional<Passenger> findByEmbeddedIdTicketNumberAndEmbeddedIdSerialNumber(Long ticketNumber, Integer serialNumber);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM Passenger p WHERE p.embeddedId.ticketNumber = :ticketNumber")
    void deleteByTicketNumber(@Param("ticketNumber") Long ticketNumber);
	



	}



