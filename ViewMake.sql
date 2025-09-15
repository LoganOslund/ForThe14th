CREATE OR REPLACE VIEW OnTransitCustomers AS
SELECT DISTINCT 
    c.FirstName || ' ' || c.LastName AS FullName,
    c.Email
FROM Customers c
JOIN Packages p ON c.CustomerID = p.CustomerID
WHERE p.Status = 'on-transit';
