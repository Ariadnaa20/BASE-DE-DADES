CREATE DATABASE IF NOT EXISTS s3_c1_ej3;


DROP TABLE IF EXISTS usuario;   fet
CREATE TABLE usuario (
    id_usuario INT UNSIGNED AUTO_INCREMENT,
    DNI VARCHAR(9) UNIQUE NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    num_targeta INT UNIQUE NOT NULL,
    PRIMARY KEY (id_usuario)
);

DROP TABLE IF EXISTS cliente;  fet 
CREATE TABLE cliente(
    id_cliente INT UNSIGNED,
    gusta_electronico BOOLEAN DEFAULT TRUE, 
    PRIMARY KEY (id_cliente)
);

DROP TABLE IF EXISTS subscitor;  fet
CREATE TABLE suscriptor(
    id_suscritor INT UNSIGNED,
    es_asociado BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_suscritor)
);

DROP TABLE IF EXISTS    
CREATE TABLE subscritor_coleccion(
    id_suscritor INT UNSIGNED,
    nombre_coleccion INT UNSIGNED
    num_inicio INT 
);

ALTER TABLE suscritor   
ADD FOREIGN KEY (id_subscritor) REFERENCES susscritor,
ADD FOREIGN KEY (nombre_coleccion) REFERENCES coleccion
ON UPDATE CASCADE
ON DELETE CASCADE;



ALTER TABLE suscriptor
ADD FOREIGN KEY (id_suscritor) REFERENCES usuario(id_usuario)
ON UPDATE CASCADE
ON DELETE CASCADE;


// Las FK deben de crearse fuera de las mismas tablas. En aquest cas la generalització de usuari: client i suscritor
ALTER TABLE cliente
ADD FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario)
ON UPDATE CASCADE
ON DELETE CASCADE;



DROP TABLE IF EXISTS coleccion;
CREATE TABLE coleccion (
    nombre_coleccion INT UNSIGNED AUTO_INCREMENT,
    ano_inicio INT,
    ano_final INT,
    PRIMARY KEY(nombre_collecion)
);


ALTER TABLE cliente_entrega
ADD FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE cliente_entrega
ADD FOREIGN KEY(fecha_entrega, nombre_coleccion) REFERENCES entrega(fecha_entrega, nombre_coleccion);


DROP TABLE IF EXISTS entrega;
CREATE TABLE entrega(
    fecha_entrega INT UNSIGNED AUTO_INCREMENT,
    nombre_coleccion INT 
    num_pagines INT
);
ALTER TABLE entrega
ADD FOREIGN KEY (id_suscritor) REFERENCES usuario(id_usuario),
ADD FOREIGN KEY (nombre_coleccion) REFERENCES coleccion(nombre_coleccion)
ON UPDATE CASCADE ON DELETE CASCADE;


DROP TABLE IF EXISTS regalo
CREATE TABLE regalo(
    id_regalo INT UNSIGNED AUTO_INCREMENT,
    fecha_entrega INT UNSIGNED,
    nombre_coleccion INT,
    peso DECIMAL UNSIGNED ZERO FILL,
    PRIMARY KEY(id_regalo,fecha_entrega,nombre_coleccion)   
);




