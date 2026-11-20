USE DataSaludPeru;
GO

BACKUP DATABASE DataSaludPeru
TO DISK = 'C:\BackUp_DataSaludPeru\Full\DataSaludPeru_Full.bak'
WITH FORMAT, INIT, NAME = 'DataSaludPeru-Full';
GO

BACKUP DATABASE DataSaludPeru
TO DISK = 'C:\BackUp_DataSaludPeru\Diff\DataSaludPeru_Diff.bak'
WITH DIFFERENTIAL, NAME = 'DataSaludPeru-Diff';
GO
