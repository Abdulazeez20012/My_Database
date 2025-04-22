-- Create the database
CREATE DATABASE IF NOT EXISTS RideHailingService;
USE RideHailingService;

-- Create Drivers table
CREATE TABLE Drivers (
    DriverID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 1 AND 5),
    TotalRides INT DEFAULT 0
);

-- Create Riders table
CREATE TABLE Riders (
    RiderID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(100)
);

-- Create Rides table
CREATE TABLE Rides (
    RideID INT AUTO_INCREMENT PRIMARY KEY,
    DriverID INT NOT NULL,
    RiderID INT NOT NULL,
    Fare DECIMAL(10,2) NOT NULL,
    Rating DECIMAL(3,2) CHECK (Rating BETWEEN 1 AND 5),
    DistanceKM DECIMAL(6,2) NOT NULL,
    RideTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

-- Create Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    RideID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash', 'Mobile Payment', 'Other'),
    PaymentTimestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);

-- Create an index for performance
CREATE INDEX idx_rides_driver ON Rides(DriverID);
CREATE INDEX idx_rides_rider ON Rides(RiderID);
CREATE INDEX idx_payments_ride ON Payments(RideID);