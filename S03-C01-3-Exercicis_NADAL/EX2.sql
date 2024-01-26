CREATE DATABASE IF NOT EXISTS exercicis_nadal_2;
USE exercicis_nadal_2;

CREATE TABLE IF EXISTS Persona(
    num_ss INT NOT NULL;
    nombre VARCHAR(50) NOT NULL;
    apellido1 VARCHAR(50) NOT NULL;
    apellido2 VARCHAR(50) NOT NULL;
    CONSTRAINT pk_persona PRIMARY KEY (num_ss)
) DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_spanish_ci';


CREATE TABLE IF EXISTS Jugador(
    num_ss_jugador INT DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_spanish_ci';
    dorsal VARCHAR(50);
    ubicacion VARCHAR(50);
    ficha DECIMAL;
    nombre_equipo VARCHAR(50)
    CONSTRAINT pk_jugador PRIMARY KEY (num_ss_jugador);
    CONSTRAINT fk_jugador FOREIGN KEY (num_ss_jugador) REFERENCES Persona(num_ss) ON UPDATE CASCADE ON DELETE CASCADE
    CONSTRAINT fk_equipo FOREIGN KEY (nombre_equipo) REFERENCES Equipo(nombre) ON UPDATE CASCADE ON DELETE CASCADE 
);

CREATE TABLE IF EXISTS Aribtro(
    num_ss_arbitro INT  DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_spanish_ci';
    num_colegiado INT;
    ano_inicio INT;
    profesion VARCHAR(50);
    CONSTRAINT pk_arbitro PRIMARY KEY (num_ss_arbitro)
    CONSTRAINT fk_arbitro FOREIGN KEY (num_ss_arbitro) REFERENCES Persona(num_ss) ON UPDATE CASCADE ON DELETE CASCADE 

);

CREATE TABLE IF EXISTS Equipo(
    nombre VARCHAR(50);
    ano_fundacion INT;
    presupuesto INT;
    presidente VARCHAR(50);
    entrenador VARCHAR(50);
    direccion VARCHAR(50)
    CONSTRAINT pk_equipo PRIMARY KEY (nombre);
);


CREATE TABLE IF EXISTS Partido(
    num_ss_arbitro INT DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE 'utf8_spanish_ci' ;
    equipo_local VARCHAR(50);
    equipo_visitante VARCHAR(50);
    resultado INT;
    fecha DATE;
    CONSTRAINT pk_partido PRIMARY KEY (num_ss_arbitro, equipo_local, equipo_visitante);
    CONSTRAINT fk_partido_arbitro FOREIGN KEY (num_ss_arbitro) REFERENCES Arbitro (num_ss_arbitro)  ON UPDATE CASCADE ON DELETE CASCADE ;
    CONSTRAINT fk_equipo FOREIGN KEY (equipo_visitante, equipo_local) REFERENCES Equipo (nombre) ON UPDATE CASCADE ON DELETE CASCADE ;

);

COSES A TENIR EN COMPTE:

SI HA UNA TAULA QUE SERA UNA COLLATE O CHARACTER SET DIFERENT ELS CAMPS D'AQUESTA QUE DERIVIN A ALTRES. EL CAMP QUE DERIVI A TOTES LES 
TAULES TAMBE HA DE TENIR AQUELLA CARACTERISTICA

2 CONSTRAINT fk_equipo FOREIGN KEY (nombre_equipo) REFERENCES Equipo(nombre) ON UPDATE CASCADE ON DELETE CASCADE 
                                   atribut de la taula               atribut de la taula d'on ve 

