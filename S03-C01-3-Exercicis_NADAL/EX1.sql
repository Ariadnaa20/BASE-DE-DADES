CREATE DATABASE IF NOT EXISTS exericicis_nadal_ej1 DEFAULT CHARACTER SET 'latin1' DEFAULT COLLATE 'latin1_bin';

CREATE TABLE Temporada(
    id_temporada INT AUTO_INCREMENT;
    fecha_inicio DATETIME;
    fecha_fin DATETIME;
    CONSTRAINT pk_temporada PRIMARY KEY (id_temporada) 
);

CREATE TABLE Competicion(
    nombre_competicion VARCHAR(50);
    nombre_TV VARCHAR(50)
    CONSTRAINT pk_competicion PRIMARY KEY (nombre_competicion)
);

CREATE TABLE Federacion(
    nombre_federacion VARCHAR(50);
    fecha_creacion DATETIME;
    responsable VARCHAR(50);
    CONSTRAINT pk_federacion PRIMARY KEY (nombre_federacion)
);

CREATE TABLE Equipo(
    nombre_equipo VARCHAR(50) NOT NULL;
    ciudad VARCHAR(50) NOT NULL;
    presidente VARCHAR(50) NOT NULL ;
    nombre_federacion VARCHAR(50) NOT NULL ;
    CONSTRAINT pk_equipo PRIMARY KEY (nombre_equipo);
    CONSTRAINT fk_federacion FOREIGN KEY (nombre_federacion) REFERENCES Federacion(nombre_federacion) ON UPDATE CASCADE ON DELETE CASCADE
    
);

CREATE TABLE Clasificacion(
    id_temporada INT AUTO_INCREMENT;
    nombre_federacion VARCHAR(50);
    nombre_competicion VARCHAR(50);
    posicion INT;
    CONSTRAINT pk_clasificacion PRIMARY KEY (id_temporada, nombre_federacion, nombre_equipo );
    CONSTRAINT fk_clasificacion FOREIGN KEY (id_temporada) REFERENCES Temporada(id_temporada) ON UPDATE CASCADE ON DELETE CASCADE;
    CONSTRAINT fk_clasificacion2 FOREIGN KEY (nombre_competicion) REFERENCES Competicion(nombre_competicion) ON UPDATE CASCADE ON DELETE CASCADE;
    CONSTRAINT fk_clasificacion3 FOREIGN KEY (nombre_equipo) REFERENCES Equipo (nombre_equipo) ON UPDATE CASCADE ON DELETE CASCADE
);

<!-- no te dejes el references de FOREGEIN KEY-->
<!-- PREGUNTAR AL PROFE: tengo que poner not null tambien en una pk? No porque de por si no te deja-->

