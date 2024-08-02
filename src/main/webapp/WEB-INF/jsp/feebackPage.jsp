<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback Form</title>
    <link href="${pageContext.request.contextPath}/resources/styles.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('/images/feedback.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh;
            color: white;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            margin: 20px;
        }

        .card-header {
            background-color: #007bff;
            color: white;
            border-radius: 8px 8px 0 0;
            padding: 20px;
            text-align: center;
        }

        .card-body {
            padding: 30px;
        }

        .form-control {
            border-radius: 4px;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004080;
        }
 .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .alert {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="card-header">
            <h2>Submit Your Feedback</h2>
        </div>
        <div class="card-body">
            <form:form method="post" modelAttribute="feedback" action="${pageContext.request.contextPath}/feedback" class="form-horizontal">
                <div class="form-group">
                    <label for="username" class="text-dark">Username:</label>
                    <form:input path="username" id="username" class="form-control" placeholder="Enter your username" required="true"/>
                </div>
                <div class="form-group">
                    <label for="message" class="text-dark">Feedback Message:</label>
                    <form:textarea path="message" id="message" class="form-control" placeholder="Enter your feedback" required="true"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form:form>
              <div class="text-center mt-4">
                                  <a class="btn btn-secondary ml-3" href="${pageContext.request.contextPath}/index1">Back</a>
              
              </div>
        </div>
    </div>
   

    <!-- Link to Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
