EXERCICI 1

--a)	Selecciona el identificador de las temporadas que han empezado entre el 2010 y el 2015.
SELECT id_temporada FROM Temporada
WHERE YEAR(fecha_inicio) BETWEEN 2010 AND 2015  funciones

--b)	Selecciona las temporadas que no han terminado (suponiendo que una temporada que no ha terminado tendrá el valor de ese atributo a NULL).
SELECT * FROM Temporada    pon siempre where + algo  i el asterisco siempre que te digan selecciona + nombre tabla
WHERE fecha_fin NOT NULL

--c)	Selecciona el nombre de las competiciones con un nombre de televisión de más de 5 letras.
SELECT nombre_competicion FROM Competicion 
WHERE LENGTH(nombre_TV) > 5   funciones

--d)	Selecciona el nombre de las competiciones con un nombre de televisión que empiece con el texto ‘SKY’.
SELECT nombre_competicion FROM Competicion 
WHERE nombre_TV LIKE 'SKY%'

--e)	Selecciona las ciudades donde tenemos equipos, evitando tener resultados repetidos.

SELECT ciudad FROM Equipo    SELECT DISTINCT(ciudad) FROM equipo
WHERE DISTINCT ciudad 

--f)	Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.

SELECT e.nombre_equipo, e.ciudad FROM Equipo as e, Clasificacion as c
WHERE e.nombre_equipo = c.nombre_equipo AND nombre_competicion = '%La Liga%' AND id_temporada = 3
ORDER BY posicion DESC 
LIMIT 1



--g)	Selecciona el nombre de los equipos de Madrid, Barcelona o Sevilla

SELECT nombre_equipo FROM Equipo
WHERE ciudad = 'Madrid' OR ciudad = 'Barcelona' OR ciudad= 'Sevilla'

--h)	Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.

SELECT e.* FROM Equipo as e, Clasificacion as c   asterisco es cuando te dicen el nombre de una tabla
WHERE e.nombre_equipo = c.nombre_equipo AND nombre_competicion= '%Champions%' AND id_temporada=5 AND posicion <= 3


EXERCICI 2  REPASAR GENERALITZACIONS A SQL

--a)	Selecciona el nombre y apellido de los árbitros.

SELECT nombre, apellido1, apellido2 FROM Persona as p, Arbitro as a
WHERE p.num_ss = a.num_ss_arbitro

--b)	Muestra el nombre de los equipos fundados antes del 1950 que tengan entrenador en la actualidad (suponiendo que si hay un valor válido en entrenador es que actualmente tienen entrenador)

SELECT nombre FROM Equipo 
WHERE YEAR(ano_fundacion) < 1950 AND entrenador IS NOT NULL

--c)	Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.

SELECT nombre, apellido1  FROM Persona as p, Jugador as j 
WHERE p.num_ss = a.num_ss_jugador AND (dorsal = 1 AND ubicacion = 'Portero') OR (dorsal = 9 AND ubicacion = 'Delantero')

--d)	Muestra el nombre, apellido y apellido2 en un único campo, separado por espacios de las personas que tengan una letra ‘c’ en su nombre. 

SELECT CONCAT (nombre, '',  apellido1, '', apellido2) FROM Persona as p 
WHERE nombre LIKE '%c%'



--e)	Muestra los partidos jugados durante un mes de Febrero (de cualquier año).

SELECT * FROM Partido 
WHERE MONTH(fecha)= 2

--f)	Muestra los partidos jugados hoy.

SELECT * FROM Partido
WHERE fecha = CURRENT_DATE()

--g)	Muestra los árbitros que han iniciado entre el 2000 y el 2005 que sean ´Técnico Informático’ de profesión. DUBTE PROFE 
NO SE SI POSAR LIKE O DIRECTAMENT = 'Tecnico informatico'  LIKE es quan son coincidencies parcials del text i = es quan coincidencia exacta

SELECT * FROM Arbitro 
WHERE profesion LIKE 'Tecnico informatico' AND ano_inicio BETWEEN 2000 AND 2005 

--h)	Muestra el nombre de los equipos y su presupuesto, reduciendo este último en 100.000 euros. OPERACIONES REPASAR

SELECT nombre , presupuesto - 100000 as Presupost_reduit FROM Equipo



EXERCICI 3

a)	Selecciona los usuarios, que son subscritores asociados.
SELECT u.* FROM Usuario as u, Subscritor as s
WHERE u.id_usuario = s.id_subscitor AND es_asociado IS TRUE 

b)	Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.

SELECT u.* FROM Usuario as u, Cliente as c
WHERE u.id_usuario = c.id_cliente AND gusta_electronico IS FALSE

c)	Selecciona las colecciones iniciadas antes del 1970 y terminadas antes del 2000.

SELECT * FROM Coleccion  
WHERE ano_inicio < 1970 AND ano_fin < 2000

d)	Selecciona el identificador de los subscritores que han iniciado la colección con nombre ‘Minerales del Mundo’ des del 1r número.

SELECT sc.id_subscritor FROM Subscritor as s, Usuario as u, Subscritor_Coleccion as sc, Coleccion as c
WHERE u.id_usuario = s.id_subscitor AND s.id_subscitor = sc.id_subscitor AND sc.nombre_coleccion = c.nombre_coleccion
AND c.nombre_coleccion = 'Minerales del mundo' AND num_inicio = 1


e)	Selecciona la id de los usuarios que no tengan un email válido (suponiendo que un mail válido tiene que contener una @).
SELECT id_usuario FROM Usuarios
WHERE mail NOT LIKE '%@%'


f)	Muestra las id’s de los regalos que pesan menos de 100g o más de 500g (suponiendo que el atributo peso se guarda en gramos).

SELECT id_regalo FROM Regalo WHERE peso < 100g AND peso > 500g

SELECT id_regalgo FROM Regalo WHERE peso NOT BETWEEN 100 AND 500

g)	Selecciona las entregas de enero del 2019.

SELECT * FROM Entrega 
WHERE YEAR(fecha_entrega) = 2019 AND MONTH(fecha_entrega) = 1


h)	Selecciona las entregas del 31 de Diciembre de 2018 o del 1 de Enero del 2019.  /*si tenemos que filtrar por fecha completa,
no hace falta filtrar con funciones:*/

SELECT * FROM Entrega
WHERE YEAR(fecha_entrega) = 2018 AND MONTH(fecha_entrega) = 12 AND DAY(fecha_entrega)= 31
OR YEAR(fecha_entrega) = 2019 AND MONTH(fecha_entrega) = 1 AND DAY(fecha_entrega) = 1

SELECT * FROM Entrega 
WHERE fecha_entrega = '2018-12-31' OR fecha_entrega= '2019-01-01'