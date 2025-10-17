-- DDL to create the table
CREATE TABLE Self (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(50),
    ManagerID INT  -- This foreign key references EmployeeID in the same table
);

-- DML to populate the table
INSERT INTO Self (EmployeeID, FirstName, LastName, Title, ManagerID) VALUES
(101, 'Alice', 'Smith', 'CEO', NULL),
(102, 'Bob', 'Johnson', 'Sales Manager', 101),
(103, 'Charlie', 'Brown', 'Sales Rep', 102),
(104, 'David', 'Lee', 'Sales Rep', 102),
(105, 'Eve', 'Wilson', 'HR Manager', 101);





-- Query to perform a Self Join on the 'Self' table
SELECT
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName,
    E.Title AS EmployeeTitle,
    M.FirstName AS ManagerFirstName,
    M.LastName AS ManagerLastName
FROM
    Self E  -- Alias 1: Represents the Employee from the 'Self' table
LEFT JOIN
    Self M  -- Alias 2: Represents the Manager from the 'Self' table
    ON E.ManagerID = M.EmployeeID;
