<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/images/flights.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }
        .details-container {
            margin-top: 50px;
            padding: 30px;
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: black;
        }
        .details-title {
            margin-bottom: 20px;
            color: black;
        }
        .home-link {
            margin-top: 20px;
            display: block;
            text-align: center;
            color: black;
        }
    </style>
    <script>
        window.onload = function() {
            // Show alert if there is a message in flash attributes
            const message = '<c:out value="${message}"/>';
            const errorMessage = '<c:out value="${errorMessage}"/>';
            
            if (message) {
                alert(message);
            }
            if (errorMessage) {
                alert(errorMessage);
            }
        };
       




    </script>
</head>
<body>
<div class="container details-container">
    <h1 class="details-title">Ticket Information</h1>
    <p><strong>Ticket Number:</strong> ${ticket.ticketNumber}</p>
    <p><strong>Flight Number:</strong> ${ticket.flightNumber}</p>
    <p><strong>Carrier Name:</strong> ${ticket.carrierName}</p>
    <p><strong>From:</strong> ${fromCity}</p>
    <p><strong>To:</strong> ${toCity}</p>
    <p><strong>Fare:</strong> ${fare}</p>

    <h3>Passenger List</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Date of Birth</th>
                <th>Fare</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="passenger" items="${passengerList}">
                <tr>
                    <td>${passenger.passengerName}</td>
                    <td>${passenger.passengerDOB}</td>
                    <td>${passenger.fare}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Total Amount Section -->
    <h3>Total Amount</h3>
    <p><strong>Total Fare:</strong> ${totalFare}</p>
    <p><strong>GST (18%):</strong> ${gstAmount}</p>
    <p><strong>Grand Total:</strong> ${grandTotal}</p>


    <a href="/" class="btn btn-primary home-link">Home</a>
</div>
</body>
</html>
