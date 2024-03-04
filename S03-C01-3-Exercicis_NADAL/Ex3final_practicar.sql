CREATE DATABASE IF NOT EXISTS s3_c1_ej3


-- LAS CREACIONES DE LAS TABLAS ESTARIAN MAL, PRIMERO : i despues ya se crean con create table
--OTRO ERROR QUE LAS COLUMNAS SE SEPARAN POR , i no por ; pero al final si 
# Drop Tablas
DROP TABLE IF EXISTS regalo;
DROP TABLE IF EXISTS subscritor_coleccion;
DROP TABLE IF EXISTS cliente_entrega;
DROP TABLE IF EXISTS entrega;
DROP TABLE IF EXISTS coleccion;
DROP TABLE IF EXISTS subscritor;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS usuario;


DROP TABLE IF EXISTS Usuario(
    id_usuario INT AUTO_INCREMENT,
    DNI INT (9) NOT NULL,
    email VARCHAR(50) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    num_targeta INT NOT NULL,
    PRIMARY KEY(id_usuario)
)

--esta esta perfecta 
CREATE TABLE Subscritor(
    id_subscritor INT AUTO_INCREMENT,
    es_asociado BOOLEAN DEFAULT TRUE ,
    PRIMARY KEY (id_subscritor)
    
);
ALTER TABLE Subscritor ADD CONSTRAINT fk_usuarioS FOREIGN KEY (id_subscritor) REFERENCES Usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE;

DROP TABLE IF EXISTS Cliente(
    id_cliente INT AUTO_INCREMENT
    gusta_electronico BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS Coleccion(
    nombre_coleccion VARCHAR (100),
    ano_inicio INT,
    ano_fin INT,
    PRIMARY KEY (nombre_coleccion)
);

DROP TABLE IF EXISTS Subscritor_Coleccion(
    id_subscritor INT AUTO_INCREMENT
    nombre_coleccion VARCHAR (100),
    num_inicio INT,
    PRIMARY KEY (id_subscitor, nombre_coleccion),
);

ALTER TABLE Subscritor_Coleccion ADD CONSTRAINT fk_subscritor FOREIGN KEY (id_subscritor) REFERENCES Subscritor(id_subcritor) ON DELETE CASCADE ON DELETE CASCADE 
ALTER TABLE Subscritor_Coleccion ADD CONSTRAINT fk_coleccion FOREIGN KEY(nombre_coleccion) REFERENCES Coleccion (nombre_coleccion) ON DELETE CASCADE ON UPDATE CASCADE


DROP TABLE IF EXISTS Entrega( --preguntar si el constraintnpot tenir el mateox nom a diferents taules
    fecha_entrega DATE,
    nombre_coleccion VARCHAR(100)
    num_paginas INT 
    PRIMARY KEY(fecha_entrega, nombre_coleccion)
);
ALTER TABLE Entrega ADD CONSTRAINT fk_coleccion FOREIGN KEY (nombre_coleccion) REFERENCES Coleccion(nombre_coleccion)

DROP TABLE IF EXISTS Cliente_Entrega(
    id_cliente INT AUTO_INCREMENT,
    fecha_entrega DATE, 
    nombre_coleccion VARCHAR (100)
);
ALTER TABLE Cliente_Entrega ADD CONSTRAINT pk_cliente FOREIGN KEY (id_cliente) REFERENCES Usuario(id_usuario)
ALTER TABLE Cliente_Entrega ADD CONSTRAINT fk_entrega FOREIGN KEY(fecha_entrega, nombre_coleccion) REFERENCES Entrega(fecha_entrega, nombre_coleccion)


DROP TABLE IF EXISTS Regalo(
    id_regalo INT AUTO_INCREMENT,
    fecha_entrega DATE,
    nombre_coleccion VARCHAR (50),
    peso DECIMAL UNSIGNED,
    PRIMARY KEY (id_regalo, fecha_entrega, nombre_coleccion),
);
ALTER TABLE Regalo ADD CONSTRAINT fk_entrega FOREIGN KEY(fecha_entrega, nombre_coleccion) REFERENCES Entrega(fecha_entrega, nombre_coleccion)

