-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Asignatura
CREATE TABLE Subject (
    subject_id char(10) primary key,
    name varchar(80) not null,
    grade char(10),
    foreign key (grade) references Grade(grade_id)
);