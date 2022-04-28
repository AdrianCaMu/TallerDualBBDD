-- Utilización de la base de datos Education
use education;

-- Inserción de los Institutos
insert into high_school(high_school_id, name, province, address, type)
values
	('1', 'IES PABLO PICASSO', 'MALAGA', 'CALLE NOLOSE', 'public'),
    ('2', 'CESUR MALAGA', 'MALAGA', 'CALLE TAMPOCO', 'private'),
    ('3', 'CESUR SEVILLA', 'SEVILLA', 'CALLE NIIDEA', 'private'),
    ('4', 'IES VEDRUNA', 'SEVILLA', 'CALLE YOQUESE', 'public');