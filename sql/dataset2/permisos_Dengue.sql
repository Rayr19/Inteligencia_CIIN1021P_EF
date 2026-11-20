USE DataSaludPeru;
GO

DENY INSERT, UPDATE, DELETE ON dbo.T_Dengue TO [User_Auditor];

GRANT SELECT ON dbo.T_Dengue TO [User_Analista];
DENY INSERT, UPDATE, DELETE ON dbo.T_Dengue TO [User_Analista];

GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.T_Dengue TO [User_Admin];
GO
