SELECT Property.PropertyID, Property.PropertyName, Property.PropertyType, Property.Price, Agent.FirstName AS AgentFirstName, Agent.LastName AS AgentLastName
FROM Property
JOIN Agent ON Property.AgentID = Agent.AgentID;

SELECT Property.PropertyID, Property.PropertyName, Property.PropertyType, Property.Price
FROM Property
WHERE Property.Price < 500000;

SELECT Transaction.TransactionID, Property.PropertyName, Client.FirstName AS ClientFirstName, Client.LastName AS ClientLastName, 
Transaction.Amount, Transaction.TransactionDate
FROM Transaction
JOIN Property ON Transaction.PropertyID = Property.PropertyID
JOIN Agent ON Transaction.AgentID = Agent.AgentID
JOIN Client ON Transaction.ClientID = Client.ClientID
WHERE Agent.AgentID = 1;

SELECT Transaction.TransactionID, Property.PropertyName, Transaction.TransactionType, Transaction.Amount, Transaction.TransactionDate
FROM Transaction
JOIN Property ON Transaction.PropertyID = Property.PropertyID
JOIN Client ON Transaction.ClientID = Client.ClientID
WHERE Client.ClientID = 2;

SELECT Property.PropertyID, Property.PropertyName, Property.Price, Property.PropertyStatus, Agent.FirstName AS AgentFirstName,
Agent.LastName AS AgentLastName
FROM Property
JOIN Agent ON Property.AgentID = Agent.AgentID;

SELECT Client.FirstName, Client.LastName, Property.PropertyName, Transaction.TransactionType, Transaction.TransactionDate
FROM Client
JOIN Transaction ON Client.ClientID = Transaction.ClientID
JOIN Property ON Transaction.PropertyID = Property.PropertyID;

SELECT MONTH(Transaction.TransactionDate) AS Month, COUNT(Transaction.TransactionID) AS TotalTransactions, SUM(Transaction.Amount) 
AS TotalRevenue
FROM Transaction
WHERE YEAR(Transaction.TransactionDate) = 2024  
GROUP BY MONTH(Transaction.TransactionDate);

SELECT QUARTER(Transaction.TransactionDate) AS Quarter, COUNT(Transaction.TransactionID) AS TotalTransactions, SUM(Transaction.Amount) 
AS TotalRevenue
FROM Transaction
WHERE YEAR(Transaction.TransactionDate) = 2023  
GROUP BY QUARTER(Transaction.TransactionDate);

SELECT YEAR(Transaction.TransactionDate) AS Year, COUNT(Transaction.TransactionID) AS TotalTransactions, SUM(Transaction.Amount)
 AS TotalRevenue
FROM Transaction
GROUP BY YEAR(Transaction.TransactionDate);

SELECT Agent.FirstName, Agent.LastName, (SELECT COUNT(*) FROM Transaction WHERE Transaction.AgentID = Agent.AgentID) AS TotalTransactions, 
SUM(Transaction.Amount) AS TotalRevenue
FROM Agent
JOIN Transaction ON Agent.AgentID = Transaction.AgentID
GROUP BY Agent.AgentID;

SELECT Property.PropertyName, Client.FirstName AS ClientFirstName, Client.LastName AS ClientLastName, Agent.FirstName AS AgentFirstName,
 Agent.LastName AS AgentLastName, Transaction.Amount
FROM Property
JOIN Transaction ON Property.PropertyID = Transaction.PropertyID
JOIN Client ON Transaction.ClientID = Client.ClientID
JOIN Agent ON Transaction.AgentID = Agent.AgentID;

SELECT Property.PropertyName, Transaction.TransactionID, Transaction.Amount
FROM Property
LEFT JOIN Transaction ON Property.PropertyID = Transaction.PropertyID;

SELECT Client.FirstName, Client.LastName, Property.PropertyName
FROM Client
CROSS JOIN Property;

SELECT Property.PropertyName, MAX(Transaction.Amount) AS HighestTransactionValue
FROM Property
JOIN Transaction ON Property.PropertyID = Transaction.PropertyID
GROUP BY Property.PropertyID
ORDER BY HighestTransactionValue DESC
LIMIT 1;

DELIMITER //

CREATE TRIGGER UpdatePropertyStatus
AFTER INSERT ON `Transaction`
FOR EACH ROW
BEGIN
    IF NEW.TransactionType = 'Sale' THEN
        UPDATE Property
        SET PropertyStatus = 'Sold'
        WHERE PropertyID = NEW.PropertyID;
    ELSEIF NEW.TransactionType = 'Rent' THEN
        UPDATE Property
        SET PropertyStatus = 'Rented'
        WHERE PropertyID = NEW.PropertyID;
    END IF;
END//

DELIMITER ;

SELECT Client.FirstName, Client.LastName, SUM(Transaction.Amount) AS TotalSpent
FROM Client
JOIN Transaction ON Client.ClientID = Transaction.ClientID
GROUP BY Client.ClientID
ORDER BY TotalSpent DESC;

SELECT Client.FirstName, Client.LastName
FROM Client
WHERE Client.ClientID IN (SELECT ClientID FROM Transaction GROUP BY ClientID HAVING SUM(Amount) > 1000000);

SELECT Client.FirstName AS ClientFirstName, Client.LastName AS ClientLastName, Property.PropertyName, Agent.FirstName 
AS AgentFirstName, Agent.LastName AS AgentLastName, Transaction.TransactionDate, Transaction.Amount
FROM Client
JOIN Transaction ON Client.ClientID = Transaction.ClientID
JOIN Property ON Transaction.PropertyID = Property.PropertyID
JOIN Agent ON Transaction.AgentID = Agent.AgentID;

DELIMITER //

CREATE TRIGGER LogTransactionDetails
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
    INSERT INTO TransactionDetails (TransactionID, PaymentType, PaymentDate, AmountPaid)
    VALUES (NEW.TransactionID, 'Bank Transfer', NEW.TransactionDate, NEW.Amount);
END//

DELIMITER ;









