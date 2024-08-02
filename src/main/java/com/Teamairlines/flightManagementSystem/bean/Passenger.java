package com.Teamairlines.flightManagementSystem.bean;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Passenger {

	  @EmbeddedId
	    private TicketPassengerEmbed embeddedId;
	    private String passengerName;
	    private String passengerDOB;
	    private Double fare;
	
		public Passenger(TicketPassengerEmbed embeddedId, String passengerName, String passengerDOB, Double fare) {
			super();
			this.embeddedId = embeddedId;
			this.passengerName = passengerName;
			this.passengerDOB = passengerDOB;
			this.fare = fare;
		}
		public Passenger() {
			super();
			// TODO Auto-generated constructor stub
		}
		public TicketPassengerEmbed getEmbeddedId() {
			return embeddedId;
		}
		public void setEmbeddedId(TicketPassengerEmbed embeddedId) {
			this.embeddedId = embeddedId;
		}
		public String getPassengerName() {
			return passengerName;
		}
		public void setPassengerName(String passengerName) {
			this.passengerName = passengerName;
		}
		public String getPassengerDOB() {
			return passengerDOB;
		}
		public void setPassengerDOB(String passengerDOB) {
			this.passengerDOB = passengerDOB;
		}
		public Double getFare() {
			return fare;
		}
		public void setFare(Double fare) {
			this.fare = fare;
		}
		@Override
		public String toString() {
			return "Passenger [embeddedId=" + embeddedId + ", passengerName=" + passengerName + ", passengerDOB="
					+ passengerDOB + ", fare=" + fare + "]";
		}
	
	
	
}
