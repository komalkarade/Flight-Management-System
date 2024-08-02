package com.Teamairlines.flightManagementSystem.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.Teamairlines.flightManagementSystem.bean.Ticket;

@Repository
public class TicketDaoImpl implements TicketDao {
    @Autowired

    private  TicketRepository repo;
   

    @Override
    public void save(Ticket ticket) {
        repo.save(ticket);
    }

    @Override
    public Long findLastTicketNumber() {
        Long val = repo.findLastTicketNumber();
        if (val == null) {
            val = 1000001L;
        } else {
            val += 1L;
        }
        return val;
    }

    
	}

	






