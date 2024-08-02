<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Report</title>
    <style>
        body {
            background-image: url('/images/AirportR1.jpg');
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
            width: 50%;
            border-collapse: collapse;
            background-color: black;
            color:black;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #00D9A5;
            color: black;
        }
        tr:nth-child(even), tr:nth-child(odd) {
            background-color: #f2f2f2;
                        color:black;
            
        }
        h3 {
            color: #333;
                        color:black;
            
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #00D9A5;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            margin-top: 20px;
                        color:black;
            
        }
        a:hover {
            background-color: #009970;
                        color:black;
            
        }
    </style>
</head>
<body>
    <div align="center">
        <h3>All Routes</h3>
        <table>
            <thead>
                       <tr>
                            <th>Route-id</th>
                            <th>Source Code</th>
                            <th>Destination Code</th>
                            <th>Route Fare</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${routeList}" var="route">
    <tr>
        <td>${route.routeId}</td>
        <td>${route.sourceAirportCode}</td>
        <td>${route.destinationAirportCode}</td>
        <td>${route.fare}</td>
    </tr>
</c:forEach>

                    </tbody>
            </tbody>
        </table>
        <a href="<c:url value='/' />">Back to home</a>
    </div>
</body>
</html>
