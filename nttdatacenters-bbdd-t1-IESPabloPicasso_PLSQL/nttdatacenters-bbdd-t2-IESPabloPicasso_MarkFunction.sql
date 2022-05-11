

DELIMITER $$
USE `education`$$
-- Función que devuelve una cadena de texto con la nota  en cierta asignatura de un alumno a partir de un id de asignatura y alumno.
CREATE DEFINER=`root`@`localhost` FUNCTION `text_mark`(f_student_id char(9), f_subject_id char(10)) RETURNS varchar(30) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	-- Declaración de variables para almacenar nota como texto y como int.
	DECLARE v_marktxt VARCHAR(30);
    DECLARE v_mark INT;
    -- Consulta para almacenar la nota como int 
    SELECT final_mark 
    INTO v_mark 
    FROM courses 
    WHERE student_nif = f_student_id AND subject_id = f_subject_id;
	-- Secuencia de condicionales que dan un valor u otro a la variable en función de la nota numérica.
	IF v_mark < 5 THEN
		SET v_marktxt = 'Suspenso';
	ELSEIF v_mark >= 5 AND v_mark < 6 THEN
		SET v_marktxt = 'Suficiente';
	ELSEIF v_mark >= 6 AND v_mark < 7 THEN
		SET v_marktxt = 'Bien';
	ELSEIF v_mark >= 7 AND v_mark < 9 THEN
		SET v_marktxt = 'Notable';
	ELSE
		SET v_marktxt = 'Sobresaliente';
	END IF;
RETURN v_marktxt;
END$$

DELIMITER ;
;

-- Comprobación.
SELECT text_mark('55555555E', '0373');
SELECT text_mark('55555555E', '0493');
