--ARIADNA PASCUAL

/*EXERCICI 1 CORREGIR NOMS DE TAULES I COLUMNAS*/
--En una taula poden haver 6 combinacions de triggers en total tres amb after i 3 amb before

--A
DROP TRIGGER IF EXISTS trigger_is_broken$$
CREATE TRIGGER trigger_is_broken AFTER UPDATE ON ServerStatus
FOR EACH ROW
BEGIN
    IF NEW.is_broken = TRUE THEN
        INSERT INTO Alertas (tipo_alerta, descripcion, fecha)
        VALUES ('Prioritario', CONCAT('El servidor ', NEW.id, ' está estropeado'), NOW());
    END IF;
END$$

--B
DROP TRIGGER IF EXISTS trigger_ram_upgrade$$
CREATE TRIGGER trigger_ram_upgrade AFTER UPDATE ON ServerStatus
FOR EACH ROW
BEGIN
    IF NEW.ram_upgrade = TRUE THEN
        UPDATE ServerStatus SET ram = ram + 256 WHERE id = NEW.id;
        INSERT INTO Alertas (tipo_alerta, descripcion, fecha)
        VALUES ('Mantenimiento', CONCAT('Ram en el servidor ', NEW.id, ' aumentada'), NOW());
    END IF;
END$$


--C
DROP TRIGGER IF EXISTS trigger_ram_downgrade$$
CREATE TRIGGER trigger_ram_downgrade AFTER UPDATE ON ServerStatus
FOR EACH ROW
BEGIN
    IF NEW.ram_downgrade = TRUE AND OLD.ram > 256 THEN
        UPDATE ServerStatus SET ram = ram - 256 WHERE id = NEW.id;
        INSERT INTO Alertas (tipo_alerta, descripcion, fecha)
        VALUES ('Mantenimiento', CONCAT('Ram en el servidor ', NEW.id, ' reducida'), NOW());
    END IF;
END$$


--D
DROP TRIGGER IF EXISTS trigger_server_delete$$
CREATE TRIGGER trigger_server_delete BEFORE DELETE ON ServerStatus
FOR EACH ROW
BEGIN
    INSERT INTO Alertas (tipo_alerta, descripcion, fecha)
    VALUES ('Baja', CONCAT('El servidor ', OLD.id, ' ha sido dado de baja'), NOW());
END$$

DELIMITER ;

/*EXERCICI 2*/

DROP TRIGGER IF EXISTS insertar_usuario $$
CREATE TRIGGER insertar_usuario BEFORE INSERT ON Log
FOR EACH ROW 
BEGIN 



/*EXERCICI 3*/
--Assegurarnos que el event_scheduler estigui activat
SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL event_scheduler = ON;

--procediment
DELIMITER $$

DROP PROCEDURE IF EXISTS export_Emails $$

CREATE PROCEDURE export_Emails(IN nom_fitxer VARCHAR(255))
BEGIN
   SET @sqlQuery = CONCAT("SELECT email INTO OUTFILE '", @NomFitxer, "'",
                          " FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' ",
                          " LINES TERMINATED BY '\\n' FROM persona WHERE email IS NOT NULL");

   PREPARE stmt FROM @sqlQuery;
   EXECUTE stmt;
   DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

--event

DELIMITER $$

CREATE EVENT IF NOT EXISTS export_Emails_Event
ON SCHEDULE EVERY 1 MONTH STARTS LAST_DAY(CURDATE()) + INTERVAL 1 HOUR
DO
   CALL export_Emails(DATE_FORMAT(NOW(), '%m_%Y'));

DELIMITER ;


/*EXERCICI 6*/

--a)	Crea el usuario ‘user1’ sin contraseña

CREATE USER user1;

--b)	Crea el usuario ‘user2’ con contraseña ‘pwd2’

CREATE USER user2 IDENTIFIED BY 'pwd2';

--c)	Crea el usuario ‘user3’ con contraseña ‘pwd3’

CREATE USER user3 IDENTIFIED BY 'pwd3';

--d)	Crea el usuario ‘user4’ con contraseña ‘pwd4’

CREATE USER user4 IDENTIFIED BY  'pwd4';

--e)	Borra el usuario ‘user4’
DROP USER user4;

f)	Cambia el nombre del ‘user2’ a ‘admindb’
RENAME USER user2 TO admindb;

g)	Cambia el password de ‘admindb’ a ‘pwdadmin’
SET PASSWORD = PASSWORD(‘pwdadmin’);


h)	Da privilegios totales (ALL + GRANT OPTION al usuario ‘admindb’) sobre todas las bases de datos (todas las bases de datos -> *.*).

GRANT ALL PRIVILEGES ON *.* TO 'admindb' 
WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 
MAX_CONNECTIONS_PER_HOUR 0 
MAX_UPDATES_PER_HOUR 0 
MAX_USER_CONNECTIONS 0;

i)	Da privilegios de SELECT, INSERT, UPDATE, DELETE al ‘user1’ sobre todas las bases de datos (todas las bases de datos -> *.*).
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'user1';

j)	Quita los permisos de INSERT, UPDATE, DELETE al ‘user1’

REVOKE INSERT, UPDATE, DELETE ON *.* FROM 'user1';

k)	Da permisos de SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP al ‘user3’.
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP ON *.* TO 'user3';


l)	Quita todos los permisos al ‘admindb
REVOKE ALL PRIVILEGES ON *.* FROM 'admindb';






