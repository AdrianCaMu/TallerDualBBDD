-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Instituto
CREATE TABLE High_School (
    high_school_id char(10) primary key,
    name varchar(30) not null,
    province varchar(30),
    address varchar(30),
    type varchar(20) check (type in ('public', 'private'))
);