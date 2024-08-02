<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Main Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-image: url('/images/main112.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            color: white;
            text-align: center;
        }
        /* Navbar styling */
        nav {
            background-color: #608cb6;
            padding: 8px 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
                        color:white;
            
        }
        .navbar-brand {
            font-size: 18px;
        }
        .navbar-nav {
            margin-left: auto;
        }
        nav a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: color 0.3s;
            display: flex;
            align-items: center;
        }
        nav a:hover {
            color: #f8f9fa;
        }
        .dropdown-menu {
            background-color: rgba(0, 0, 0, 0.8);
            border: none;
        }
        .dropdown-item {
            color: white;
            font-size: 1rem;
        }
        .dropdown-item:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        /* Adjust content below the navbar */
        .main-content {
            padding-top: 70px; /* Adjust according to navbar height */
            height: 100vh; /* Ensure full viewport height */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            color:white;
        }
        h1 {
        color:black;
            font-size: 3rem;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
            margin-top:0px;
        }
        .button-container {
            display: flex;
            justify-content: space-around;
            width: 50%;
            margin-top: 20px;
        }
        .custom-button {
            background-color: rgba(0, 0, 0, 0.6);
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, box-shadow 0.3s;
                        color:white;
            
        }
        .custom-button:hover {
            background-color: rgba(0, 0, 0, 0.8);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
        }
        .custom-button img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Flight Management System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/login">
                        <i class="fas fa-user"></i> Login
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/register">
                        <i class="fas fa-plus-circle"></i> New Entry
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    
    <!-- Main Content -->
    <div class="main-content">
        <h1>Welcome to the Flight Management System</h1>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
