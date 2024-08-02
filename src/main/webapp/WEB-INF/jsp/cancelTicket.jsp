<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Ticket</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
        }

        .form-inline {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            border-radius: 0.25rem;
            box-shadow: none;
            border-color: #ced4da;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 0.25rem;
            box-shadow: none;
            transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-primary:focus, .btn-primary.focus {
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.5);
        }

        .alert {
            margin-top: 20px;
        }

        .home-link {
            margin-left: 10px;
        }
    </style>
    <script>
        function validateForm() {
            var ticketNumber = document.getElementById("ticketNumber").value;
            if (ticketNumber.trim() === "") {
                alert("Please enter a ticket number.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Cancel Ticket</h2>
        <form action="/cancelTicket" method="post" class="form-inline" onsubmit="return validateForm()">
            <div class="form-group mb-2">
                <label for="ticketNumber" class="sr-only">Ticket Number</label>
                <input type="text" class="form-control" id="ticketNumber" name="ticketNumber" placeholder="Enter Ticket Number" required>
            </div>
            <button type="submit" class="btn btn-primary mb-2">Cancel</button>
            <a href="/" class="btn btn-primary home-link">Home</a>
        </form>

        <c:if test="${not empty cancellationSuccess}">
            <div class="alert alert-success" role="alert">
                Ticket successfully canceled!
            </div>
        </c:if>
        <c:if test="${not empty cancellationError}">
            <div class="alert alert-danger" role="alert">
                ${cancellationError}
            </div>
        </c:if>
    </div>
</body>
</html>
