<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Error</title>
<script type="text/javascript">
    function showAlertAndRedirect() {
        alert("Wrong credentials. Please try again.");
        window.location.href = 'loginPage.jsp';
    }
</script>
</head>
<body onload="showAlertAndRedirect()">

</body>
</html>
