<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Ticket Details</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            margin-top: 20px;
            border-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        .card-title {
            color: #007bff;
        }
        .list-group-item {
            font-size: 16px;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
            box-shadow: none;
            transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-primary:focus, .btn-primary.focus {
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
        }

        .alert {
            margin-top: 20px;
        }

        .home-link {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Ticket Details</h2>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Ticket Number: ${ticket.ticketNumber}</h5>
                <p class="card-text">Flight Number: ${ticket.flightNumber}</p>
                <p class="card-text">Total Fare: ${totalFare}</p>
                <p class="card-text">GST Amount: ${gstAmount}</p>
                <p class="card-text">Grand Total: ${grandTotal}</p>
                <h5 class="card-title">Passengers:</h5>
                <ul class="list-group">
                    <c:forEach var="passenger" items="${passengerList}">
                        <li class="list-group-item">
                            ${passenger.passengerName} (DOB: ${passenger.passengerDOB}) - Fare: ${passenger.fare}
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
                <a href="/" class="btn btn-primary home-link">Home</a>
        
    </div>
</body>
</html>
