USE DataSaludPeru;
GO

WITH DatosDengue AS (
    SELECT
        LTRIM(RTRIM(PARSENAME(REPLACE(ISNULL(LineaCompleta, ''), ';', '.'), 4))) AS Departamento,
        LTRIM(RTRIM(PARSENAME(REPLACE(ISNULL(LineaCompleta, ''), ';', '.'), 3))) AS Provincia,
        LTRIM(RTRIM(PARSENAME(REPLACE(ISNULL(LineaCompleta, ''), ';', '.'), 2))) AS Distrito,
        LTRIM(RTRIM(PARSENAME(REPLACE(ISNULL(LineaCompleta, ''), ';', '.'), 1))) AS Diagnostico
    FROM dbo.T_Dengue
)
INSERT INTO dbo.Fact_Casos_Dengue (
    TiempoDengueID,
    UbicacionDengueID,
    DiagnosticoDengueID,
    DemograficaDengueID,
    CantidadCasos
)
SELECT
    td.TiempoDengueID,
    ud.UbicacionDengueID,
    dxd.DiagnosticoDengueID,
    dfd.DemograficaDengueID,
    ISNULL(TRY_CAST(1 AS INT), 0) AS CantidadCasos
FROM DatosDengue d
INNER JOIN dbo.Dim_Ubicacion_Dengue ud
    ON ISNULL(d.Departamento, 'No especificado') = ud.departamento
   AND ISNULL(d.Provincia, 'No especificado') = ud.provincia
   AND ISNULL(d.Distrito, 'No especificado') = ud.distrito
INNER JOIN dbo.Dim_Diagnostico_Dengue dxd
    ON ISNULL(d.Diagnostico, 'No especificado') = dxd.diagnostic
CROSS JOIN (SELECT TOP 1 TiempoDengueID FROM dbo.Dim_Tiempo_Dengue) td
CROSS JOIN (SELECT TOP 1 DemograficaDengueID FROM dbo.Dim_Demografica_Dengue) dfd;
