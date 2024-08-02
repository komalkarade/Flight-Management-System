package com.Teamairlines.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Teamairlines.flightManagementSystem.bean.Airport;


@Repository
public class AirportDaoImpl implements AirportDao {

    @Autowired
    private AirportRepository repository;
    
    @Override
    public void addAirport(Airport airport) {
        repository.save(airport);
    }

    @Override
    public List<Airport> findAllAirports() {
        return repository.findAll();
    }

    @Override
    public Airport findAirportById(String id) {
        return repository.findById(id).get();
    }
    
    @Override
    public List<String> findAllAirportCodes() {
        return repository.findAllAirportCodes();
    }

	@Override
	public String findAirportCodeByLocation(String sourceAirportCode) {
		return repository.findAirportCodeByLocation(sourceAirportCode);
	}

	@Override
	public List<String> findAllAirportCodes(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAirport(String airportCode, String airportLocation) {
		 Airport airport = repository.findById(airportCode).orElse(null);
	        if (airport != null) {
	            airport.setAirportLocation(airportLocation);
	            repository.save(airport);
	        }		
	}

	@Override
	public void deleteAirportByCode(String airportCode) {
		repository.deleteById(airportCode);
		
	}

@Override
	public void updateAirport(Airport airport) {
	        repository.save(airport);
	    }
	


	@Override
	public void deleteAirport(String airportCode) {
        repository.deleteById(airportCode);
		
	}
}
