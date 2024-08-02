![Screenshot (759)](https://github.com/user-attachments/assets/28ac5ff5-0b25-4d87-a03b-c65f05fc7840)Flight Management System
Overview
The Flight Management System is a comprehensive web application developed using Spring Boot, Spring MVC, JSP, and Bootstrap. It provides functionalities for managing flight reservations, ticket bookings, and user registrations. This system supports both customer and admin roles, enabling efficient handling of flight and passenger data.

Features
User Registration & Login: Register and log in as a customer or admin.
Flight Management: Add, update, and delete flight details.
Ticket Booking: Book tickets, view ticket details, and cancel tickets.
Passenger Management: Add and manage passenger information associated with tickets.
Feedback System: Submit and view feedback.
Search Functionality: Search for flights and tickets.
Technologies Used
Backend: Java, Spring Boot, Spring MVC, Hibernate
Frontend: HTML, JSP, Bootstrap, CSS
Database: MySQL
Build Tools: Maven
Version Control: Git


How to Work
1. User Registration and Login
Registration: Navigate to /register to create a new account. Choose the role (Customer or Admin) during registration.
Login: Use the /login page to access the system with your credentials.
2. Flight Management (Admin Only)
Add a Flight: Access the /addFlight page to enter new flight details.
Update a Flight: Use /updateFlight to modify existing flight information.
Delete a Flight: Remove flights from the system through the /deleteFlight endpoint.
3. Ticket Booking
Search Flights: Go to /searchFlight to find available flights.
Book a Ticket: Select a flight and provide passenger details to book a ticket at /bookTicket.
4. Ticket Cancellation
Cancel a Ticket: Navigate to /cancelTicket to cancel an existing ticket. Provide the ticket number for cancellation.
5. Passenger Management (Admin Only)
View Passengers: View all passengers through /allPassengers.
Manage Passengers: Admins can update or remove passenger information.
6. Feedback System
Submit Feedback: Go to /feedback to provide feedback about the service.
View Feedback: Access feedback submissions through the /viewFeedback page.
7. Contact Information
Contact Us: For any queries or issues, refer to the /contact page for contact details.
Database Schema
airport: Contains details about airports.
flight: Stores flight-related information.
ticket: Contains ticket booking information.
passenger: Holds passenger details.
route: Details about flight routes.
feedback: Feedback submitted by users.
Contributing
Fork the Repository and create a new branch for your changes.
Make Changes and commit them to your branch.
Push Changes to your forked repository.
Open a Pull Request to merge your changes into the main repository.

database
CREATE DATABASE airlinesdb;
USE airlinesdb;

-- Create the airport table
CREATE TABLE airport (
    airport_code VARCHAR(255) PRIMARY KEY,
    airport_location VARCHAR(255) NOT NULL
);

-- Create the feed_back table
CREATE TABLE feed_back (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL
);

-- Create the flight table
CREATE TABLE flight (
    flight_number BIGINT PRIMARY KEY,
    arrival VARCHAR(255) NOT NULL,
    carrier_name VARCHAR(255) NOT NULL,
    departure VARCHAR(255) NOT NULL,
    route_id BIGINT NOT NULL,
    seat_capacity INT NOT NULL,
    seat_booked INT NOT NULL
);

-- Create the flight_user table
CREATE TABLE flight_user (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);

-- Create the passenger table
CREATE TABLE passenger (
    serial_number INT NOT NULL,
    ticket_number BIGINT NOT NULL,
    fare DOUBLE NOT NULL,
    passengerdob VARCHAR(255) NOT NULL,
    passenger_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (serial_number, ticket_number)
);

-- Create the payment table
CREATE TABLE payment (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    amount DOUBLE NOT NULL,
    payment_mode VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL
);

-- Create the route table
CREATE TABLE route (
    route_id BIGINT PRIMARY KEY,
    destination_airport_code VARCHAR(255) NOT NULL,
    fare DOUBLE NOT NULL,
    source_airport_code VARCHAR(255) NOT NULL
);

-- Create the ticket table
CREATE TABLE ticket (
    ticket_number BIGINT PRIMARY KEY,
    carrier_name VARCHAR(255) NOT NULL,
    flight_number BIGINT NOT NULL,
    route_id BIGINT NOT NULL,
    total_amount DOUBLE NOT NULL
);

-- Adding foreign key constraints

ALTER TABLE flight
ADD CONSTRAINT fk_route
FOREIGN KEY (route_id) REFERENCES route(route_id);

ALTER TABLE passenger
ADD CONSTRAINT fk_ticket
FOREIGN KEY (ticket_number) REFERENCES ticket(ticket_number);

ALTER TABLE ticket
ADD CONSTRAINT fk_flight
FOREIGN KEY (flight_number) REFERENCES flight(flight_number);


Here are some suggestions for future enhancements to the flight management system:

1. User Management and Roles:
User Profiles: Implement user profile management where users can update their personal details, view booking history, and manage preferences.
Role-based Access Control: Expand roles to include additional types like Manager, Travel Agent, or Customer Service Representative with specific permissions.
2. Advanced Search and Filtering:
Search Optimization: Improve search functionality with advanced filters for flights, routes, and tickets.
Dynamic Suggestions: Add auto-complete or suggestions for search fields.
3. Booking and Reservation Enhancements:
Seat Selection: Allow users to select specific seats during booking.
Multiple Passengers: Support booking for multiple passengers at once with dynamic passenger details.
4. Payment Integration:
Multiple Payment Gateways: Integrate additional payment gateways beyond PayPal.
Payment History: Implement a feature to view payment history and download invoices.
5. Notifications and Alerts:
Email/SMS Notifications: Add support for sending booking confirmations, cancellations, and reminders via email or SMS.
Real-time Updates: Implement real-time notifications for flight delays, cancellations, and other critical updates.
6. Reporting and Analytics:
Admin Dashboard: Create a dashboard for admins to view system statistics, booking trends, and performance metrics.
Custom Reports: Enable generation of custom reports for flights, bookings, payments, and user feedback.
7. Mobile Compatibility:
Responsive Design: Ensure the application is fully responsive and works well on mobile devices.
Mobile App: Develop a mobile app for iOS and Android platforms for better user accessibility.
8. Security Enhancements:
Two-Factor Authentication: Implement two-factor authentication (2FA) for added security on user accounts.
Data Encryption: Use encryption for sensitive data like payment details and personal information.
9. Feedback and Reviews:
Review System: Add a system for users to leave reviews and ratings for flights, airlines, and overall experience.
Feedback Analytics: Implement tools to analyze user feedback and identify areas for improvement.
10. Performance Optimization:
Caching: Implement caching strategies to improve the performance of frequently accessed data.
Database Indexing: Optimize database queries and indexing for faster data retrieval.
11. Internationalization and Localization:
Multi-language Support: Provide support for multiple languages and regional settings.
Currency Conversion: Add functionality for displaying prices in different currencies.
12. AI and Machine Learning:
Predictive Analytics: Use AI to predict flight demand, pricing trends, and customer preferences.
Chatbots: Implement AI-powered chatbots to assist with customer inquiries and bookings.
These enhancements will help in improving the overall functionality, user experience, and scalability of your flight management system.

ALTER TABLE ticket
ADD CONSTRAINT fk_route_ticket
FOREIGN KEY (route_id) REFERENCES route(route_id);


