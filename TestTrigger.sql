-- Before update (check current row)
SELECT * FROM Packages WHERE PackageID = 1;

-- Update Status to delivered
UPDATE Packages
SET Status = 'delivered'
WHERE PackageID = 1;

-- After update (check again, StatusDate should be updated automatically)
SELECT * FROM Packages WHERE PackageID = 1;
