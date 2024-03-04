CREATE DATABASE IF NOT EXISTS s3_c1_ej2
USE s3_c1_ej2   --NO TE OLVIDES DE PONER EL USE


CREATE TABLE IF EXISTS Equipo(
    nombre VARCHAR(50)
    ano_fundacion INT,
    presupuesto INT, 
    presidente VARCHAR(50),
    entrenador VARCHAR(50),
    direccion VARCHAR(50),
    CONSTRAINT pk_Equipo PRIMARY KEY (nombre)
);

CREATE TABLE IF EXISTS Persona(
    num_ss INT (9),
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    CONSTRAINT pk_persona PRIMARY KEY(num_ss)
) DEFAULT CHARACTER SET 'utf8' COLLATE  'utf8_spanish_ci'; --PONER UN CHARACTER SET I COLLATION A UNA TABLA

CREATE TABLE IF EXISTS Arbitro(
    num_ss_arbitro INT (9),
    num_colegiado INT (9),
    profesion VARCHAR(50),
    PRIMARY KEY (num_ss_arbitro)
)

CREATE TABLE IF EXISTS Partido(
    num_ss_arbitro INT(9) DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8-spanish_ci', --PONER UN CHARACTER SET I COLLATION A UNA COLUMNA
    equipo_local VARCHAR(30),
    equipo_visitante VARCHAR(30)
    resultado INT,
    fecha DATE
    PRIMARY KEY(num_ss_arbitro, equipo_local, equipo_visitante),
    CONSTRAINT pk_arbitro FOREIGN KEY(num_ss_arbitro) REFERENCES Arbitro(num_ss_arbitro) ON DELETE CASCADE ON UPADTE CASCADE
    CONSTRAINT pk_equipo FOREIGN KEY(equipo_local, equipo_visitante) REFERENCES Equipo(nombre) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Jugador(
    num_ss_jugador INT(9),
    dorsal INT (8),
    ubicacion VARCHAR(30),
    ficha DECIMAL,
    nombre_equipo VARCHAR (50)
    CONSTRAINT pk_jugador PRIMARY KEY(num_ss_jugador), --millor no repetir noms de constraint
    CONSTRAINT pk_equipo FOREIGN KEY (nombre_equipo) REFERENCES Equipo(nombre_equipo) ON DELETE CASCADE ON UPDATE CASCADE
)

