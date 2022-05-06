-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Alumnos
CREATE TABLE Students (
    nif char(9) primary key,
    name varchar(30) not null,
    email varchar(60) not null,
    phone_number char(9),
    high_school char(10),
    foreign key (high_school) references High_School(high_school_id)
);