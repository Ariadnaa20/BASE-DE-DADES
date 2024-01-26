FROM + WHERE = JOIN

DINS DEL JOIN HI HA:
 INNER JOIN I NATUTAL JOIN : 

 LEFT JOIN es que per a que encara que el camp de l'esqueerra no tingui valor el posara 
 RIGHT JOIN                                       la dreta no tingui valor el posara   em quedare amb les asignatures encara q no tinguin alumnes
 
 per a que et mostri tot s'ultiliza el left i el right a la vegada 

 - INNER JOIN : 
 OUTER JOIN NATUTAL INNER JOIN




EXERCICI 1
--a)	Selecciona el nombre del equipo y su ciudad que ha quedado en 1º lugar, en la competición ‘La Liga’ en la temporada con identificador 3.
SELECT e.nombre_equipo, e.ciudad FROM 
(Equipo as e JOIN Clasificacion as cl JOIN Competicion as c
     ON e.nombre_equipo = c.nombre_equipo AND cl.nombre_competicion = c.nombre_competicion)
         WHERE posicion = 1 AND c.nombre_competicion = 'La Liga' AND id_temporada = 3

--b)	Muestra los equipos que han quedado entre los tres primeros clasificados en la competición ‘Champions’ en la temporada con id 5.

SELECT e.* FROM 
(Equipo as e JOIN Clasificacion as cl JOIN Competicion as c JOIN Temporada t
      ON e.nombre_equipo = cl.nombre_equipo AND cl.nombre_competicion = c.nombre_competicion AND t.id_temporada = cl.id_temporada)
      WHERE cl.nombre_competicion = 'Champions' AND t.id_temporada = 5
      ORDER BY cl.posicion ASC
      LIMIT 3


SELECT e.*
FROM Equipo as e
JOIN Clasificacion as cl ON e.nombre_equipo = cl.nombre_equipo
JOIN Competicion as c ON cl.nombre_competicion = c.nombre_competicion
JOIN Temporada t ON t.id_temporada = cl.id_temporada
WHERE c.nombre_competicion = 'Champions' AND t.id_temporada = 5
ORDER BY cl.posicion ASC
LIMIT 3;


--c)	Muestra en nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación.
SELECT e.nombre_equipo, f.nombre_federacion FROM 
(Equipo as e  LEFT JOIN Federacion as f ON e.nombre_federacion = f.nombre_federacion)  --siempre muestre los equipos aunque no haya federacion


--d)	Muestra en nombre de los equipos junto con el nombre de sus federaciones, aunque alguno de ellos no tenga federación, así como también las federaciones sin equipos.

SELECT e.nombre_equipo, f.nombre_federacion FROM 
(Equipo as e LEFT JOIN Federacion as f ON e.nombre_federacion = f.nombre_federacion)  --muestre siemore los equipos aunque no haya federacion(valor null)

UNION

SELECT e.nombre_equipo, f.nombre_federacion FROM 
(Equipo as e RIGHT JOIN Federacion as f ON e.nombre_federacion = f.nombre_federacion);  --muestre seimpre las federaciones aunque no haya ningun equipo (valor null)



EXERCICI 2

--a)	Muestra el nombre y apellido de los jugadores ordenados por el apellido de forma ascendente y por el nombre de forma descendente.

SELECT p.nombre, p.apellido1, p.apellido2 FROM 
(Jugador as j JOIN Persona as p ON j.num_ss_jugador = p.num_ss)
ORDER BY apellido1 ASC, nombre DESC

--b)	Selecciona el nombre y apellido de los jugadores con el dorsal 1 y su ubicación sea ‘Portero’ o con el dorsal 9 y su ubicación sea ‘Delantero’.
SELECT p.nombre, p.apellido1, p.apellido2 FROM 
(Jugador as j JOIN Persona as p ON j.num_ss_jugador = p.num_ss)
WHERE (dorsal = '1' AND ubicacion = 'Portero') OR (dorsal = '9' AND ubicacion = 'Delantero')


--c)	Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo.

SELECT j.num_ss_jugador, j.nombre_equipo FROM 
(Jugador as j LEFT JOIN Persona as p  ON j.num_ss_jugador= p.num_ss)


--d)	Muestra en num_ss_jugador de los jugadores junto con el nombre de sus equipos, aunque alguno de ellos no tenga equipo, así como también los equipos sin jugadores.

SELECT j.num_ss_jugador, j.nombre_equipo FROM 
(Jugador as j LEFT JOIN Persona as p  ON j.num_ss_jugador= p.num_ss)

UNION

SELECT j.num_ss_jugador, j.nombre_equipo FROM 
(Jugador as j RIGHT JOIN Persona as p  ON j.num_ss_jugador= p.num_ss)
WHERE j.num_ss_jugador IS NULL



EXERCICI 3

--a)	Selecciona las entregas con más de dos regalos.
SELECT e.* FROM 
(Entrega as e JOIN Regalo as r ON r.fecha_entrega= e.fecha_entrega)
GROUP BY e.fecha_entrega
HAVING COUNT(r.id_regalo) > 2


--b)	Selecciona las colecciones donde el peso total de sus regalos sea superior a 5000g.

SELECT c.* FROM 
(Coleccion as c JOIN Entrega as e JOIN Regalo as r ON
c.nombre_coleccion = e.nombre_coleccion AND e.fecha_entrega = r.fecha_entrega) 
GROUP BY c.nombre_coleccion 
HAVING SUM(r.peso) > 5000

SELECT c.* FROM 
(Coleccion as c JOIN Entrega as e JOIN Regalo as r ON
c.nombre_coleccion = e.nombre_coleccion AND e.fecha_entrega = r.fecha_entrega) 
WHERE peso > 5000


--c)	Selecciona los usuarios, que son subscritores asociados.

SELECT u.* FROM 
(Usuario as u JOIN Subscritor as s ON u.id_usuario = s.id_subscritor)
WHERE s.es_asociado = 1;


--d)	Selecciona los usuarios, que son clientes a los que no les gusta el formato electrónico.

SELECT u.* FROM 
(Usuario as u JOIN Cliente as c ON u.id_usuario = c.id_cliente )
WHERE NOT c.gusta_electronico 


