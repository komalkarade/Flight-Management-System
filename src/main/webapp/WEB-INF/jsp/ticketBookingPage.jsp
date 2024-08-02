<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Booking Form</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
function validateForm() {
    for (var i = 1; i <= 6; i++) {
        var name = document.forms["bookingForm"]["name" + i].value;
        var dob = document.forms["bookingForm"]["dob" + i].value;
        if (name && !dob) {
            alert("Please enter date of birth for passenger " + i);
            return false;
        }
    }
    return true;
}
</script>
</head>
<body>

<div class="container">
    <h2>Flight Booking Form</h2>
    <form:form action="/ticket" method="POST" modelAttribute="ticketRecord" name="bookingForm" onsubmit="return validateForm();">
        <form:hidden path="ticketNumber"/>
        <form:hidden path="flightNumber"/>
        <form:hidden path="carrierName"/>
        <input type="hidden" name="fromLocation" value="${route.sourceAirportCode}"/>
        <input type="hidden" name="toLocation" value="${route.destinationAirportCode}"/>
        <input type="hidden" name="fare" value="${route.fare}"/>
        
        <table class="table">
            <thead>
                <tr>
                    <th colspan="3">Flight Details</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><label>Ticket Number:</label><form:input path="ticketNumber" disabled="true" class="form-control"/></td>
                    <td><label>Flight Number:</label><form:input path="flightNumber" disabled="true" class="form-control"/></td>
                    <td><label>Airlines Name:</label><form:input path="carrierName" disabled="true" class="form-control"/></td>
                </tr>
                <tr>
                    <td><label>From:</label><input type="text" value="${route.sourceAirportCode}" disabled="true" class="form-control"/></td>
                    <td><label>Fare:</label><input type="text" value="${route.fare}" disabled="true" class="form-control"/></td>
                    <td><label>To:</label><input type="text" value="${route.destinationAirportCode}" disabled="true" class="form-control"/></td>
                </tr>
            </tbody>
        </table>
        
        <h3>Passenger Details</h3>
        <table class="table">
            <c:forEach var="i" begin="1" end="6">
                <tr>
                    <td><label>Name:</label> <input type="text" name="name${i}" class="form-control" /></td>
                    <td><label>Date Of Birth:</label> <input type="date" name="dob${i}" class="form-control" /></td>
                </tr>
            </c:forEach>
        </table>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
</div>

</body>
</html>
