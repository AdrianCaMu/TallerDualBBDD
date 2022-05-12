-- Utilización de la base de datos Education
use education;

-- Inserción de los Entrenadores
Insert into trainer(nif, name, email, phone_number, company)
values
	('11111111A', 'Juan Alejandro Tellez Rubio', 'juan.alejandro.tellez.rubio@everis.nttdata.com', '611111111', 1),
	('22222222B', 'Maria Perez Ruiz', 'maria.perez.ruiz@accenture.com', '622222222', 2),
	('33333333C', 'Paco Martinez Gonzalez', 'paco.martinez.gonzalez@viewnext.com', '633333333', 3),
	('44444444D', 'Sofía Garrido Doñana', 'sofia.garrido.doñana@indra.com', '644444444', 4);