<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Passengers</title>
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
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            color:black;
        }
        table, th, td {
            border: 1px solid #ddd;
                        color:black;
            
        }
        th, td {
            padding: 10px;
            text-align: left;
                        color:black;
            
        }
        th {
            background-color: #00D9A5;
            color: black;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #f2f5f9;
            color: black;
        }
        h3 {
            color: #333;
            text-align: center;
        }
        a, button {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #d9a600;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            margin: 5px;
            text-align: center;
        }
        a:hover, button:hover {
            background-color: #001c99;
        }
      
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 10px; /* Add space between buttons */
        }
        .update-btn {
            background-color: green;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .delete-btn {
            background-color: red;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .inquire-btn {
            background-color: blue;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div align="center">
        <h3>All Passengers</h3>
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
                <c:forEach var="passenger" items="${passengerList}">
                    <tr>
                        <td><c:out value="${passenger.passengerName}"/></td>
                        <td><c:out value="${passenger.passengerDOB}"/></td>
                        <td><c:out value="${passenger.fare}"/></td>
                        <td><c:out value="${passenger.embeddedId.ticketNumber}"/></td>
                        <td><c:out value="${passenger.embeddedId.serialNumber}"/></td>
                        
                        
                  <td class="action-buttons" >
                             <a href="${pageContext.request.contextPath}/update-passenger/${passenger.embeddedId.ticketNumber}/${passenger.embeddedId.serialNumber}" class="update-btn">Update</a>
                             
                            <a href="/delete-passenger/${passenger.embeddedId.ticketNumber}" onclick="return confirm('Are you sure you want to delete this passenger?');"class="delete-btn">Delete</a>
                            
<a href="${pageContext.request.contextPath}/inquire-passenger/${passenger.embeddedId.ticketNumber}" class="inquire-btn">Enquire</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/index1">Back to Home</a>
    </div>
</body>
</html>
