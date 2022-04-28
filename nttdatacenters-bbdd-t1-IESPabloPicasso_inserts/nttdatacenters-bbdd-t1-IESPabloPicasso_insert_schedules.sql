-- Utilización de la base de datos Education
use education;

-- Inserción de los Horarios
insert into schedules(high_school_id, grade_id, start_date, end_date, start_hour, end_hour, days)
values
	('1', '1', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Miercoles, Jueves, Viernes'),
    ('1', '2', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Jueves, Viernes'),
    ('2', '1', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Martes, Miercoles, Jueves'),
    ('2', '2', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Miercoles, Jueves'),
    ('3', '1', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Miercoles, Jueves, Viernes'),
    ('3', '2', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Miercoles, Jueves, Viernes'),
    ('4', '1', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Lunes, Martes, Miercoles'),
    ('4', '2', '2022-03-19', '2022-06-03', '8:00', '14:00', 'Lunes, Martes');