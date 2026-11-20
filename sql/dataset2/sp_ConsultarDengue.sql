CREATE PROCEDURE dbo.sp_RegistrarDengue
    @LineaCompleta VARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
CREATE PROCEDURE dbo.sp_ConsultarDengue
    @Filtro VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        LineaCompleta
    FROM dbo.T_Dengue
    WHERE LineaCompleta LIKE '%' + @Filtro + '%';
END;
GO
