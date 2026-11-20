USE DataSaludPeru;
GO

INSERT INTO dbo.Fact_Atenciones (
    IdAtencion,
    TiempoID,
    UbicacionID,
    EstablecimientoID,
    DemograficaID,
    CantidadAtenciones
)
SELECT
    TRY_CAST(a.IdAtencion AS INT) AS IdAtencion,
    t.TiempoID,
    u.UbicacionID,
    e.EstablecimientoID,
    d.DemograficaID,
    ISNULL(TRY_CAST(1 AS INT), 0) AS CantidadAtenciones
FROM dbo.ATENCIONES_LA_LIBERTAD a
INNER JOIN dbo.Dim_Tiempo t
    ON ISNULL(a.Anio, 'No especificado') = t.Anio
   AND ISNULL(a.Mes, 'No especificado') = t.Mes
INNER JOIN dbo.Dim_Ubicacion u
    ON ISNULL(a.Desc_Dep, 'No especificado') = u.Desc_Dep
   AND ISNULL(a.Desc_Prov, 'No especificado') = u.Desc_Prov
   AND ISNULL(a.Desc_Dis, 'No especificado') = u.Desc_Dis
INNER JOIN dbo.Dim_Establecimiento e
    ON ISNULL(a.Establecimiento, 'No especificado') = e.Establecimiento
   AND ISNULL(a.Servicio, 'No especificado') = e.Servicio
   AND ISNULL(a.Diagnostico, 'No especificado') = e.Diagnostico
INNER JOIN dbo.Dim_Demografica d
    ON ISNULL(a.Sexo, 'No especificado') = d.Sexo
   AND ISNULL(a.Edad, 'No especificado') = d.Edad;
