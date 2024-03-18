--ARIADNA PASCUAL

/*10. Exercicis de loops i for's: A la BD northwind, fer un bucle que recorri tota la taula Categories i busqui si hi ha una categoria de nom "Seafood". (fer servir la BBDD Northwind) fer sense cursors)

Passos marcats:

     a) Fer loop de 1 a 10 o amb núm total de categories
     b) Buscar nom categoria on l'id = contador de loop
     c) Verificar si la la categoria = seafood
     d) En cas afirmatiu, mostrar missatge, sinó seguir buscant*/

DELIMITER $$

CREATE PROCEDURE BuscarCategoriaSeafoodAmbHandler()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE totalCategories INT;
    DECLARE categoryName VARCHAR(255);
    DECLARE notFound INT DEFAULT FALSE;
    
    -- Estableix el handler per continuar quan una cerca no retorna resultats
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFound = TRUE;
    
    -- Determinar el nombre total de categories o 10, el que sigui més petit
    SELECT LEAST(COUNT(*), 10) INTO totalCategories FROM Categories;
     --    Això és perquè volem limitar la busqueda a un màxim de 10 categories, però si hi ha menys de 10 categories en total,
    -- llavors només buscarem dins el nombre real de categories existents. La funció LEAST et torna el valor més petit
    -- dels seus arguments, assegurant que no superarem el límit establert per aquesta.
    
    WHILE i <= totalCategories DO
        -- Intentar trobar la categoria amb l'ID actual
        SET notFound = FALSE;
        SELECT CategoryName INTO categoryName FROM Categories WHERE CategoryID = i;
        
        IF notFound = FALSE AND categoryName = 'Seafood' THEN
            SELECT CONCAT('Categoria "Seafood" trobada amb ID ', i) AS Missatge;
            LEAVE;
        END IF;
        
        -- Incrementar el contador per a la següent iteració
        SET i = i + 1;
    END WHILE;
    
    -- Si s'acaba el bucle sense trobar la categoria, imprimir un missatge
    IF notFound = TRUE THEN
        SELECT 'Categoria "Seafood" no trobada dins dels primers ' , totalCategories, ' categories.' AS Missatge;
    END IF;
END $$

DELIMITER ;


CALL BuscarCategoriaSeafood();

