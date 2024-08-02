<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Flights</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
    *{
    margin:0;
    padding:0;
    
    }
        body {
            background-image: url('/images/addflight.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #ffffff;
            text-align: center;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

   nav {
        background-color: #608cb6;
        padding: 8px 0;
        width: 100%;
        position: fixed;
        font-size: 12px;
        top: 0;
        z-index: 1000;
        display: flex;
        justify-content: space-between;
        color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
      }

      nav a {
          color: #fff;
          text-decoration: none;
          padding: 5px 10px;
          font-weight:40px;
          border-radius: 3px;
          transition: background-color 0.3s ease;
      }
      nav a:hover {
          background-color: #555; 
      }
  
        .form-container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white */
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }

        .form-container h2 {
            margin-bottom: 30px;
            color: #343a40; /* Dark gray */
            font-size: 28px; /* Larger font size */
            font-weight: bold;
        }

        .form-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 0 0 48%; /* Adjust width */
            margin-bottom: 20px;
        }

        .form-group.full-width {
            flex: 1; /* Full width for one element */
        }

        .form-group label {
            font-weight: bold;
            color: #495057; /* Darker gray */
            font-size: 16px;
            display: flex;
            align-items: center; /* Center items vertically */
        }

        .form-group label .fas {
            margin-right: 10px; /* Space between icon and text */
            font-size: 18px; /* Adjust icon size */
        }

        .form-control {
            background-color: #f8f9fa; /* Light gray */
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s, border-color 0.3s;
            font-size: 16px; /* Larger font size */
            padding: 10px; /* Increased padding */
            box-shadow: 0 0 0 0 rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            background-color: #e9ecef; /* Lighter gray on focus */
            border-color: #007bff; /* Bootstrap primary color */
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); /* Focus shadow */
            outline: none;
        }

        .btn-primary, .btn-secondary {
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            transition: transform 0.3s ease, background-color 0.3s ease;
            font-size: 16px;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #007bff; /* Bootstrap primary color */
            color: #ffffff;
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Darker shade of primary */
        }

        .btn-secondary {
            background-color: #6c757d; /* Bootstrap secondary color */
            color: #ffffff;
        }

        .btn-secondary:hover {
            background-color: #5a6268; /* Darker shade of secondary */
        }

        .form-container a {
            display: block;
            margin-top: 20px;
            color: #007bff; /* Bootstrap primary color */
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .form-container a:hover {
            color: #0056b3; /* Darker shade of primary on hover */
            text-decoration: none; /* Remove underline */
        }

        /* Footer styles */
        .foot {
            background-color: #343a40; /* Dark gray */
            color: #ffffff; /* White text */
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }

        .foot h4 {
            margin: 0;
            font-weight: bold;
            font-size: 16px;
        }

        .breaker h2 {
            color: rgb(6, 88, 26);
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
<nav>
        <h3>Flight Reservation System</h3>
        <a href="/index">Logout</a>
    </nav>
<div class="container">
   
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="form-container">
                <h2>Add Flights</h2>
                <form action="/flight" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="flightNumber"><i class="fas fa-plane"></i> Flight ID:</label>
                            <input type="text" class="form-control" id="flightNumber" name="flightNumber" required>
                        </div>
                        <div class="form-group">
                            <label for="carrierName"><i class="fas fa-building"></i> Airlines Name:</label>
                            <input type="text" class="form-control" id="carrierName" name="carrierName" list="airlineList" required>
                            <datalist id="airlineList">
                                <option value="American11 Airlines"></option>
                                <option value="Delta12 Air Lines"></option>
                                <option value="United134 Airlines"></option>
                                <option value="Lufthansa147"></option>
                                <option value="Emirates854"></option>
                                <option value="British85 Airways"></option>
                                <option value="Air France952"></option>
                                <option value="Singapore8456 Airlines"></option>
                                <option value="Qatar7412 Airways"></option>
                                <option value="Cathay954 Pacific"></option>
                                <!-- Add more options as needed -->
                            </datalist>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="routeId"><i class="fas fa-map-marker-alt"></i> Route ID:</label>
                            <input type="text" list="routes" class="form-control" id="routeId" name="routeId" required>
                            <datalist id="routes">
                                <c:forEach var="route" items="${routeList}">
                                    <option value="${route}"></option>
                                </c:forEach>
                            </datalist>
                        </div>
                        <div class="form-group">
                            <label for="seatCapacity"><i class="fas fa-chair"></i> Seat Capacity:</label>
                            <input type="text" class="form-control" id="seatCapacity" name="seatCapacity" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="departure"><i class="fas fa-plane-departure"></i> Departure Time:</label>
                            <input type="time" class="form-control" id="departure" name="departure" required>
                        </div>
                        <div class="form-group">
                            <label for="arrival"><i class="fas fa-plane-arrival"></i> Arrival Time:</label>
                            <input type="time" class="form-control" id="arrival" name="arrival" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group full-width">
                            <input type="hidden" id="seatBooked" name="seatBooked" value="0">
                        </div>
                    </div>
                    <div class="breaker">
                        <h2><label for="">Return Flight's Time:</label></h2>
                    </div>
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="dtime"><i class="fas fa-plane-departure"></i> Return Flight's Departure Time:</label>
                            <input type="time" class="form-control" id="dtime" name="dtime" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group full-width">
                            <label for="atime"><i class="fas fa-plane-arrival"></i> Return Flight's Arrival Time:</label>
                            <input type="time" class="form-control" id="atime" name="atime" required>
                        </div>
                    </div>
                    <div class="btn">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-secondary">Reset</button>
                    </div>
                    <a href="/index1" class="mt-3">Back to Home</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
