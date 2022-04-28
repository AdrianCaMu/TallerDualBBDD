-- Utilización de la base de datos Education
use education;

-- Inserción de los Estudiantes
insert into students(nif, name, email, phone_number, high_school)
values
	('55555555E', 'Pedro Perez', 'pedroperez@gmail.com', '655555555', '1'),
    ('66666666F', 'Marta Madroño', 'martamadroño@mail.com', '666666666', '2'),
    ('77777777G', 'Paula Polar', 'paulapolar@gmail.com', '677777777', '3'),
    ('88888888H', 'Isabel Sacristan', 'isabelsacri@gmail.com', '688888888', '4');