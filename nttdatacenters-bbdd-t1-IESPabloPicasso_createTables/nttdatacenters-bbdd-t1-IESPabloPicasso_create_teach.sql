-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Enseña
create table Teach (
	trainer char(9),
    grade char(10),
    constraint pk_teach primary key (trainer, grade),
    constraint fk_trainer foreign key (trainer) references Trainer(nif),
    constraint fk_grade foreign key (grade) references Grade(grade_id)
);