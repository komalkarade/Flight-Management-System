<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Passenger</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('/images/detail.jpg');
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
        .form-container {
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
        }
        .alert-success {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="my-4">Update Passenger</h3>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                ${successMessage}
            </div>
        </c:if>
        <div class="form-container">
            <form action="${pageContext.request.contextPath}/update-passenger" method="post">
                <input type="hidden" name="embeddedId.ticketNumber" value="${passenger.embeddedId.ticketNumber}" />
                <input type="hidden" name="embeddedId.serialNumber" value="${passenger.embeddedId.serialNumber}" />
                
                <div class="form-group">
                    <label for="passengerName">Passenger Name:</label>
                    <input type="text" id="passengerName" name="passengerName" value="${passenger.passengerName}" class="form-control" required />
                </div>
                
                <div class="form-group">
                    <label for="passengerDOB">Passenger Date of Birth:</label>
                    <input type="text" id="passengerDOB" name="passengerDOB" value="${passenger.passengerDOB}" class="form-control" required />
                </div>
                
                <div class="form-group">
                    <label for="fare">Fare:</label>
                    <input type="number" id="fare" name="fare" value="${passenger.fare}" step="0.01" class="form-control" readonly />
                </div>
                
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
        <a href="${pageContext.request.contextPath}/all" class="btn btn-secondary mt-3">Back to All Passengers</a>
    </div>

    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
