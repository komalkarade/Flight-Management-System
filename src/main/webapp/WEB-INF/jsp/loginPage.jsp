<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('/images/1.jpg');
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

       /* Navbar styles */
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

      nav .nav-left,
      nav .nav-right {
        display: flex;
        align-items: center;
        font-size: 12px;
      }

      nav .nav-left h3,
      nav .nav-right h3 {
        margin: 0;
        font-size: 20px;
        font-weight: bold;
      }

      nav .nav-left {
        margin-left: 15px;
      }

      nav .nav-right {
        margin-right: 15px;
      }

      nav a {
        color: #ffffff;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        transition: color 0.3s;
      }

      nav a:hover {
        color: #f8f9fa;
      }

        footer {
            background-color: #608cb6;
            color: #ffffff;
            text-align: center;
            width: 100%;
            position: fixed;
            bottom: 0;
            padding: 8px 0;
            font-size: 14px;
            display: flex;
            justify-content: space-between;
        }

        footer .foot-left h4, footer .foot-right h4 {
            margin: 0;
            font-size: 18px;
            font-weight: bold;
        }

        footer a {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s;
        }

        footer a:hover {
            color: #aaa;
        }

        .card-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 80%;
            max-width: 400px;
        }

        .card {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 300px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            animation: fadeIn 1s forwards;
        }

        .card-body {
            padding: 30px;
            background-color: rgba(255, 255, 255, 0.9);
            animation: slideLeft 1s forwards;
        }

        @keyframes slideLeft {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .password-wrapper {
            position: relative;
            width: 100%;
        }

        .password-wrapper input {
            width: 100%;
            padding-right: 40px;
        }

        .password-wrapper .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
            z-index: 1;
        }

        .password-wrapper .toggle-password:hover {
            color: #000;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #4caf50;
            outline: none;
        }

        .btn-container {
    display: flex;
    flex-direction: column;
    gap: 10px; /* Add space between the buttons */
}

.btn-container .btn {
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

.btn-container .btn-primary {
    background-color: #4caf50;
}

.btn-container .btn-primary:hover {
    background-color: #45a049;
}

.btn-container .btn-secondary {
    background-color: #B43F3F;
}

.btn-container .btn-secondary:hover {
    background-color: darkred;
}

        .register-link {
            text-align: center;
            margin-top: 15px;
            color: #666;
            font-size: 15px;
        }

        .register-link a {
            text-decoration: none;
            color: #4c74af;
        }
    </style>
</head>
<body>
    <nav>
        <div class="nav-left">
            <h3>Flight Reservation System</h3>
        </div>
        <div class="nav-right">
            <h3><a href="/main" class="button">Logout</a></h3>
        </div>
    </nav>

    <div class="card">
        <div class="card-body">
            <h3 class="text-center">Login</h3>
            <form:form action="/login" method="post" class="form-group">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" required />
                        <i class="fas fa-eye toggle-password" id="togglePassword" onclick="togglePassword()"></i>
                    </div>
                </div>
                <div class="btn-container">
    <button type="submit" class="btn btn-primary">Submit</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
</div>

            </form:form>
            <div class="register-link">
                Don't have an account? <br />
                <a href="/register">Register for a new user</a>
            </div>
        </div>
    </div>

    <footer>
        <div class="foot-left">
            <h4>Flight Reservation System 2024</h4>
        </div>
        <div class="foot-right">
            <h4><a href="./about">About</a></h4>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.getElementById('togglePassword');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        function showAlert(message) {
            alert(message);
        }

        window.onload = function() {
            const error = "${error}";
            if (error) {
                showAlert(error);
            }
        };
    </script>
</body>
</html>
