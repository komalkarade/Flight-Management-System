<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Airport Report</title>
    <style>
      body {
        background-image: url("/images/1.jpg");
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        height: 100%;
        color: white;
        text-align: center;
        margin: 0;
        font-family: Arial, sans-serif;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
      }
      .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3),
          0 6px 6px rgba(0, 0, 0, 0.23);
        width: 60%;
        margin: 30px auto;
        transform: translateZ(0);
        color: black;
      }
      .container h2 {
        margin-top: 0;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        color: black;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      table,
      th,
      td {
        border: 1px solid #ddd;
      }
      th,
      td {
        padding: 12px;
        text-align: left;
      }
      th {
        background-color: #007bff; /* Blue background */
        color: white; /* White text */
      }
      tr:nth-child(even) {
        background-color: #f2f2f2; /* Light grey background */
      }
      tr:hover {
        background-color: #ddd; /* Hover effect background */
      }
      td a {
        text-decoration: none;
        padding: 8px 12px;
        border-radius: 4px;
        color: white; /* White text color */
        transition: background-color 0.3s ease;
        display: inline-block;
      }
      .btn-enquire {
        background-color: #28a745; /* Green background */
      }
      .btn-enquire:hover {
        background-color: #218838; /* Darker green on hover */
      }
      .btn-update {
        background-color: #ffc107; /* Yellow background */
      }
      .btn-update:hover {
        background-color: #e0a800; /* Darker yellow on hover */
      }
      .btn-delete {
        background-color: #dc3545; /* Red background */
      }
      .btn-delete:hover {
        background-color: #c82333; /* Darker red on hover */
      }
      .container a {
        text-decoration: none;
        color: #007bff; /* Blue text color */
        display: block;
        text-align: center;
        margin-top: 20px;
        padding: 10px 15px;
        border-radius: 5px;
        background-color: #f9f9f9; /* Light grey background */
        box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
      }
      .container a:hover {
        background-color: #ddd; /* Hover effect background */
        box-shadow: 3px 3px 8px rgba(0, 0, 0, 0.4);
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Airport Report</h2>
      <table>
        <thead>
          <tr>
            <th>Airport Code</th>
            <th>Airport Location</th>
            <th>Enquire</th>
            
          </tr>
        </thead>
        <tbody>
          <c:forEach var="airport" items="${airportList}">
            <tr>
              <td>${airport.airportCode}</td>
              <td>${airport.airportLocation}</td>
              <td>
                <a
                  class="btn-enquire"
                  style="background-color: #286ea7; color: #f2f2f2"
                  href="/airport/${airport.airportCode}"
                  >Enquire</a
                >
              </td>
              
     
</form>

            </tr>
          </c:forEach>
        </tbody>
      </table>
      <a href="<c:url value='/index1' />">Back to home</a>
    </div>
    
  </body>
  
</html>
