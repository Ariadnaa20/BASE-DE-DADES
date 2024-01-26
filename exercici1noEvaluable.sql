CREATE DATABASE IF NOT EXISTS s3_c1_ej1;

CREATE TABLE temporada(
    id_temporada INT UNSIGNED AUTO_INCREMENT,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    PRIMARY KEY (id_temporada)
);

CREATE TABLE federacion(
    nombre_federacion INT UNSIGNED AUTO_INCREMENT,
    fecha_creacion DATETIME, 
    responsable VARCHAR(50),
    PRIMARY KEY(nombre_federacion)
);

CREATE TABLE competicion(
    nombre_competicion INT UNSIGNED AUTO_INCREMENT,
    nombre_TV VARCHAR(50),
    PRIMARY KEY(nombre_competicion)
);

CREATE TABLE equipo(
    nombre_equipo INT UNSIGNED AUTO_INCREMENT,
    ciudad VARCHAR(50) NOT NULL,
    presidente VARCHAR(50) NOT NULL,
    nombre_federacion INT UNSIGNED NOT NULL, 
    PRIMARY KEY(nombre_equipo),
    FOREIGN KEY (nombre_federacion) REFERENCES federacion(nombre_federacion)
);

CREATE TABLE Clasificacion (
    id_temporada INT UNSIGNED NOT NULL,
    nombre_competicion INT UNSIGNED NOT NULL,
    nombre_equipo INT UNSIGNED NOT NULL,
    posicion INT NOT NULL,
    PRIMARY KEY (id_temporada, nombre_competicion, nombre_equipo),
    FOREIGN KEY (id_temporada) REFERENCES temporada (id_temporada)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (nombre_competicion) REFERENCES competicion (nombre_competicion)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (nombre_equipo) REFERENCES equipo (nombre_equipo)
    ON UPDATE CASCADE ON DELETE CASCADE
);