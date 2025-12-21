CREATE TABLE Transactions 
(
	TransactionID INT IDENTITY(1,1) PRIMARY KEY,
	SourceAccountID INT NOT NULL,
	DestinationAccountID INT NOT NULL,
	Amount DECIMAL (18,2) NOT NULL,
	TransactionDate DATETIME NOT NULL DEFAULT GETDATE()
);