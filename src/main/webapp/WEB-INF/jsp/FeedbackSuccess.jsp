<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Success</title>
    <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link to your custom CSS file -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Custom styles */
        body {
            background-image: url('/images/feed.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh;
            color: white;
            margin: 0;
            font-family: 'Roboto', sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

header {
    margin: 0; 
    padding: 1rem 0;
    width: 100%;
    background: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
    position: fixed; 
    top: 0; 
    left: 0; 
    z-index: 1000;
}

header h1 {
    font-size: 2rem;
    margin: 0;
    color: #ffffff;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.card-container {
    display: flex;
    justify-content: center; 
    align-items: center;
    min-height: 100vh; 
    padding: 20px; 
}

.card {
    background-color: rgba(255, 255, 255, 0.9);
    color: #333;
    border: none;
    border-radius: 10px;
    width: 90%;
    max-width: 600px;
    margin: 20px; /* Adjust if needed */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card-header {
    background-color: #007bff;
    color: white;
    border-radius: 10px 10px 0 0;
    padding: 20px;
}


        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            width: 100%;
            margin-top: 10px;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            width: 100%;
            margin-top: 10px;
        }
          .btn-third{
            background-color: #365486;
            border-color: #365486;
            width: 100%;
            margin-top: 10px;
        }

        .alert {
            margin-top: 20px;
        }

        .text-center a {
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="card-container my-5">
        <div class="card">
            <div class="card-header text-center">
                <h2>Feedback Submitted Successfully</h2>
            </div>
            <div class="card-body">
                <div class="alert alert-success" role="alert">
                    ${message}
                </div>
                <div class="text-center mt-4">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/feedback">Back to Feedback Form</a>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/feedback/list">View Feedback List</a>
                    <a class="btn btn-third" href="${pageContext.request.contextPath}/index1">Back</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Link to Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
