USE BillionBanksDB;
GO

ALTER TABLE Transactions ADD DateCreated DATETIME DEFAULT GETDATE();
