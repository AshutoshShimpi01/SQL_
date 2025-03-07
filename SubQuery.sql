-The result in the example above returned 74 records, that means that there are 17 customers that haven't placed any orders.

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);



-find those customers_name whhose Order keyboard or mouse
  
select first_name,Country from Customers
where customer_id in
(select  customer_id from Orders 
where item in('Keyboard','Mouse'));
