<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Airport Details</title>
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
            width: 30%;
            border-collapse: collapse;
            margin: 20px auto;
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
        }
         tr:nth-child(odd) {
            background-color: #f2f5f9;
            color:black;
        }
        h3 {
            color: #333;
            text-align: center;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #d9a600;
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            margin: 20px auto;
            text-align: center;
            display: block;
            width: fit-content;
        }
        a:hover {
            background-color: #001c99;
        }
    </style>
</head>
<body>
<div align="center">
    <h3>Airport Details</h3>
    <table>
        <tbody>
            <tr>
                <th>Airport Code</th>
                <td><c:out value="${airport.airportCode}"/></td>
            </tr>
            <tr>
                <th>Airport Location</th>
                <td><c:out value="${airport.airportLocation}"/></td>
            </tr>
        </tbody>
    </table>
    <a href="/airport-select">Back to Airport List</a>
</div>
</body>
</html>
