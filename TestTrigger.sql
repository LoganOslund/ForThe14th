-- Before update
SELECT * FROM Packages WHERE PackageID = 1;

-- Update Status to delivered
UPDATE Packages
SET Status = 'delivered'
WHERE PackageID = 1;

-- After update
SELECT * FROM Packages WHERE PackageID = 1;
