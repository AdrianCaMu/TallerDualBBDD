-- Utilización de la base de datos Education
use education;

-- Inserción de los Institutos
insert into high_school(high_school_id, name, province, address, type)
values
	('1', 'IES PABLO PICASSO', 'MALAGA', 'Cam. Castillejos, 8', 'public'),
    ('2', 'CESUR MALAGA', 'MALAGA', 'C. Franz Liszt, 1', 'private'),
    ('3', 'CESUR SEVILLA', 'SEVILLA', 'Estadio Olímpico, Isla de La Cartuja', 'private'),
    ('4', 'IES VEDRUNA', 'SEVILLA', ' C. Espinosa y Cárcel, 21', 'public');