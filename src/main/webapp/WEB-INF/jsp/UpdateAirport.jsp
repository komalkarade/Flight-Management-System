<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Airport</title>
    <style>
        /* Custom styles for the update airport form */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007bff; /* Blue color for headings */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333; /* Darker color for labels */
        }
        .form-group input {
            width: 100%;
            padding: 10px; /* Increased padding for input fields */
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group button {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px 24px; /* Increased padding for buttons */
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
    </style>
</head>
<body>
  <form action="/airport/update" method="post">
    <div class="form-group">
        <label for="airportCode">Airport Code:</label>
        <input type="text" id="airportCode" name="airportCode" value="${airportRecord.airportCode}" required>
    </div>
    <div class="form-group">
        <label for="airportLocation">Airport Location:</label>
        <input type="text" id="airportLocation" name="airportLocation" value="${airportRecord.airportLocation}" required>
    </div>
    <div class="form-group">
        <button type="submit">Save Airport</button>
    </div>
    <a href="<c:url value='/airports' />">Back to Airport List</a>
</form>

</body>
</html>
