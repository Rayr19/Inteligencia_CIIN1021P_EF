CREATE TRIGGER dbo.trg_Auditoria_Dengue
ON dbo.T_Dengue
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @TipoOperacion VARCHAR(20);

    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
        SET @TipoOperacion = 'UPDATE';
    ELSE IF EXISTS (SELECT 1 FROM inserted)
        SET @TipoOperacion = 'INSERT';
    ELSE IF EXISTS (SELECT 1 FROM deleted)
        SET @TipoOperacion = 'DELETE';

    INSERT INTO dbo.Log_Auditoria
        (FechaHora, UsuarioSQL, RolUsuario, Accion, TablaAfectada, DetalleOperacion)
    VALUES (
        GETDATE(),
        SUSER_SNAME(),
        USER_NAME(),
        @TipoOperacion,
        'T_Dengue',
        CONCAT('Transacción tipo [', @TipoOperacion, '] ejecutada exitosamente por el usuario: ', SUSER_SNAME())
    );
END;
GO
