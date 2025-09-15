SELECT 
    c.FirstName || ' ' || c.LastName AS FullName,
    COUNT(p.PackageID) AS NumPackages
FROM Customers c
LEFT JOIN Packages p ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID
ORDER BY FullName;
