-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Horarios
CREATE TABLE Schedules (
	high_school_id char(10),
    grade_id char(10),
    start_date date,
    end_date date,
    start_hour varchar(10),
    end_hour varchar(10),
    days varchar(40),
    constraint pk_schedules primary key (high_school_id, grade_id),
    constraint fk_high_school foreign key (high_school_id) references High_School(high_school_id),
    constraint fk_grade_schedules foreign key (grade_id) references Grade(grade_id)
);