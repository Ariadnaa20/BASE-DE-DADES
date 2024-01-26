CREATE DATABASE IF NOT EXISTS test1;



CREATE TABLE persona(
    id_persona INT UNSIGNED AUTO_INCREMENT,
    data_naixement DATE,
    nombre VARCHAR(50),
    cognom VARCHAR(50),
    PRIMARY KEY(id_persona)
);

CREATE TABLE assignatura(
    nom_assignatura INT UNSIGNED AUTO_INCREMENT,
    descripcio VARCHAR(50),
    PRIMARY KEY(nom_assignatura);
)

CREATE TABLE assignatura_persona(
    pk_assignatura VARCHAR(50),
    pk_persona INT UNSIGNED,
    PRIMARY KEY(pk_assignatura, pk_persona);
    FORGEIN KEY(pk_assignatura) REFERENCES assignatura(nom_assignatura),
    FORGEIN KEY(pk_persona) REFERENCES persona(id_persona)
);

// pasos:
creem primer la base de dades
despres començem a crear taules
Si le doy a SQL me deja crear una tabla pero siempre dentro de la base de datos