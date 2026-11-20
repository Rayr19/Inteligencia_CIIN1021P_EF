CREATE TRIGGER dbo.trg_ValidarDengue
ON dbo.T_Dengue
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE LTRIM(RTRIM(ISNULL(LineaCompleta, ''))) = ''
           OR LineaCompleta LIKE '%,-%'
    )
    BEGIN
        RAISERROR('[ERROR EN TRIGGER]: Registro inválido o con valor negativo en T_Dengue.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
