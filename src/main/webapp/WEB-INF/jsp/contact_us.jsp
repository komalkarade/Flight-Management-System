<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
      body {
            background-image: url('/images/contact.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-color: #f8f9fa;
            color: #333;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            overflow: hidden;
        }
        .container {
            max-width: 600px;
            margin: auto;
        }
        .card {
            margin-bottom: 20px;
        }
        .back-btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Contact Us</h2>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Address</h4>
                <p class="card-text">1234 Airline Avenue, Suite 100</p>
                <p class="card-text">Flight City, FL 12345</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Phone</h4>
                <p class="card-text">+91 7148418517</p>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Email</h4>
                <p class="card-text">support@flightmanagement.com</p>
            </div>
        </div>
        <a href="/" class="btn btn-primary back-btn">Back to Home</a>
    </div>
</body>
</html>
