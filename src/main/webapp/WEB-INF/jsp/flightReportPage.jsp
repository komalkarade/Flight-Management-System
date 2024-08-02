<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Report</title>
    <style >
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        background-image: url('/images/flights.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        height: 100vh;
        color: white;
        text-align: center;
        margin: 0;
        font-family: Arial, sans-serif;
        color:black;
    }

    h2 {
        margin-top: 20px;
        font-weight: bold;
                color:black;
                background-color:blue;
        
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background-color: rgba(255, 255, 255, 0.8); 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                color:black;
        
    }

    th, td {
        padding: 10px;
        border: 1px solid #cccccc;
                color:black;
        
    }

    th {
        background-color: #007bff;
        color: white;
        
    }

    tr:nth-child(even,odd) {
        background-color: #f2f2f2;
    }

    a {
        display: inline-block;
        margin-top: 10px;
        color: #007bff;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #0056b3;
    }

    footer {
        background-color: #333333;
         color:black;
        padding: 10px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: fixed;
        width: 100%;
        bottom: 0;
        box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
        font-weight:bold;
    }

    footer:hover {
        transform: translateY(-3px);
    }
    </style>
    </head>
<body>
    <h2 class="heading">Flight Report</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Flight Number</th>
                <th>Airlines Name</th>
                <th>Route Id</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>Seat Available</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${flightList}" var="flight">
                <tr>
                    <td>${flight.flightNumber}</td>
                    <td>${flight.carrierName}</td>
                    <td>${flight.routeId}</td>
                    <td>${flight.departure}</td>
                    <td>${flight.arrival}</td>
                    <c:set var="seatAvailable" scope="session" value="${flight.seatCapacity - flight.seatBooked}"/>
                    <td>${seatAvailable}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="<c:url value='/index1' />">Back to home</a>
</body>
</html>
