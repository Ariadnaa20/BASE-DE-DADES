CREATE DATABASE IF NOT EXISTS exercicis_nadal_3;

# Drop Tablas
DROP TABLE IF EXISTS regalo;
DROP TABLE IF EXISTS subscritor_coleccion;
DROP TABLE IF EXISTS cliente_entrega;
DROP TABLE IF EXISTS entrega;
DROP TABLE IF EXISTS coleccion;
DROP TABLE IF EXISTS subscritor;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS usuario;


CREATE TABLE Usuario(
    id_usuario INT AUTO_INCREMENT;
    DNI VARCHAR(9);
    email VARCHAR (50);
    direccion VARCHAR(200);
    num_targeta INT;
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
);

CREATE TABLE Subscritor(
    id_subscritor INT AUTO_INCREMENT;
    es_asociado BOOLEAN ;
    CONSTRAINT pk_subscritor PRIMARY KEY (id_subscritor);
);


CREATE TABLE Cliente(
    id_cliente INT AUTO_INCREMENT;
    gusta_electronico BOOLEAN ;
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente);
   
);


CREATE TABLE Coleccion(
    nombre_coleccion VARCHAR(50);
    ano_inicio INT;
    ano_fin INT;
    CONSTRAINT pk_coleccion PRIMARY KEY (nombre_coleccion)

);


CREATE TABLE Subscritor_Coleccion(
    id_subscritor INT AUTO_INCREMENT;
    nombre_coleccion VARCHAR (50);
    num_inicio INT;
    CONSTRAINT pk_suscritor_coleccion PRIMARY KEY (id_subscritor, nombre_coleccion);
    
);

CREATE TABLE Regalo(
    id_regalo INT AUTO_INCREMENT;
    fecha_entrega DATE;
    nombre_coleccion VARCHAR(50)
    peso DECIMAL UNSIGNED;
    CONSTRAINT pk_regalo PRIMARY KEY (id_regalo, fecha_entrega, nombre_coleccion);
    
);

CREATE TABLE Entrega(
    fecha_entrega DATE;
    nombre_coleccion VARCHAR(50);
    num_paginas INT;
    CONSTRAINT pk_entrega PRIMARY KEY( fecha_entrega, nombre_coleccion) ;
  

);


ALTER TABLE subscritor ADD CONSTRAINT fk_subscritor FOREIGN KEY (id_subscritor) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE cliente ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE entrega ADD CONSTRAINT fk_entrega FOREIGN KEY (nombre_coleccion) REFERENCES coleccion(nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE regalo ADD CONSTRAINT fk_regalo	FOREIGN KEY (fecha_entrega, nombre_coleccion) REFERENCES entrega(fecha_entrega, nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE subscritor_coleccion ADD CONSTRAINT fk_subscritor2 FOREIGN KEY (id_subscritor) REFERENCES subscritor(id_subscritor) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE subscritor_coleccion ADD CONSTRAINT fk_coleccion FOREIGN KEY (nombre_coleccion) REFERENCES coleccion(nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE cliente_entrega ADD CONSTRAINT fk_cliente2 FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE cliente_entrega ADD CONSTRAINT fk_entrega2 FOREIGN KEY (fecha_entrega, nombre_coleccion) REFERENCES entrega(fecha_entrega,nombre_coleccion) ON UPDATE CASCADE ON DELETE CASCADE;