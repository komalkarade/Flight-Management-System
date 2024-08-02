<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New User Registry</title>
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- Font Awesome CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <style>
    body {
                  background-image: url('/images/1.jpg');
      background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        background-color: #f8f9fa;
        color: #333;
        font-family: "Arial", sans-serif;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        margin: 0;
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
        background-color: #608cb6; /* Dark background color */
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

      footer .foot-left h4,
      footer .foot-right h4 {
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
        max-width: 600px;
        max-height: 300px;
      }

      .card {

        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 450px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        animation: fadeIn 1s forwards;
                max-height: 400px;
        
      }


      .card-body {
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.9);
        animation: slideLeft 1s forwards;
      }

      @keyframes slideRight {
        from {
          transform: translateX(-100%);
        }
        to {
          transform: translateX(0);
        }
      }

      @keyframes slideLeft {
        from {
          transform: translateX(100%);
        }
        to {
          transform: translateX(0);
        }
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
        }
        to {
          opacity: 1;
        }
      }

     
      .card-title {
        font-size: 24px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
      }

      .form-group {
          position: relative;
      
        margin-bottom: 20px;
      }

      .form-group input,
      .form-group select {
        padding: 12px;
        border-radius: 5px;
        border: 1px solid #ced4da;
        width: 100%;
        transition: border-color 0.3s;
        font-size: 16px;
      }

      .form-group input:focus,
      .form-group select:focus {
        border-color: #007bff; /* Blue border color on focus */
        outline: none;
      }
.form-group .form-control {
    padding-right: 40px; /* Space for the icon */
}
      .btn-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
      }

      .btn-primary {
        background-color: #007bff; /* Blue primary button */
        color: #ffffff;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 16px;
      }

      .btn-primary:hover {
        background-color: #0056b3; /* Darker shade of blue on hover */
      }
.eye-icon {
    position: absolute;
    right: 10px; /* Position the icon inside the input field */
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #007bff; /* Color for the icon */
}

.eye-icon:hover {
    color: #0056b3; /* Darker shade on hover */
}
      .btn-secondary {
        background-color: #6c757d; /* Gray secondary button */
        color: #ffffff;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 16px;
      }

      .btn-secondary:hover {
        background-color: #5a6268; 
      }

     .terms-service {
        font-size: 14px;
        text-align: center;
        margin-top: 20px;
      }

      .terms-service a {
        color: #007bff;
        text-decoration: none;
      }

      .terms-service a:hover {
        text-decoration: underline;
      }
    </style>
</head>
<body>
    <nav>
      <div class="nav-left">
        <h3>Flight Reservation System</h3>
      </div>
      <div class="nav-right">
        <h3><a href="./newUserEntity">Sign Up</a></h3>
      </div>
    </nav>
 
    <div class="card-container">
      
       <div class="card">
        <div class="card-body">
                  <h3 class="text-center">New Registration</h3>
        <form:form id="registrationForm" action="/register" method="post" modelAttribute="userRecord" class="form-group">           <div class="form-group">
              <div class="row align-items-center">
                <div class="col-auto">
                  <i class="fas fa-user"></i>
                </div>
                <div class="col">
                  <input
                    type="text"
                    id="username"
                    name="username"
                    class="form-control"
                    placeholder="Enter Username"
                    required
                  />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="row align-items-center">
                <div class="col-auto">
                  <i class="fas fa-user-tie"></i>
                </div>
                <div class="col">
                  <select id="type" name="type" class="form-control" required>
                    <option value="">Select User Type</option>
                    <option value="Customer">Customer</option>
                    <option value="Admin">Admin</option>
                  </select>
                </div>
              </div>
            </div>
   <div class="form-group">
              <div class="row align-items-center">
                <div class="col-auto">
                  <i class="fas fa-lock"></i>
                </div>
                <div class="col">
                  <input
                    type="password"
                    id="password"
                    name="password"
                    class="form-control"
                    placeholder="Enter Password"
                    required
                  />
                                                  <i id="togglePassword" class="fas fa-eye eye-icon" onclick="togglePasswordVisibility('password')"></i>
                  
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="row align-items-center">
                <div class="col-auto">
                  <i class="fas fa-key fa-lg"></i>
                </div>
                <div class="col">
                  <input
                    type="password"
                    id="confirmPassword"
                    name="confirmPassword"
                    class="form-control"
                    placeholder="Confirm Password"
                    required
                  />
                                                  <i id="toggleConfirmPassword" class="fas fa-eye eye-icon" onclick="togglePasswordVisibility('confirmPassword')"></i>
                  
                </div>
              </div>
            </div>

         <div class="btn-container">
        <button type="button" onclick="passwordCheck(event)" class="btn btn-primary">
            Submit
        </button>
        <button type="reset" class="btn btn-secondary">Reset</button>
    </div>
</form:form>
          <div class="terms-service"><a href="/main">Back to home</a></div>
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


<script type="text/javascript">
function passwordCheck(event) {
    var pass1 = document.getElementById("password").value;
    var pass2 = document.getElementById("confirmPassword").value;
    var passwordPattern = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[\W_]).{6,13}$/;

    if (pass1 !== pass2) {
        alert("Passwords do not match");
        event.preventDefault(); // Prevent form submission
    } else if (!passwordPattern.test(pass1)) {
        alert("Password must be 6-13 characters long, containing at least one uppercase letter, one lowercase letter, one digit, and one special character.");
        event.preventDefault(); // Prevent form submission
    } else {
        // Form will submit if all conditions are met
        document.getElementById("registrationForm").submit();
    }
}
function togglePasswordVisibility(id) {
    var passwordField = document.getElementById(id);
    var toggleIcon = document.getElementById('toggle' + (id === 'password' ? '' : 'Confirm') + 'Password');
    
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

</script>


</body>
</html>
