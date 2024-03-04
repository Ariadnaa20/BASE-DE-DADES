EXERICI 1


--Realiza las siguientes consultas:
--a)	Selecciona el identificador de las temporadas que han empezado entre el 2010 y el 2015.
SELECT id_temporada FROM temporada WHERE YEAR(fecha_inicio) BETWEEN 2010 AND 2015;


--b)	Selecciona las temporadas que no han terminado (suponiendo que una temporada que no ha terminado tendrá el valor de ese atributo a NULL).
SELECT * FROM temporada WHERE fecha_fin IS NULL;


--c)	Selecciona el nombre de las competiciones con un nombre de televisión de más de 5 letras.

SELECT nombre_competicion FROM competicion WHERE LENGTH(nombre_TV) > 5;


--d)	Selecciona el nombre de las competiciones con un nombre de televisión que empiece con el texto ‘SKY’.
SELECT nombre_competicion FROM competicion WHERE nombre_TV LIKE 'SKY%';



--e)	Selecciona las ciudades donde tenemos equipos, evitando tener resultados repetidos.
SELECT DISTINCT ciudad FROM equipo;


--f)	Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.
* ns si esta be
SELECT e.nombre_equipo, e.ciudad FROM clasificacion AS c 
INNER JOIN equipo AS e ON c.nombre_equipo = e.nombre_equipo 
WHERE c.posicion = 1 AND c.nombre_competicion = 'La Liga' AND c.id_temporada = 3;


--g)	Selecciona el nombre de los equipos de Madrid, Barcelona o Sevilla
SELECT nombre_equipo FROM equipo WHERE ciudad IN ('Madrid', 'Barcelona', 'Sevilla');


--h)	Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.

SELECT e.nombre_equipo FROM clasificacion AS c 
INNER JOIN equipo AS e ON c.nombre_equipo = e.nombre_equipo 
WHERE c.posicion <= 3 AND c.nombre_competicion = 'Champions' AND c.id_temporada = 5;



EXERCICI 2: 
--Realiza las siguientes consultas:
--a)	Selecciona el nombre y apellido de los árbitros.
SELECT nombre, apellido FROM arbitro

--b)	Muestra el nombre de los equipos fundados antes del 1950 que tengan entrenador en la actualidad (suponiendo que si hay un valor válido en entrenador es que actualmente tienen entrenador)
SELECT equipo WHERE ano_fundacion < '1950-01-01'AND entrenador IS NOT NULL;

--c)	Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.
SELECT nombre, apellido FROM jugador WHERE (dorsal = 1 AND posicion = 'Portero') OR (dorsal = 9 AND posicion = 'Delantero');

--d)	Muestra el nombre, apellido y apellido2 en un único campo, separado por espacios de las personas que tengan una letra ‘c’ en su nombre. 
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS nombre_completo FROM persona WHERE nombre LIKE '%c%';

--e)	Muestra los partidos jugados durante un mes de Febrero (de cualquier año).
SELECT * FROM partido WHERE MONTH(fecha) = 2;

--f)	Muestra los partidos jugados hoy.

SELECT * FROM partido WHERE fecha = CURDATE(); o el now tambe 

--g)	Muestra los árbitros que han iniciado entre el 2000 y el 2005 que sean ´Técnico Informático’ de profesión.
SELECT p.num_ss, pe.nombre, pe.apellido1, pe.apellido2
FROM arbitro AS a
INNER JOIN persona AS pe ON a.num_ss_arbitro = pe.num_ss
WHERE a.ano_inicio BETWEEN 2000 AND 2005 AND a.profesion = 'Técnico Informático';


--h)	Muestra el nombre de los equipos y su presupuesto, reduciendo este último en 100.000 euros.

SELECT e.nombre, (CAST(presupuesto AS DECIMAL) - 100000) AS presupuesto_reducido FROM equipo AS e;





EXERCICI 3:
--a)	Selecciona los usuarios, que son subscritores asociados.

SELECT id_usuario FROM usuario INNER JOIN subscritor ON usuario.id_usuario = subscritor.id_subscritor WHERE es_asociado = TRUE;

--b)	Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.

SELECT id_usuario FROM usuario INNER JOIN cliente ON usuario.id_usuario = cliente.id_cliente WHERE gusta_electronico = FALSE;

--c)	Selecciona las colecciones iniciadas antes del 1970 y terminadas antes del 2000.

SELECT nombre_coleccion FROM coleccion WHERE ano_inicio < 1970 AND ano_fin < 2000;

--d)	Selecciona el identificador de los subscritores que han iniciado la colección con nombre ‘Minerales del Mundo’ des del 1r número.
SELECT id_subscritor FROM subscritor_coleccion WHERE nombre_coleccion = 'Minerales del Mundo' AND num_inicio = 1;


--e)	Selecciona la id de los usuarios que no tengan un email válido (suponiendo que un mail válido tiene que contener una @).
SELECT id_usuario FROM usuario WHERE mail NOT LIKE '%@%';


--f)	Muestra las id’s de los regalos que pesan menos de 100g o más de 500g (suponiendo que el atributo peso se guarda en gramos).
SELECT id_regalo FROM regalo WHERE peso < 100 OR peso > 500;


--g)	Selecciona las entregas de enero del 2019.

SELECT * FROM entrega WHERE MONTH(fecha_entrega) = 1 AND YEAR(fecha_entrega) = 2019;

--h)	Selecciona las entregas del 31 de Diciembre de 2018 o del 1 de Enero del 2019.

SELECT * FROM entrega WHERE fecha_entrega IN ('2018-12-31', '2019-01-01');



sempre el where per lincar taules

no es pot fer un having sense group by