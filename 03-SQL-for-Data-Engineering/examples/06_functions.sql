-- Create Table

CREATE TABLE Dealers(

DealerID INT PRIMARY KEY,

DealerName VARCHAR(100),

City VARCHAR(50)
);

-- Insert

INSERT INTO Dealers VALUES
(1,'ABC Motors','Hyderabad');

-- Update

UPDATE Dealers

SET City='Bengaluru'

WHERE DealerID=1;

-- Delete

DELETE FROM Dealers

WHERE DealerID=1;