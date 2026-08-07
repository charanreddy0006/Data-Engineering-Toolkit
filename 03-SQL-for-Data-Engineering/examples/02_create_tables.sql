-- ==========================================
-- Create Customers Table
-- ==========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    Phone VARCHAR(15)
);

-- ==========================================
-- Create Vehicles Table
-- ==========================================

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    FuelType VARCHAR(20),
    Price DECIMAL(10,2),
    ManufactureYear INT
);

-- ==========================================
-- Create Orders Table
-- ==========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    OrderDate DATE,
    Quantity INT,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (VehicleID)
        REFERENCES Vehicles(VehicleID)
);