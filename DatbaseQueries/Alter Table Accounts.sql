USE BillionBanksDB;
SELECT * FROM Customers;

ALTER TABLE dbo.Accounts
ALTER COLUMN AccountNumber NVARCHAR(100);
