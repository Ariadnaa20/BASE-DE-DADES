--ELS INSERTS AMB AUTOINCREMENT ES PREFERIBLE POSAR UN NULL O OMITIR LA COLUMNA pero posar ' ' seria incorrecte 
INSERT INTO Temporada (id_temporada, fecha_inicio, fecha_fin) VALUES (1, '2023-01-12', '2021-01-12'), (NULL, '2019-04-03', '2018-07-04')

INSERT INTO Federacion (nombre_federacion, fecha_creacion, responsable) VALUES ('laliga', '2028-04-01', 'Juan'), ('laesportiva', '2016-02-05', 'Maria')

INSERT INTO Competicion (nombre_competicion, nombre_TV) VALUES ('madrid', 'LG'), ('barça', 'Samsung');

INSERT INTO Clasificacion(id_temporada, nombre_competicion, nombre_equipo) VALUES ('1', 'madrid', 'Real Madrid CF'),('2','barça','FC Barcelona');

INSERT INTO Equipo(nombre_equipo, ciudad, presidente, nombre_federecion) VALUES ('Real Madrid CF', 'madrid', 'adrian', 'laliga'), ('FC Barcelona', 'barcelona', 'steven', 'laesportiva')


UPDATE Clasificacion as c JOIN Temporada as t     /*una forma */UPDATE Clasificacion as c, Temporada as t SET c.Posicion =  0 WHERE c.id_temporada= t.id_temporada AND YEAR(t.fecha_inicio) = 2019
ON c.id_temporada= t.id_temporada
SET c.posicion = 0 
WHERE  YEAR(t.fecha_inicio) = 2019

UPDATE Federacion SET fecha_creacion = CURRENT_DATE() WHERE nombre_federacion= 'laliga';


DELETE FROM Competicion  WHERE nombre_TV='Champions ';

DELETE FROM Clasificacion;



EJERCICIO 2 --insercion indirecta

INSERT INTO Persona(num_ss, nombre, apellido1, apellido2) VALUES ('47892873L', 'Maria', 'Fernandez', 'Dominguez' )
INSERT INTO Persona(num_ss, nombre, apellido1, apellido2) VALUES ('47892874L', 'Juan', 'Lopez', 'Rodriguez')

INSERT INTO Arbitro(num_ss_arbitro, num_colegiado, ano_inicio, profesion) VALUES('47892873L', 'COLEGIADO1',  2019 , 'Disenyadora')

INSERT INTO Jugador(num_ss_jugador, dorsal, ubicacion, ficha, nombre_equipo) VALUES('47892874L', 'NUMERO2', 'carrer 3 barcelona', 'quarenta-3', ' ')

INSERT INTO Equipo(nombre, ano_fundacion, presupuesto, presidente, entrenador, direccion) VALUES ('Barcelona', 1996, 35678, 'rafiña', 'carrer 3')
INSERT INTO Equipo(nombre, ano_fundacion, presupuesto, presidente, entrenador, direccion) VALUES ('Real Madrid', 1985, 35538, 'steven', 'carrer 4')

INSERT INTO Partido(num_ss_arbitro, equipo_local, equipo_visitante) VALUES ('47892873L', 'Barcelona', 'Real Madrid', 1 , '2024-01-03')

UPDATE Jugador SET dorsal = 1 AND ubicacion = 'Portero' WHERE num_ss_jugador='47892874L'

UPDATE Equipo SET Presidente = 'steven'   mejor poner Presidente = Entrenador WHERE nombre= 'madrid'

UPDATE Equipo SET Presupuesto = Presupuesto + 1000000 WHERE nombre ORDER BY ASC LIMIT 1 
-- UPDATE Equipo SET Presupuesto = Presupuesto + 1000000 ORDER BY nombre ASC LIMIT 1

DELETE FROM Equipo ORDER BY presidente ASC LIMIT 1


DELETE FROM Equipo 
ORDER BY nombre  
DESC LIMIT 1


EJERCICIO 3

INSERT INTO Usuario VALUES (5, '48294534L', 'hola@gmail.com', 'carrer 3 barcelona', 45234342),

INSERT INTO 

UPDATE Subscritor SET es_asociado = FALSE

DELETE FROM Regalo WHERE peso > 5000


DELETE FROM Usuario WHERE num
UPDATE Usuario SET num_targeta = NULL
WHERE id_usuario= '?'


DELETE FROM Cliente_Entrega 
