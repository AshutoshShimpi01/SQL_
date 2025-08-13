Create Database ZS;
use ZS;

-- Customers table
CREATE TABLE Customers (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    region VARCHAR(50) NOT NULL
);

-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    cust_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES Customers(cust_id)
);

-- Sample data for Customers
INSERT INTO Customers (cust_id, cust_name, region) VALUES
(1, 'Alice Johnson', 'North'),
(2, 'Bob Smith', 'South'),
(3, 'Charlie Brown', 'East'),
(4, 'Diana Prince', 'West'),
(5, 'Ethan Hunt', 'North'),
(6, 'Fiona Davis', 'South'),
(7, 'George Clark', 'East'),
(8, 'Hannah Lee', 'West'),
(9, 'Ian Wright', 'North'),
(10, 'Julia Roberts', 'South');

-- Sample data for Orders
INSERT INTO Orders (order_id, order_date, cust_id, total_amount) VALUES
(101, '2024-01-15', 1, 250.00),
(102, '2024-02-10', 2, 180.50),
(103, '2024-03-05', 3, 320.75),
(104, '2024-03-15', 4, 150.00),
(105, '2024-04-20', 5, 410.90),
(106, '2024-05-11', 6, 275.25),
(107, '2024-06-01', 7, 500.00),
(108, '2024-06-22', 8, 600.00),
(109, '2024-07-19', 9, 340.40),
(110, '2024-08-02', 10, 290.00);
