CREAR FITXERS
mysql load data infile 
--SELECT noms.txt
SELECT Name
INTO OUTFILE 'C:/Users/aripa/Downloads/UF3-baseDades/noms.txt'  --ruta abusoluta
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
FROM Country;

--SELECT salt de lonea ha de quedar aixi Nom pais, idioma juntar dues taules tambe posar ; i /n

SELECT c.Name, cl.Language 
INTO OUTFILE 'C:/Users/aripa/Downloads/UF3-baseDades/paisidioma.txt' --si fos la ruta relativa  paisidioma.txt  SELECT @@datadir
FIELDS TERMINATED BY ', '
LINES TERMINATED BY ';\n' 
FROM Country as c INNER JOIN countrylanguage as cl ON c.Code=cl.CountryCode;

current_timestamp()


IMPORTAR FITXERS 
pasos:
1. crear base de dades
CREATE DATABASE world_ariadna1;
USE world_ariadna;


CREATE TABLE Pais(  --posar el id autoincremental
    nom  varchar(255),
    PRIMARY KEY (nom)
);

CREATE TABLE Pais_Nom(
    nom  varchar(20),
    llenguatge varchar(20)
);

3. ENTRAR FITXERS

--Taula païs
LOAD DATA INFILE 'C:\\Users\\aripa\\Downloads\\UF3-baseDades\\noms.txt'  --/ o \\  
INTO TABLE Pais
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
(nom); --aixo no cal nomes es per afegir una columna concreta 

--Taula Païs_nom
LOAD DATA INFILE 'C:\\Users\\aripa\\Downloads\\UF3-baseDades\\paisidioma.txt' --ruta abusoluta. Si vull ruta relativa carpeta de atras/fitxer.txt
INTO TABLE Pais_Nom
FIELDS TERMINATED BY ', '
LINES TERMINATED BY ';\n'
(nom, llenguatge);






