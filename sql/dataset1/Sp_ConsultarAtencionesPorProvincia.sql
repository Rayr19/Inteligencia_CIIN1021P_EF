CREATE PROCEDURE dbo.sp_ConsultarAtencionesPorProvincia
    @Provincia VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        IdAtencion, 
        Desc_Prov, 
        Desc_Dis, 
        Establecimiento, 
        Servicio, 
        Sexo, 
        Edad, 
        Diagnostico
    FROM dbo.ATENCIONES_LA_LIBERTAD
    WHERE Desc_Prov LIKE '%' + @Provincia + '%';
END;
GO
