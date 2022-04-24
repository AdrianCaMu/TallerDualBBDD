use education;

-- SIMPLES

-- Nota media de todos los cursos
select avg(final_mark) as 'Nota media'
from courses;

-- Información del instituto con el nombre de IES PABLO PICASSO y CESUR SEVILLA
select * from high_school
where name = 'IES PABLO PICASSO' or name = 'CESUR SEVILLA';

-- Nombres de las asignaturas de primero.
select name as 'Asignaturas'
from subject
where grade like '1';

-- Nombre del instituto cuando es privado y pertenece a la provincia de Sevilla.
select name as 'Instituto'
from high_school
where type = 'private' and province = 'SEVILLA';

-- Cuantos formadores hay en el primer curso
select count(trainer) as 'Numero de formadores del primer curso'
from teach
where grade = '1';

-- Todos los estudiantes que no pertenezcan al intituto 4
select * from students
where high_school != 4;


-- MEDIAS

-- Sacar las asignaturas por orden descendente
select * from subject
order by grade desc;

-- Sacar el numero de formadores, cuando haya mas de tres formadores contando todos los centros
select count(name) as 'Numero formadores'
from trainer 
having count(name) > 3;

-- Cuenta cuantos intitutos tienen horarios, ordenados por el curso.
select count(grade_id) from schedules 
group by grade_id;

-- Toda la información de los horarios del curso, con la cantidad de días que dura a cada instituto el curso, ordenados por el grado del curso.
select *, datediff(end_date, start_date) 'Duración de días del curso'
from schedules
order by grade_id;


-- COMPLEJAS

-- Nombre y horario de todos los intitutos de la provincia de Málaga, cuando tengan clase los miércoles.
select high_school.name 'Instituto',  schedules.days 'Horario'
from schedules
inner join high_school on schedules.high_school_id = high_school.high_school_id
where schedules.days like '%Miercoles%' and high_school.province = 'Malaga';

-- Todos los nombres de los estudiantes que han sacado más de un 5 en la nota del curso.
select students.name 'Alumno', courses.final_mark 'Nota Final'
from students
inner join courses on students.nif = courses.student_nif
where courses.final_mark > 5
group by students.name;

-- Nombre de los formadores y el nombre de cada empresa a la que trabajan, junto el lugar de su sede.
select trainer.name 'Formador', company.name 'Empresa', company.headquarter 'Sede'
from trainer
left join company on trainer.company = company.company_id;

-- Nombre de los estudiantes, con el nombre de la asignatura que ha cursado junto a su nota.
select students.name 'Alumno', subject.name 'Asignatura', courses.final_mark 'Nota final'
from students
inner join courses on students.nif = courses.student_nif
inner join subject on courses.subject_id = subject.subject_id;


