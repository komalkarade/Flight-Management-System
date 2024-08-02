<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Airport</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('/images/addairport.jpeg');
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

        nav {
            display: flex;
            justify-content: space-between;
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
            position: fixed;
            bottom: 0;
            width: 100%;
            box-shadow: 0 -2px 4px rgba(0, 0, 0, 0.5);
            font-family: "Arial", sans-serif;
            text-align: left;
            min-height: 10px;
            font-weight:300px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 50px auto;
            max-width: 400px;
            color: #333;
                        font-weight:300px;
            
        }

        .form-container h6 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
                        font-weight:300px;
            
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Flight Reservation System</a>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="./newUserEntity">SignUp</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="form-container">
        <h2>Add Airport</h2>
        <form action="/airport" method="post">
            <div class="form-group">
                <label for="airportCode">Airport Code:</label>
                <input type="text" class="form-control" id="airportCode" name="airportCode" required>
            </div>
            <div class="form-group">
                <label for="airportLocation">Airport Location:</label>
                <input type="text" class="form-control" id="airportLocation" name="airportLocation" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
        <a href="/index" class="btn btn-link mt-3">Back to home</a>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h6>Flight Reservation System 2024</h6>
                </div>
                <div class="col-md-6 text-md-right">
                    <h6><a href="./about" class="text-white">About</a></h6>
                </div>
            </div>
           
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
