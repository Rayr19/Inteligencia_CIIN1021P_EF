CREATE PROCEDURE dbo.sp_RegistrarAtencion
    @Anio VARCHAR(50),
    @Mes VARCHAR(50),
    @Desc_Dep VARCHAR(50),
    @Desc_Prov VARCHAR(50),
    @Desc_Dis VARCHAR(50),
    @Establecimiento VARCHAR(100),
    @Servicio VARCHAR(150),
    @Sexo VARCHAR(20),
    @Edad VARCHAR(50),
    @Diagnostico VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        IF EXISTS (
            SELECT 1 FROM dbo.ATENCIONES_LA_LIBERTAD
            WHERE Anio = @Anio 
              AND Mes = @Mes 
              AND Establecimiento = @Establecimiento 
              AND Servicio = @Servicio 
              AND Sexo = @Sexo 
              AND Edad = @Edad
        )
        BEGIN
            RAISERROR('Error de Integridad: El registro ya existe (Duplicado). Transacción cancelada.', 16, 1);
            RETURN;
        END

        BEGIN TRANSACTION;

        INSERT INTO dbo.ATENCIONES_LA_LIBERTAD (
            Anio, Mes, Desc_Dep, Desc_Prov, Desc_Dis, 
            Establecimiento, Servicio, Sexo, Edad, Diagnostico
        )
        VALUES (
            @Anio, @Mes, @Desc_Dep, @Desc_Prov, @Desc_Dis, 
            @Establecimiento, @Servicio, @Sexo, @Edad, @Diagnostico
        );

        COMMIT TRANSACTION;
        PRINT '[ÉXITO]: Atención registrada correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 
            ROLLBACK TRANSACTION;
        
        DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrMsg, 16, 1);
    END CATCH
END;
GO
