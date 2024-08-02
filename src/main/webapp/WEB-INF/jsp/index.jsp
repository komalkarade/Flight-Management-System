<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>Welcome to Flight Management System</title>
    <link
      rel="shortcut icon"
      href="/images/fav.png"
      type="image/x-icon"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="/images/fav.jpg" />
    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/all.min.css" />
    <link rel="stylesheet" href="/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
#menu .navbar {
    list-style-type: none; /* Remove bullet points from the list */
    margin: 0;
    padding: 0;
    display: flex;
    color:white;
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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
        color:white;
    
}

#menu .dropdown-content a {
    color: #333;
    padding: 12px 16px; 
    text-decoration: none;
    display: block;
    transition: background-color 0.3s ease; 
        color:white;
    
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
max-width:100%;
height:70px;
    }
    /* Custom CSS for Carousel */
.slider .carousel-inner {
    height: 400px; /* Adjust the height as needed */
}

.slider .carousel-item img {
   height: 100%; 
    width: auto; 
    max-height: 100%;
}
/* Custom CSS for Blog Section */
.blog-col img {
    width: 100%; 
    height: 180px;
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

    </style>
  </head>

  <body>
    <!-- ################# Header Starts Here#######################--->

    <header class="continer-fluid">
      <div class="header-top">
        <div class="container">
          <div class="row col-det">
            <div class="col-lg-6 d-none d-lg-block">
              <ul class="ulleft">
                <li>
                  <i class="far fa-envelope"></i>
                  sales@smarteyeapps.com
                  <span>|</span>
                </li>
                <li>
                  <i class="fas fa-phone-volume"></i>
                  +91 8521479632
                </li>
              </ul>
            </div>
            <div class="col-lg-6 col-md-12">
              <ul class="ulright">
                <li>
                  <i class="fab fa-facebook-square"></i>
                </li>
                <li>
                  <i class="fab fa-twitter-square"></i>
                </li>
                <li>
                  <i class="fab fa-instagram"></i>
                </li>
                <li>
                  <i class="fab fa-linkedin"></i>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="menu-jk" class="header-bottom">
    <div class="container">
        <div class="row nav-row">
            <div class="col-lg-3 col-md-12 logo">
                <a href="index.html">
                    <img src="/images/logo11.jpg" alt="" class="logo"/>
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
                                                   <a href="/airports1">Airport Report</a>
                           
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="javascript:void(0)" class="dropbtn">Route</a>
                        <div class="dropdown-content">
                            <a href="/viewRoutes">All Routes</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="javascript:void(0)" class="dropbtn">Flight</a>
                        <div class="dropdown-content">
                            <a href="/flights">All Flights</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="javascript:void(0)" class="dropbtn">Flight Booking</a>
                        <div class="dropdown-content">
                            <a href="/searchflight">Flight Search</a>
                        </div>
                    </li>
                   <li class="nav-item">
    <a href="javascript:void(0)" class="dropbtn">Passenger</a>
    <div class="dropdown-content">
        <a href="/searchTicket">Ticket Search</a>
                                                                <a href="/cancelTicket">Ticket Cancel</a>
        
    </div>
</li>

                      <li class="nav-item">
    <a href="javascript:void(0)" class="dropbtn">Feedback</a>
    <div class="dropdown-content">
        <a href="/feedback">Feedback Passenger</a> <!-- Ensure this path is correct -->
        <a href="/feedback/list">Report</a> <!-- Ensure this path is correct -->
    </div>
</li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contactUs">Contact US</a>
                    </li>
                     <li class="nav-item">
                        <a href="/logout" class="button">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

    </header>
    <div class="slider container-fluid">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                    <img src="/images/images14.jpg" class="d-block w-100" alt="..." />
                </a>
            </div>
            <div class="carousel-item">
                <img src="/images/images12.jpg" class="d-block w-100" alt="..." />
            </div>
            <div class="carousel-item">
                <img src="/images/images13.png" class="d-block w-100" alt="..." />
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


    <!-- ################# Why Choos US Starts Here #######################--->

    <div class="why-choos-us container-fluid">
      <div class="container">
        <div class="session-title">
          <h2>Why Choose Us ?</h2>
          <p>
            Sagittis vulputate magna sagittis sagittis erat feugiat nullam
            cubilia amet dignissim Euismod.
          </p>
        </div>
        <div class="why-ro row">
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="far fa-calendar-plus"></i>
              </div>
              <div class="detail">
                <h4>Easy Booking</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="fas fa-dollar-sign"></i>
              </div>
              <div class="detail">
                <h4>Value for Money</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="far fa-heart"></i>
              </div>
              <div class="detail">
                <h4>Passionate Travel</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="fas fa-map-marked-alt"></i>
              </div>
              <div class="detail">
                <h4>Awesome Places</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="fas fa-car"></i>
              </div>
              <div class="detail">
                <h4>Diverse Destinations</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="col-card">
              <div class="icon">
                <i class="far fa-comments"></i>
              </div>
              <div class="detail">
                <h4>24 x 7 Support</h4>
                <p>
                  Turpis accumsan. Proin id ligula suspendisse. Aliquet
                  fringilla, aptent eu dignissim.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  
    <!--################### Tour Review Starts Here #######################--->

    <div class="review container-fluid">
      <div class="container">
        <div class="session-title">
          <h2>What people say about Us</h2>
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi
            sollicitudin nisi id consequat bibendum. Phasellus at convallis
            elit. In purus enim, scelerisque id arcu vitae
          </p>
        </div>
        <div class="row review-row">
          <div class="col-md-6">
            <div class="review-col">
              <div class="profil">
                <img src="/images/testimonial/member-01.jpg" alt="" />
              </div>
              <div class="review-detail">
                 <h4>Smooth Booking Process</h4>
                        <p>
                            Booking flights through this system was incredibly easy.
                             I found the interface intuitive and hassle-free.
                            Highly recommend! We really loved the tour
                  and would do it all over again in a minute! Thanks.
                        </p>
                <h6>John Smith</h6>
                <ul class="rat">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="review-col">
              <div class="profil">
                <img src="/images/testimonial/member-02.jpg" alt="" />
              </div>
              <div class="review-detail">
                <h4>Exceptional Customer Support</h4>
                        <p>
                            The support team went above and beyond to help me with my booking issue.
                             They were prompt and courteous. Great service!
                         We really loved the tour
                  and would do it all over again in a minute! Thanks.
                </p>
                <h6>John Smith</h6>
                <ul class="rat">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="review-col">
              <div class="profil">
                <img src="/images/testimonial/member-03.jpg" alt="" />
              </div>
              <div class="review-detail">
               <h4>Efficient and Reliable Service</h4>
                        <p>
                            I've used this booking system multiple times, and it's always been reliable. 
                            The process is straightforward, and I've had no issues. 
                            Highly recommended! We really loved the tour
                  and would do it all over again in a minute! Thanks.
                </p>
                <h6>John Smith</h6>
                <ul class="rat">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-md-6">
            <div class="review-col">
              <div class="profil">
                <img src="/images/testimonial/member-01.jpg" alt="" />
              </div>
              <div class="review-detail">
                <h4>Responsive Customer Support</h4>
                        <p>
                            The customer support team was very responsive and helped me 
                            resolve my booking issue quickly.
                             Great service!
                        We really loved the tour
                  and would do it all over again in a minute! Thanks.
                </p>
                <h6>John Smith</h6>
                <ul class="rat">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--*************** Blog Starts Here ***************-->

   <div class="container-fluid blog">
    <div class="container">
        <div class="blog-row row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-col">
                    <img src="/images/destination/11.jpg" alt="" />
                    <span>March, 2024</span>
                    <h4>Online Flight Reservation</h4>
                    <p>
                        Orci varius natoque penatibus et magnis dis parturient montes,
                        nascetur ridiculus mus. Praesent accumsan, leo in venenatis
                        dictum,
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-col">
                    <img src="/images/destination/12.jpg" alt="" />
                    <span>January 9, 2024</span>
                    <h4>Online Ticket</h4>
                    <p>
                        Orci varius natoque penatibus et magnis dis parturient montes,
                        nascetur ridiculus mus. Praesent accumsan, leo in venenatis
                        dictum,
                    </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="blog-col">
                    <img src="/images/destination/13.jpg" alt="" />
                    <span>May 17, 2024</span>
                    <h4>Boarding Pass</h4>
                    <p>
                        Orci varius natoque penatibus et magnis dis parturient montes,
                        nascetur ridiculus mus. Praesent accumsan, leo in venenatis
                        dictum,
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>


    <!--  ************************* Footer Start Here ************************** -->

    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-12">
            <h2>About Us</h2>
            <p>
              Smart Eye is a leading provider of information technology,
              consulting, and business process services. Our dedicated employees
              offer strategic insights, technological expertise and industry
              experience.
            </p>
            <p>
              We focus on technologies that promise to reduce costs, streamline
              processes and speed time-to-market, Backed by our strong quality
              processes and rich experience managing global...
            </p>
          </div>
          <div class="col-md-4 col-sm-12">
            <h2>Useful Links</h2>
            <ul class="list-unstyled link-list">
              <li>
                <a ui-sref="about" href="#/about">About us</a
                ><i class="fa fa-angle-right"></i>
              </li>
             
            
              <li>
                <a ui-sref="contact" href="contact_us.jsp">Contact us</a
                ><i class="fa fa-angle-right"></i>
              </li>
            </ul>
          </div>
          <div class="col-md-4 col-sm-12 map-img">
            <h2>Contact Us</h2>
            <address class="md-margin-bottom-40"> 
              BlueDart Hosting <br />
              765th Boulevard, <br />
              Rochester, CA <br />
              Phone: +91 8521479632 <br />
              Email:
              <a href="mailto:info@bluedart.com" class="">info@bluedart.in</a
              ><br />
              Web:
              <a href="https://smarteyeapps.com/" class="">www.bluedart.in</a>
            </address>
          </div>
        </div>
      </div>
    </footer>
    <div class="copy">
      <div class="container">
        <a href="https://www.smarteyeapps.com/">2024 &copy; All Rights Reserved | Designed and Developed by komal</a>

        <span>
          <a><i class="fab fa-github"></i></a>
          <a><i class="fab fa-google-plus-g"></i></a>
          <a><i class="fab fa-pinterest-p"></i></a>
          <a><i class="fab fa-twitter"></i></a>
          <a><i class="fab fa-facebook-f"></i></a>
        </span>
      </div>
    </div>
  </body>

  <script src="/js/jquery-3.2.1.min.js"></script>
  <script src="/js/popper.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
  <script src="/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
  <script src="/plugins/slider/js/owl.carousel.min.js"></script>
  <script src="/js/script.js"></script>
</html>