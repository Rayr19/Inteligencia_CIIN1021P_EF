CREATE TRIGGER dbo.trg_ValidarAtenciones
ON dbo.ATENCIONES_LA_LIBERTAD
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE TRY_CAST(Edad AS INT) < 0
    )
    BEGIN
        RAISERROR('[ERROR EN TRIGGER]: El valor numérico no puede ser un número negativo.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO  
