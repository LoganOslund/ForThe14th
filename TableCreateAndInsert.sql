-- Addresses Table
CREATE TABLE Addresses 
(
    AddressID SERIAL PRIMARY KEY,
    StreetAddress VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL
);

-- Customers Table
CREATE TABLE Customers 
(
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    AddressID INT NOT NULL,
    CONSTRAINT fk_customer_address
        FOREIGN KEY (AddressID)
        REFERENCES Addresses(AddressID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Drivers Table
CREATE TABLE Drivers 
(
    DriverID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    LicenseNumber VARCHAR(20) UNIQUE NOT NULL
);

-- Packages Table
CREATE TABLE Packages 
(
    PackageID SERIAL PRIMARY KEY,
    Description VARCHAR(255) NOT NULL,
    Weight DECIMAL(10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('pickup','on-transit','delivered')),
    StatusDate TIMESTAMP NOT NULL,
    CustomerID INT NOT NULL,
    DriverID INT NOT NULL,
    CONSTRAINT fk_package_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_package_driver
        FOREIGN KEY (DriverID)
        REFERENCES Drivers(DriverID)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);


-- Add Info

INSERT INTO Addresses (StreetAddress, City, State, PostalCode) VALUES
('123 Main St', 'Los Angeles', 'CA', '90001'),   -- ID = 1
('456 Elm St', 'New York', 'NY', '10001'),       -- ID = 2
('789 Oak St', 'Chicago', 'IL', '60601'),        -- ID = 3
('101 Pine St', 'San Francisco', 'CA', '94101'); -- ID = 4

INSERT INTO Customers (FirstName, LastName, Email, Phone, AddressID) VALUES
('John', 'Doe', 'john@example.com', '123-456-7890', 1),
('Jane', 'Smith', 'jane@example.com', '987-654-3210', 2),
('Bob', 'Johnson', 'bob@example.com', '555-555-5555', 3),
('Alice', 'Williams', 'alice@example.com', '111-222-3333', 4);

INSERT INTO Drivers (FirstName, LastName, LicenseNumber) VALUES
('David', 'Smith', 'DL12345'),
('Emily', 'Johnson', 'DL67890'),
('Michael', 'Brown', 'DL54321'),
('Olivia', 'Davis', 'DL98765'),
('Jane', 'Robert', 'TLM1289'),
('Mary', 'James', 'AO8526');




-- Each package linked to one Customer and one Driver
INSERT INTO Packages (Description, Weight, Status, StatusDate, CustomerID, DriverID) VALUES
('Electronics (fragile)', 5.2, 'pickup', '2024-01-05 09:15:00', 1, 1),
('Books', 2.0, 'delivered', '2024-01-08 14:30:00', 2, 2),
('Clothing', 3.5, 'on-transit', '2024-02-02 10:45:00', 3, 3),
('Furniture', 15.8, 'pickup', '2024-02-01 11:20:00', 4, 4),
('Artwork (fragile)', 5.0, 'delivered', '2024-01-05 13:10:00', 1, 2),
('Home Appliance', 100.0, 'pickup', '2024-01-14 08:00:00', 2, 5);
