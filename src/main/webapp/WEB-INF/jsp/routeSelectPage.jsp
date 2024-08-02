<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Route Selection</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Your existing CSS styles */
        body {
            background-image: url('/images/routy12.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed; 
            height: 100vh; /* Adjusted to full viewport height */
            color: white;
            text-align: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .heading {
            text-align: center;
            margin-bottom: 20px;
            color: #333333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #666666;
        }
        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            transition: border-color 0.3s ease;
        }
        .form-control:focus {
            outline: none;
            border-color: #007bff; /* Highlight border on focus */
        }
        .text-center {
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3; /* Darker shade on hover */
            transform: translateY(-3px);
        }
        .btn-custom {
            margin-top: 20px; /* Custom margin for this button */
        }
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333333;
            transition: transform 0.3s ease;
        }
        a:hover {
            color: #007bff; /* Highlight link on hover */
        }
    </style>
    <script>
        function showError(message) {
            alert(message);
        }

        window.onload = function() {
            var errorMessage = '${errorMessage}';
            if (errorMessage && errorMessage.trim() !== '') {
                showError(errorMessage);
            }
        };
    </script>
</head>
<body>
<div class="container">
    <h3 class="heading">Route Selection</h3>

    <form id="flightForm" action="/searchflight" method="post">
        <div class="form-group">
            <label for="sourceAirportCode">Enter Source City:</label>
            <input type="text" id="sourceAirportCode" class="form-control" name="fromCity" list="sourceCityList" required>
            <datalist id="sourceCityList">
                <option value="">Select Source City</option>
                <c:forEach items="${airportList}" var="airport">
                    <option value="${airport.airportLocation}">${airport.airportLocation}</option>
                </c:forEach>
            </datalist>
        </div>
        <div class="form-group">
            <label for="destinationAirportCode">Enter Destination City:</label>
            <input type="text" id="destinationAirportCode" class="form-control" name="toCity" list="destinationCityList" required>
            <datalist id="destinationCityList">
                <option value="">Select Destination City</option>
                <c:forEach items="${airportList}" var="airport">
                    <option value="${airport.airportLocation}">${airport.airportLocation}</option>
                </c:forEach>
            </datalist>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary btn-custom">Submit</button>
        </div>
    </form>
    <a href="/" class="btn btn-primary home-link">back</a>
</div>
</body>
</html>
