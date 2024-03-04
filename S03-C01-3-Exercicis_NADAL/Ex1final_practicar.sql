CREATE DATABASE s3_c1_ej1 
        DEFAULT CHARACTER SET latin1  --CUIDADO ESTO PON SIEMPRE EL DEFAULT
        DEFAULT COLLATE latin1_bin

CREATE TABLE Temporada (
    id_temporada INT AUTO_INCREMENT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    CONSTRAINT pk_temporada PRIMARY KEY(id_temporada)
);    

CREATE TABLE Federacion (
    nombre_federacion VARCHAR(50),
    fecha_creacion DATETIME,
    responsable VARCHAR(30),
    CONSTRAINT pk_federacion PRIMARY KEY(nombre_federacion)
);

CREATE TABLE Equipo (
    nombre_equipo VARCHAR(50),
    ciudad VARCHAR(50) NOT NULL
    presidente VARCHAR(50) NOT NULL,
    nombre_federacion  VARCHAR(50) NOT NULL, 
    CONSTRAINT pk_equipo PRIMARY KEY(nombre_equipo)
    CONSTRAINT fk_nombre_federacion FOREIGN KEY(nombre_federacion) REFERENCES Federacion(nombre_federacion) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Competicion (
    nombre_competicion VARCHAR(50)
    nombre_TV VARCHAR(50)
    CONSTRAINT pk_competicion PRIMARY KEY(nombre_competicion)
)

CREATE TABLE Clasificacion(
    id_temporada INT AUTO_INCREMENT,
    nombre_competicion VARCHAR(50),
    nombre_equipo  VARCHAR(50),
    posicion INT,
    CONSTRAINT pk_clasifiacacion PRIMARY KEY (id_temporada, nombre_competicion, nombre_equipo)
    CONSTRAINT fk_temporada FOREIGN KEY (id_temporada) REFERENCES Temporada(id_temporada) ON DELETE CASCADE ON UPDATE CASCADE
    CONSTRAINT fk_cometicion FOREIGN KEY (nombre_competicion) REFERENCES Competicion(nombre_competicion) ON DELETE CASCADE ON UPDATE CASCADE
    CONSTRAINT fk_equipo FOREIGN KEY (nombre_equipo) REFERENCES Equipo(nombre_equipo) ON DELETE CASCADE ON UPDATE CASCADE
)