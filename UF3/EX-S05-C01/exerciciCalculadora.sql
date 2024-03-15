--CALCULADORA ARIADNA
CREATE OR REPLACE PROCEDURE CalculadoraAriadna(
    numero1 IN NUMBER,
    numero2 IN NUMBER,
    operacion IN CHAR,
    resultado OUT NUMBER
) AS
BEGIN
    CASE operacion
        WHEN '+' THEN
            resultado := numero1 + numero2;
        WHEN '-' THEN
            resultado := numero1 - numero2;
        WHEN '*' THEN
            resultado := numero1 * numero2;
        WHEN '/' THEN
            IF numero2 = 0 THEN
                DBMS_OUTPUT.PUT_LINE('No se puede dividir por cero.'); --per si es un nu 0 
                resultado := NULL;
            ELSE
                resultado := numero1 / numero2;
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Operación no válida.');
            resultado := NULL;
    END CASE;
END CalculadoraAriadna;
/


--CALL PER SI ESTA GUARDAT

DECLARE
    num1 NUMBER := 8;
    num2 NUMBER := 4;
    oper CHAR := '*';
    res NUMBER;
BEGIN
    -- Llamada al procedimiento almacenado
    CalculadoraAriadna(num1, num2, oper, res);
    IF res IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('El resultado es: ' || res);
    END IF;
END;
/
