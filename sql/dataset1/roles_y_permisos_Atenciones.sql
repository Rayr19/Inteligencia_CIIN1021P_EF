USE DataSaludPeru;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'User_Auditor' AND type = 'R')
    CREATE ROLE [User_Auditor];

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'User_Analista' AND type = 'R')
    CREATE ROLE [User_Analista];

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = 'User_Admin' AND type = 'R')
    CREATE ROLE [User_Admin];
GO



GRANT SELECT ON dbo.Log_Auditoria TO [User_Auditor];
DENY INSERT, UPDATE, DELETE ON dbo.Log_Auditoria TO [User_Auditor];
DENY INSERT, UPDATE, DELETE ON dbo.ATENCIONES_LA_LIBERTAD TO [User_Auditor];

GRANT SELECT ON dbo.ATENCIONES_LA_LIBERTAD TO [User_Analista];
DENY SELECT ON dbo.Log_Auditoria TO [User_Analista];
DENY INSERT, UPDATE, DELETE ON dbo.ATENCIONES_LA_LIBERTAD TO [User_Analista];
DENY INSERT, UPDATE, DELETE ON dbo.Log_Auditoria TO [User_Analista];

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.ATENCIONES_LA_LIBERTAD TO [User_Admin];
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Log_Auditoria TO [User_Admin];
GO
