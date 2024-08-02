<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Welcome to Flight Management System admin</title>
    <link rel="shortcut icon" href="/images/fav.png" type="image/x-icon" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/all.min.css" />
    <link rel="stylesheet" href="/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
        /* Custom CSS for Navbar */
        #menu .navbar {
            list-style-type: none; /* Remove bullet points from the list */
            margin: 0;
            padding: 0;
            display: flex;
            color: white;
        }

        #menu .nav-item {
            position: relative;
        }

        #menu .nav-item a {
            display: block;
            color: inherit;
            text-decoration: none;
            padding: 10px 15px;
            transition: background-color 0.3s ease;
        }

        #menu .nav-item.active a {
            background-color: #555;
        }

        #menu .dropdown-content {
            display: none;
            position: absolute;
            background-color: black;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            color: white;
        }

        #menu .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            transition: background-color 0.3s ease;
        }

        #menu .dropdown-content a:hover {
            background-color: #ddd;
        }

        #menu .nav-item:hover .dropdown-content {
            display: block;
        }

        @media screen and (max-width: 992px) {
            #menu .nav-col {
                display: none;
            }

            #menu .small-menu {
                display: block;
                color: #fff;
                padding: 10px;
                cursor: pointer;
            }

            #menu .nav-row {
                justify-content: space-between;
            }

            #menu .nav-col.active {
                display: block;
            }

            #menu .nav-item {
                width: 100%;
                text-align: center;
            }

            #menu .nav-item:hover .dropdown-content {
                display: none;
            }

            #menu .dropdown-content {
                position: static;
                box-shadow: none;
                display: none;
                padding-left: 15px;
                padding-right: 15px;
            }

            #menu .nav-item.active .dropdown-content {
                display: block;
            }
        }

        .logo {
            max-width: 100%;
            height: 70px;
        }

        /* Custom CSS for Carousel */
        .slider {
            margin-top: -20px; /* Adjust the margin to remove the gap */
        }

        .slider .carousel-inner {
            height: 500px; 
            margin: 0;
    padding: 0;/* Adjust the height as needed */
        }

        .slider .carousel-item img {
            height: 100%;
            width: 100%; 
            object-fit: cover;
            margin: 0;
    padding: 0;
        }

        /* Custom CSS for Blog Section */
        .blog-col img {
            width: 100%;
            height: 180px;
            margin: 0;
    padding: 0;
            display: block;
        }

        .blog-col {
            text-align: center;
        }

        .blog-col h4 {
            margin-top: 10px;
            font-size: 18px;
        }

        .blog-col p {
            font-size: 14px;
            line-height: 1.5;
        }
        /* Carousel Container */
.slider {
    margin: 0;
    padding: 0;
    width: 100%; /* Make sure the carousel takes the full width */
    overflow: hidden; /* Hide any overflow */
}

/* Carousel Inner */
.carousel-inner {
    margin: 0;
    padding: 0;
    height: 100%; /* Adjust height to fit the container */
}

/* Carousel Items */
.carousel-item {
    height: 100%; /* Ensure items fill the container height */
    display: flex;
    justify-content: center; /* Center images horizontally */
    align-items: center; /* Center images vertically */
}

/* Carousel Images */
.carousel-item img {
    height: 100%; /* Adjust to fit the container height */
    width: 100%; /* Ensure images fill the width */
    object-fit: cover; /* Ensure the image covers the container without distortion */
}

/* Carousel Controls */
.carousel-control-prev,
.carousel-control-next {
    width: 5%; /* Adjust width as needed */
    color: #ffffff; /* White color for icons */
    text-shadow: 0 1px 3px rgba(0, 0, 0, 0.5); /* Subtle shadow for better visibility */
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-color: rgba(0, 0, 0, 0.5); /* Background for icons for better visibility */
    border-radius: 50%; /* Rounded controls */
    padding: 10px; /* Add some padding */
}

/* Adjust carousel indicators */
.carousel-indicators {
    bottom: 10px; /* Adjust position from the bottom */
}

.carousel-indicators li {
    background-color: #ffffff; /* Indicator color */
}

.carousel-indicators .active {
    background-color: #000000; /* Active indicator color */
}
          .slider .carousel-inner {
            height: 620px; 
            margin: 0;
    padding: 0;/* Adjust the height as needed */
        }    
    </style>
</head>

<body>
    <!-- ################# Header Starts Here ####################### -->
    <header class="continer-fluid">
        <div class="header-top">
            <div class="container">
                <div class="row col-det">
                    <div class="col-lg-6 d-none d-lg-block"></div>
                </div>
            </div>
        </div>
        <div id="menu-jk" class="header-bottom">
            <div class="container">
                <div class="row nav-row">
                    <div class="col-lg-3 col-md-12 logo">
                        <a href="index.html">
                            <img src="/images/logo11.jpg" alt="" class="logo" />
                            <a data-toggle="collapse" data-target="#menu" href="#menu">
                                <i class="fas d-block d-lg-none small-menu fa-bars"></i>
                            </a>
                        </a>
                    </div>
                    <div id="menu" class="col-lg-9 col-md-12 d-none d-lg-block nav-col">
                        <ul class="navbar">
                            <li class="nav-item active">
                                <a href="javascript:void(0)" class="dropbtn">Airports</a>
                                <div class="dropdown-content">
                                    <a href="/airport">Airport Addition</a>
                                    <a href="/airports">Airport Report</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:void(0)" class="dropbtn">Route</a>
                                <div class="dropdown-content">
                                    <a href="/route">Route Addition</a>
                                    <a href="/viewRoutes">All Routes</a>
                                </div>
                            </li>

                            
                            <li class="nav-item">
                                <a href="javascript:void(0)" class="dropbtn">Flight</a>
                                <div class="dropdown-content">
                                    <a href="/flight">Flight Addition</a>
                                    <a href="/flights">All Flights</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a href="javascript:void(0)" class="dropbtn">Passenger </a>
                                <div class="dropdown-content">
                        <a href="/all">Report</a>
                                <a href="/searchTicket">Ticket Search</a>
                                <a href="/cancelTicket">Ticket Cancel</a>
                        
                                </div>
                            </li>
                           <li class="nav-item">
    <a href="javascript:void(0)" class="dropbtn">Feedback</a>
    <div class="dropdown-content">
        <a href="/feedback/list">Report</a> 
    </div>
</li>

                            
                            <li class="nav-item">
                                <a class="nav-link" href="/contactUs">Contact US</a>
                            </li>
                            <li class="nav-item">
                                <a href="/main" class="button">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Carousel Section -->
    <div class="slider container-fluid">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/images/images14.jpg" class="d-block w-100" alt="Slide 1" />
                </div>
                <div class="carousel-item">
                    <img src="/images/images12.jpg" class="d-block w-100" alt="Slide 2" />
                </div>
                <div class="carousel-item">
                    <img src="/images/images13.png" class="d-block w-100" alt="Slide 3" />
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="/js/script.js"></script>
</body>
</html>
