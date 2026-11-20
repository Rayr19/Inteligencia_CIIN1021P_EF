CREATE PROCEDURE dbo.sp_RegistrarDengue
    @LineaCompleta VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF EXISTS (
            SELECT 1
            FROM dbo.T_Dengue
            WHERE LineaCompleta = @LineaCompleta
        )
        BEGIN
            RAISERROR('Error de Integridad: El registro ya existe (Duplicado). Transacción cancelada.', 16, 1);
            RETURN;
        END;

        BEGIN TRANSACTION;

        INSERT INTO dbo.T_Dengue (LineaCompleta)
        VALUES (@LineaCompleta);

        COMMIT TRANSACTION;
        PRINT '[ÉXITO]: Registro de dengue guardado correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
