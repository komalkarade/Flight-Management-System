<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Report</title>
    <style>
        /* Reset default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #cccccc;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3;
            transform: translateY(-3px);
        }

        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .home-link:hover {
            background-color: #218838;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Flight Report</h2>
        <table>
            <thead>
                <tr>
                    <th>Flight Number</th>
                    <th>Airlines Name</th>
                    <th>Route Id</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="flight" items="${flightList}">
                    <tr>
                        <td>${flight.flightNumber}</td>
                        <td>${flight.carrierName}</td>
                        <td>${flight.routeId}</td>
                        <td>${flight.departure}</td>
                        <td>${flight.arrival}</td>
                        <td><a href="/ticket/${flight.flightNumber}" class="btn btn-secondary btn-sm">Book Ticket</a></td>
                </c:forEach>
            </tbody>
        </table>
        <a href="/" class="home-link">Back to Home</a>
    </div>
</body>
</html>
