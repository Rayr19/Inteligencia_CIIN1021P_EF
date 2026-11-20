USE DataSaludPeru;

CREATE TABLE Dim_Tiempo (
    TiempoID INT IDENTITY(1,1) PRIMARY KEY,
    Anio VARCHAR(20),
    Mes VARCHAR(20)
);

CREATE TABLE Dim_Ubicacion (
    UbicacionID INT IDENTITY(1,1) PRIMARY KEY,
    Desc_Dep VARCHAR(100),
    Desc_Prov VARCHAR(100),
    Desc_Dis VARCHAR(100)
);

CREATE TABLE Dim_Establecimiento (
    EstablecimientoID INT IDENTITY(1,1) PRIMARY KEY,
    Establecimiento VARCHAR(200),
    Servicio VARCHAR(150),
    Diagnostico VARCHAR(250)
);

CREATE TABLE Dim_Demografica (
    DemograficaID INT IDENTITY(1,1) PRIMARY KEY,
    Sexo VARCHAR(30),
    Edad VARCHAR(30)
);

CREATE TABLE Fact_Atenciones (
    FactAtencionID INT IDENTITY(1,1) PRIMARY KEY,
    IdAtencion INT,
    TiempoID INT FOREIGN KEY REFERENCES Dim_Tiempo(TiempoID),
    UbicacionID INT FOREIGN KEY REFERENCES Dim_Ubicacion(UbicacionID),
    EstablecimientoID INT FOREIGN KEY REFERENCES Dim_Establecimiento(EstablecimientoID),
    DemograficaID INT FOREIGN KEY REFERENCES Dim_Demografica(DemograficaID),
    CantidadAtenciones INT DEFAULT 1
);
