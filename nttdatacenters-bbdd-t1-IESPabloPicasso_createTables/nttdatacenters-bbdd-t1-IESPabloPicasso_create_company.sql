-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de tabla para Compañias
CREATE TABLE Company (
    company_id int primary key auto_increment,
    name varchar(30) not null,
    headquarter varchar(20),
    field varchar(40)
);