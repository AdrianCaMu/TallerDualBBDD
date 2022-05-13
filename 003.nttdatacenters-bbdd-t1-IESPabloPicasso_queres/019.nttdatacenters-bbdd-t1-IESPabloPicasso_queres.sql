-- Utilización de la base de datos Education.
USE Education;

-- ----------------------------- --
-- Creación de consultas SIMPLES --
-- ----------------------------- --

-- Consulta la nota media de todos los cursos.
select avg(final_mark) as 'Nota media'
from courses;

-- Consulta la información del instituto con el nombre de IES PABLO PICASSO y/o CESUR SEVILLA.
select * from high_school
where name = 'IES PABLO PICASSO' or name = 'CESUR SEVILLA';

-- Consulta los nombres de las asignaturas de primer grado.
select name as 'Asignaturas'
from subject
where grade like '1';

-- Consulta el nombre del instituto cuando es privado y pertenece a la provincia de Sevilla.
select name as 'Instituto'
from high_school
where type = 'private' and province = 'SEVILLA';

-- Consulta cuantos formadores hay en el primer grado.
select count(trainer) as 'Numero de formadores del primer curso'
from teach
where grade = '1';

-- Consulta que muestra todos los estudiantes que no pertenezcan al intituto 4
select * from students
where high_school != 4;

-- ---------------------------- --
-- Creación de consultas MEDIAS --
-- ---------------------------- --

-- Consulta que muestra todas las asignaturas por orden descendente
select * from subject
order by grade desc;

-- Consulta que saca el numero de formadores, cuando haya mas de tres formadores contando todos los centros
select count(name) as 'Numero formadores'
from trainer 
having count(name) > 3;

-- Consulta que cuenta cuantos intitutos tienen horarios, ordenados por el curso.
select count(grade_id) from schedules 
group by grade_id;

-- Consulta toda la información de los horarios del curso, con la cantidad de días que dura a cada instituto el curso, ordenados por el grado del curso.
select *, datediff(end_date, start_date) 'Duración de días del curso'
from schedules
order by grade_id;

-- ------------------------------- --
-- Creación de consultas COMPLEJAS --
-- ------------------------------- --

-- Consulta el nombre y horario de todos los intitutos de la provincia de Málaga, cuando tengan clase los miércoles.
select high_school.name 'Instituto',  schedules.days 'Horario'
from schedules
right join high_school on schedules.high_school_id = high_school.high_school_id
where schedules.days like '%Miercoles%' and high_school.province = 'Malaga';

-- Consulta que muestra el nombre de todos los estudiantes que han sacado más de un 5 en la nota del curso.
select students.name 'Alumno', courses.final_mark 'Nota Final'
from students
inner join courses on students.nif = courses.student_nif
where courses.final_mark > 5
group by students.name;

-- Consulta el nombre de los formadores y el nombre de cada empresa para la que trabajan, junto el lugar de su sede.
select trainer.name 'Formador', company.name 'Empresa', company.headquarter 'Sede'
from trainer
left join company on trainer.company = company.company_id;

-- Consulta el nombre de los estudiantes y el nombre de la asignatura que ha cursado junto a su nota.
select students.name 'Alumno', subject.name 'Asignatura', courses.final_mark 'Nota final'
from students
inner join courses on students.nif = courses.student_nif
inner join subject on courses.subject_id = subject.subject_id;


