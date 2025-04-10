-- A. Show all data in each of the tables
SELECT * FROM customer;
SELECT * FROM invoice;
SELECT * FROM invoice_item;

-- B. List the LastName, FirstName, and Phone of all customers.
SELECT LastName, FirstName, Phone FROM customer;

-- C. List the LastName, FirstName, and Phone for all customers with a FirstName of ‘Nikki’.
SELECT LastName, FirstName, Phone FROM customer
WHERE FirstName = 'Nikki';

-- D. List the LastName, FirstName, Phone, DateIn, and DateOut of all orders in excess of $100.00.
SELECT c.LastName, c.FirstName, c.Phone, i.DateIn, i.DateOut
FROM customer c, invoice i
WHERE c.CustomerID = i.CustomerID AND i.TotalAmount > 100.00;

-- E. List the LastName, FirstName, and Phone of all customers whose first name starts with ‘B’.
SELECT LastName, FirstName, Phone FROM customer
WHERE FirstName LIKE 'B%';

-- F. List the LastName, FirstName, and Phone of all customers whose last name includes the characters ‘cat’.
SELECT LastName, FirstName, Phone FROM customer
WHERE LastName LIKE '%cat%';

-- G. List the LastName, FirstName, and Phone for all customers whose second and third digits of their phone number are 23.
-- Assuming Phone is stored as a string:
SELECT LastName, FirstName, Phone FROM customer
WHERE SUBSTRING(Phone, 2, 2) = '23';

-- H. Determine the maximum and minimum TotalAmount.
SELECT MAX(TotalAmount) AS MaxTotal, MIN(TotalAmount) AS MinTotal FROM invoice;

-- I. Determine the average TotalAmount.
SELECT AVG(TotalAmount) AS AvgTotal FROM invoice;

-- J. Count the number of customers.
SELECT COUNT(*) AS CustomerCount FROM customer;

-- K. Group customers by LastName and then by FirstName.
SELECT LastName, FirstName FROM customer
GROUP BY LastName, FirstName;

-- L. Count the number of customers having each combination of LastName and FirstName.
SELECT LastName, FirstName, COUNT(*) AS Count
FROM customer
GROUP BY LastName, FirstName;

-- M. Show the LastName, FirstName, and Phone of all customers who have had an order with TotalAmount > $100.00.
-- Use a subquery. Present sorted by LastName ASC, FirstName DESC.
SELECT LastName, FirstName, Phone
FROM customer
WHERE CustomerID IN (
    SELECT CustomerID FROM invoice WHERE TotalAmount > 100.00
)
ORDER BY LastName ASC, FirstName DESC;

-- N. Same as M but using a join without JOIN ON syntax.
SELECT c.LastName, c.FirstName, c.Phone
FROM customer c, invoice i
WHERE c.CustomerID = i.CustomerID
AND i.TotalAmount > 100.00;

-- O. Show the LastName, FirstName, and Phone of all customers who have had an order with
-- TotalAmount greater than $100.00. Use a join using JOIN ON syntax. Sorted by LastName ASC, FirstName DESC.
SELECT c.LastName, c.FirstName, c.Phone
FROM customer c
JOIN invoice i ON c.CustomerID = i.CustomerID
WHERE i.TotalAmount > 100.00
ORDER BY c.LastName ASC, c.FirstName DESC;

-- P. Show the LastName, FirstName, and Phone of all customers who have had an order
-- with an Item named 'Dress Shirt'. Use a subquery. Sorted by LastName ASC, FirstName DESC.

SELECT LastName, FirstName, Phone
FROM customer
WHERE CustomerID IN (
    SELECT i.CustomerID
    FROM invoice i
    JOIN invoice_item ii ON i.InvoiceNumber = ii.InvoiceNumber
    WHERE ii.Item = 'Dress Shirt'
)
ORDER BY LastName ASC, FirstName DESC;