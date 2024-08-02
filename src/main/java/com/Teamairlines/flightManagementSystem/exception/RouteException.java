package com.Teamairlines.flightManagementSystem.exception;

public class RouteException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private String errorMessage;

    // Default constructor
    public RouteException() {
        super();
    }

    public RouteException(String errorMessage) {
        super(errorMessage);
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
