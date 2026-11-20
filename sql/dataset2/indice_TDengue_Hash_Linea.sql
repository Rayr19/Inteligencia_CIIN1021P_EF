USE DataSaludPeru;
GO

IF COL_LENGTH('dbo.T_Dengue', 'Hash_Linea') IS NULL
BEGIN
    ALTER TABLE dbo.T_Dengue
    ADD Hash_Linea AS CHECKSUM(LineaCompleta) PERSISTED;
END;
GO

DROP INDEX IF EXISTS IX_TDengue_Hash_Linea ON dbo.T_Dengue;
GO
