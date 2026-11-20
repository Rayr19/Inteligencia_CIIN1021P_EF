USE DataSaludPeru;

CREATE TABLE Dim_Tiempo_Dengue (
    TiempoDengueID INT IDENTITY(1,1) PRIMARY KEY,
    ano VARCHAR(20),
    semana VARCHAR(20)
);

CREATE TABLE Dim_Ubicacion_Dengue (
    UbicacionDengueID INT IDENTITY(1,1) PRIMARY KEY,
    departamento VARCHAR(100),
    provincia VARCHAR(100),
    distrito VARCHAR(100),
    localidad VARCHAR(150),
    ubigeo VARCHAR(20),
    diresa VARCHAR(50),
    localcod VARCHAR(50)
);

CREATE TABLE Dim_Diagnostico_Dengue (
    DiagnosticoDengueID INT IDENTITY(1,1) PRIMARY KEY,
    enfermedad VARCHAR(200),
    diagnostic VARCHAR(50),
    tipo_dx VARCHAR(50)
);

CREATE TABLE Dim_Demografica_Dengue (
    DemograficaDengueID INT IDENTITY(1,1) PRIMARY KEY,
    sexo VARCHAR(20),
    edad VARCHAR(20),
    tipo_edad VARCHAR(20)
);

CREATE TABLE Fact_Casos_Dengue (
    FactDengueID INT IDENTITY(1,1) PRIMARY KEY,
    TiempoDengueID INT FOREIGN KEY REFERENCES Dim_Tiempo_Dengue(TiempoDengueID),
    UbicacionDengueID INT FOREIGN KEY REFERENCES Dim_Ubicacion_Dengue(UbicacionDengueID),
    DiagnosticoDengueID INT FOREIGN KEY REFERENCES Dim_Diagnostico_Dengue(DiagnosticoDengueID),
    DemograficaDengueID INT FOREIGN KEY REFERENCES Dim_Demografica_Dengue(DemograficaDengueID),
    CantidadCasos INT DEFAULT 1
