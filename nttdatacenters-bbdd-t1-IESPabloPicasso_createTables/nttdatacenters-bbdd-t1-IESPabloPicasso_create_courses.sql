-- ----------------------------------------------------
-- Autor       : IES Pablo Picasso
-- Descripción : Trabajo Grupal - Script PL/SQL
-- ----------------------------------------------------

-- Creación de base de datos si no existe
CREATE DATABASE IF NOT EXISTS Education;

-- Utilización de la base de datos Education
USE Education;

-- Creación de la tabla Cursos
CREATE TABLE Courses (
	student_nif char(9),
    subject_id char(10),
    final_mark int check (final_mark >= 0 AND final_mark <= 10),
    constraint pk_courses primary key (student_nif, subject_id),
	constraint fk_student foreign key (student_nif) references Students(nif),
    constraint fk_module foreign key (subject_id) references Subject(subject_id)
);