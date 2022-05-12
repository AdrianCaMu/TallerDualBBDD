#triggers para actualizar la tabla logs cada vez que se inserta, modifica o elimina un estudiante de la tabla students
use education;

#creamos una tabla logTable para guardar los datos de las instrucciones que realizamos en la tabla students
create table if not exists LogTable(
	id int not null auto_increment primary key,
    log_type varchar(20),
    tableName varchar(40),
    student_nif char(9),
    log_date date
);

DELIMITER $$

#cada vez que se inserta un nuevo estudiante guardamos un log 
CREATE TRIGGER after_students_insert
AFTER INSERT
ON students FOR EACH ROW
BEGIN
    insert into LogTable(log_type, tableName, student_nif, log_date)
    values('INSERT', 'STUDENTS', new.nif, curdate());
END $$

#cada vez que se actualiza un estudiante guardamos un log 
CREATE TRIGGER after_students_update
AFTER UPDATE
ON students FOR EACH ROW
BEGIN
    insert into LogTable(log_type, tableName, student_nif, log_date)
    values('UPDATE', 'STUDENTS', new.nif, curdate());
END $$

#cada vez que se elimina un estudiante guardamos un log 
CREATE TRIGGER after_students_delete
AFTER DELETE
ON students FOR EACH ROW
BEGIN
    insert into LogTable(log_type, tableName, student_nif, log_date)
    values('DELETE', 'STUDENTS', old.nif, curdate());
END $$

DELIMITER ;