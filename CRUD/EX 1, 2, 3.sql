EXERCICI 1

--a)	Haz dos inserciones como mínimo en todas las tablas de la base de datos usando el método mutli-insert.
INSERT INTO Temporada VALUES (1, '2004-05-20','2008-05-20' ), (2, '2012-06-07', '2002-05-20');

INSERT INTO Federacion VALUES ('Española', '20-05-2004' , 'Antonio'), ('Americana', '2012-06-03', 'Miguel'); 

INSERT INTO Competicion VALUES ('Primaria', 'Futbol'), ('Secundaria', 'Basquet');

INSERT INTO Clasificacion VALUES (1, 'Primaria', 'Barça', 3), (2, 'Secundaria', 'Madrid',2); 

INSERT INTO Equipo VALUES ('Barça', 'Barcelona',  'Josep', 'Española'), ( 'Madrid ', 'Madrid', 'Madrid', 'Americana');

--b)	Actualiza la posición de todos los clasificados a 0 para las temporadas con año 2019 en la fecha de inicio.
UPDATE Clasificacion as c JOIN Temporada as t 
ON c.id_temporada= t.id_temporada
SET c.posicion = 0
WHERE t.fecha_inicio = 2019  


--c)	Actualiza la fecha de creación de una federación que has creado a la fecha del día de hoy.

UPDATE Federacion SET fecha_creacion = CURRENT_DATE() WHERE nombre_federacion='Federacion Española de Fútbol'

--d)	Borra el valor nombre_TV de la competición ‘Champions’. borrar nomes un camp de la champions i deixarlo a nul borrem valor d'una columna
DELETE FROM Competicion WHERE nombre_TV = Champions’ ;
UPDATE competicion SET nombre_TV = NULL;
--e)	Borra todas las clasificaciones. borrar filas sencerasd
DELETE FROM Clasificacion


EXERICI 2

--a)	Haz una inserción como mínimo en todas las tablas de la base de datos (excepto equipo donde harás dos) usando la inserción indirecta. 

INSERT INTO Persona (num_ss, nombre, apellido1, apellido2) VALUES ('47892874L', 'Ariadna', 'Pascual', 'Palau'); --jugador
INSERT INTO Persona (num_ss, nombre, apellido1, apellido2) VALUES ('47892873L', 'Alex', 'Martinez', 'Lopez'); --arbitro
INSERT INTO Persona (num_ss, nombre, apellido1, apellido2) VALUES ('47892874L', 'Pablo', 'Rodriguez', 'Lopez'); 

INSERT INTO Arbitro (num_ss_arbitro, num_colegiado, ano_inicio, profesion) VALUES ('47892873L', '2022-05-12', '4030', 'médico'); 


INSERT INTO Equipo (nombre, ano_fundacion, presupuesto, presidente, entrenador, direccion) VALUES ('Madrid', '1991-05-02', '70000', 'Florentino', 'Marc', 'c/escocolmo-15');
INSERT INTO Equipo (nombre, ano_fundacion, presupuesto, presidente, entrenador, direccion)  VALUES ('Barcelona', '1789-04-01', '80000', 'Antoni', 'Josep' , 'c/llança-2');

INSERT INTO Partido (num_ss_arbitro, equipo_local, equipo_visitante, resultado, fecha) VALUES ('47892873L', 'Barcelona', 'Madrid', '3-1', '2024-01-15');

INSERT INTO Jugador (num_ss_jugador, dorsal, ubicacion, ficha, nombre_equipo) VALUES ('47892874L', 10, 'Delantero', 2000000, 'Barcelona');


--b)	Actualiza el dorsal a 1 y ubicación a ‘Portero’ para el jugador que has creado.

UPDATE Jugador SET dorsal= '1' AND ubicacion = 'Portero' 
WHERE num_ss_jugador= '47892874L'

--c)	Actualiza el valor del presidente de un equipo que has creado con el valor de su entrenador.

UPDATE Equipo SET presidente = entrenador WHERE nombre= 'Madrid'  -- o posar el nom

--d)	Actualiza el presupuesto del equipo en +1 millón del equipo con el primer equipo encontrado ordenados de la A a la Z por su nombre.

UPDATE Equipo SET presupuesto = presupuesto + 1000000
ORDER BY nombre ASC
LIMIT 1                                          --no posar els punts 

--e)	Borra el equipo que se encuentre primero ordenándolos de la Z a la A por su nombre.

DELETE FROM Equipo 
ORDER BY nombre DESC
LIMIT 1     --es borra el madrid
 



EXERCICI 3   

--a)	Haz una inserción como mínimo en todas las tablas de la base de datos usando una inserción directa.

INSERT INTO Usuario (id_usuario, DNI, mail, direccion, num_targeta) VALUES ('1', '123456789', 'usuario1@email.com', 'Calle A, No. 123', '111472');
INSERT INTO Usuario (id_usuario, DNI, mail, direccion, num_targeta) VALUES ('2', '123456788', 'usuario2@email.com', 'Calle B, No. 124', '138732');

INSERT INTO Subscritor (id_subscritor, es_asociado) VALUES ('1', '1');


INSERT INTO Cliente (id_cliente, gusta_electronico) VALUES ('2', '0');


INSERT INTO Subscritor_Coleccion (id_subscritor, nombre_coleccion, num_inicio) VALUES ('1', 'ColeccionA', '100');

INSERT INTO Coleccion (nombre_coleccion, ano_inicio, ano_fin) VALUES ('ColeccionA', '1990', '1995');
INSERT INTO Coleccion (nombre_coleccion, ano_inicio, ano_fin) VALUES ('ColeccionB', '1991', '1996');


INSERT INTO Entrega (fecha_entrega, nombre_coleccion, num_paginas) VALUES ('2024-01-15', 'ColeccionA', '50');


INSERT INTO Regalo (id_regalo, fecha_entrega, nombre_coleccion, peso) VALUES ('REG001', '2024-01-15', 'ColeccionB', '2');

INSERT INTO Cliente_Entrega (id_cliente, fecha_entrega, nombre_coleccion) VALUES ('2', '2024-01-15', 'ColeccionB');


--b)	Actualiza el atributo es_asociado del subscritor añadido a FALSE.

UPDATE Subscritor SET es_asociado = 0 
WHERE id_subscritor = 1;


--c)	Borra los regalos con un peso mayor a 5000g (suponemos que el peso está en gramos). RELAGLOS ES UNA TABLA DELETE
                                                                                                 -- ES UNA COLUMNA UPDATE

DELETE FROM Regalo WHERE peso > 50000

--d)	Borra el numero de la tarjeta del usuario añadido. Nomes es borrar una columna no una fila DELETE AMB WHERE SEMPRE 

DELETE FROM Usuario WHERE num_targeta = '352334';

UPDATE usuario 
  SET num_targeta = NULL  --assignar un valor a una columna 
  WHERE id_usuario =1


--e)	Borra las compras de entregas de los clientes.

DELETE FROM Cliente_Entrega;
