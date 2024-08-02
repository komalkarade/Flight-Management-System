<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Passenger Details</title>
    <style>
        body {
            background-image: url('/images/detail.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
            height: 100%;
            color: white;
            text-align: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #00D9A5;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
                        color: black;
            
        }
        tr:nth-child(odd) {
            background-color: #f2f5f9;
            color: black;
        }
        button {
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #d9a600;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #001c99;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #d9a600;
            color: #fff;
            text-decoration: none;
            margin-top: 10px;
        }
        .btn-secondary {
            background-color: #001c99;
        }
        .btn-secondary:hover {
            background-color: #0000ff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Passenger Details</h2>
        <table>
            <thead>
                <tr>
                    <th>Passenger Name</th>
                    <th>Date of Birth</th>
                    <th>Fare</th>
                    <th>Ticket Number</th>
                    <th>Serial Number</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="passenger" items="${passengerList}"> <!-- Changed "passengerOpt" to "passengerList" -->
                    <tr>
                        <td><c:out value="${passenger.passengerName}"/></td>
                        <td><c:out value="${passenger.passengerDOB}"/></td>
                        <td><c:out value="${passenger.fare}"/></td>
                        <td><c:out value="${passenger.embeddedId.ticketNumber}"/></td>
                        <td><c:out value="${passenger.embeddedId.serialNumber}"/></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/update-passenger/${passenger.embeddedId.ticketNumber}/${passenger.embeddedId.serialNumber}" class="btn">Update</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
