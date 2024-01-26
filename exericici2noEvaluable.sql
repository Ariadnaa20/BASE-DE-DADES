CREATE DATABASE IF NOT EXISTS s3_c1_ej2;

CREATE TABLE IF NOT EXISTS persona(
    num_ss INT UNSIGNED AUTO_INCREMENT;
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NOT NULL,
    PRIMARY KEY (num_ss)
    ALTER TABLE persona CONVERT TO CHARACTER SET utf8 COLLATE utf8_spanish_ci;
); 

CREATE TABLE IF NOT EXISTS arbitro( //generalizacion de persona
    num_ss_arbitro INT UNSIGNED AUTO_INCREMENT,
    num_colegiado INT, 
    ano_inicio INT DATE,
    profession VARCHAR(50)
    PRIMARY KEY(num_ss_arbitro),
    FOREIGN KEY(num_ss_arbitro) REFERENCES persona(num_ss),
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS equipo(
    nombre VARCHAR(50),
    ano_fundacion INT,
    presupuesto INT,
    presidente VARCHAR(50),
    entrenador VARCHAR(50),
    direccion VARCHAR(50),
    PRIMARY KEY(nombre)
);

CREATE TABLE IF NOT EXISTS jugador(  //generalizacion de persona
    num_ss_jugador INT UNSIGNED AUTO_INCREMENT,
    dorsal VARCHAR(50),
    ubicacion VARCHAR(50),
    ficha DECIMAL,
    nombre_equipo VARCHAR(50),
    PRIMARY KEY(num_ss_jugador),
    FOREIGN KEY(num_ss_jugador) REFERENCES persona(num_ss)
    ON UPDATE CASCADE
    ON DELETE CASCADE
    FOREIGN KEY(nombre_equipo) REFERENCES equipo(nombre)
    ON UPDATE CASCADE
    ON DELETE CASCADE

    );


CREATE TABLE IF NOT EXISTS partido(
    num_ss_arbitro INT UNSIGNED,
    equipo_local VARCHAR(50),
    equipo_visitante VARCHAR(50),
    resultado INT, 
    fecha DATE,
    PRIMARY KEY(num_ss_arbitro, equipo_local, equipo_visitante),
    FOREIGN KEY(num_ss_arbitro) REFERENCES arbitro(num_ss_arbitro)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY(equipo_local) REFERENCES equipo(nombre)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY(equipo_visitante) REFERENCES equipo(nombre)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
