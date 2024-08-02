<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Select Airport</title>
    <style>
        body {
  background-image: url('/images/1.jpg');
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
        form {
            width: 300px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: bold;
        }
        select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            color: #333;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        button {
            background-color: #30d2d8;
            color: white;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #a0458c;
        }
        h3 {
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
<div>
    <h3>Select an Airport</h3>
    <form action="/airport-select" method="post">
        <label for="airport-code">Airport Code:</label>
        <select id="airport-code" name="airport-code">
            <c:forEach var="code" items="${airportList}">
                <option value="${code}">${code}</option>
            </c:forEach>
        </select>
        <button type="submit">View Details</button>
                    <a href="<c:url value='/index1' />">Back to home</a>
        
    </form>
    
</div>
</body>
</html>
