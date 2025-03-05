The result in the example above returned 74 records, that means that there are 17 customers that haven't placed any orders.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);
