<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter Route</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('/images/route.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh; /* Use viewport height for full screen height */
            color: white;
            text-align: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        nav {
            background-color: #333; /* Darker background for navigation */
            padding: 10px 20px;
        }
        nav h3 {
            margin: 0;
            color: #fff; /* White text for navigation header */
        }
        nav a {
            color: #fff;
            text-decoration: none;
        }
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 25px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            color: #333; /* Dark text for form */
        }
        .form-container h3 {
            margin-top: 0;
            color: #333; /* Dark text for form header */
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left; /* Align form labels and inputs to the left */
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button, a {
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50; 
        }
        button[type="reset"] {
            background-color: #f44336;
        }
        button[type="submit"]:hover, button[type="reset"]:hover, a:hover {
            opacity: 0.8;
        }
        .message {
            color: red;
        }
        .btn-container {
            text-align: center; /* Center align buttons */
            margin-top: 20px; /* Add margin to separate buttons from form inputs */
        }
         nav {
        background-color: #333; /* Dark background color */
        padding: 10px 20px; /* Padding around content */
        color: #fff; /* White text color */
        display: flex; /* Use flexbox for layout */
        justify-content: space-between; /* Align items to each end */
        align-items: center; /* Center vertically */
    }
    nav h3 {
        margin: 0; /* Remove default margin */
    }
    nav a {
        color: #fff; /* White text color */
        text-decoration: none; /* Remove underline */
        padding: 5px 10px; /* Padding around link */
        border-radius: 3px; /* Rounded corners */
        transition: background-color 0.3s ease; /* Smooth background transition */
    }
    nav a:hover {
        background-color: #555; /* Darken background on hover */
    }
    </style>
</head>
<body>
<nav>
    <h3>Flight Reservation System</h3>
    <a href="/index">Logout</a>
</nav>

<div class="form-container">
    <h3>Enter Route Details</h3>
    <c:choose>
        <c:when test="${empty airportList}">
            <div class="message">
                No airports available. Please add airports before adding routes.
            </div>
        </c:when>
        <c:otherwise>
            <form:form action="/route" method="post" modelAttribute="routeRecord">
                <form:hidden path="routeId"/>
                <div class="form-group">
                    <label for="sourceAirportCode">Enter Source City:</label>
                    <form:select path="sourceAirportCode" class="form-control" id="sourceAirportCode">
                        <form:option value="">Select Source City</form:option>
                        <c:forEach items="${airportList}" var="airport">
                            <form:option value="${airport.airportLocation}">${airport.airportLocation}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="destinationAirportCode">Enter Destination City:</label>
                    <form:select path="destinationAirportCode" class="form-control" id="destinationAirportCode">
                        <form:option value="">Select Destination City</form:option>
                        <c:forEach items="${airportList}" var="airport">
                            <form:option value="${airport.airportLocation}">${airport.airportLocation}</form:option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="fare">Ticket Amount:</label>
                    <form:input type="number" id="fare" path="fare" class="form-control" />
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger">Reset</button>
                    <br/><br/>
        <a href="<c:url value='/' />">Back to home</a>
                </div>
            </form:form>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
