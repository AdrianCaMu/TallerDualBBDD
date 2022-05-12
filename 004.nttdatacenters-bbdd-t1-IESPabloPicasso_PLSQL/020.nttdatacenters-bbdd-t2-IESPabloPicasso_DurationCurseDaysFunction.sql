use education;

-- Funcion que devuelve la duracion en dias de un curso, pasandole el id del curso y el id del instituto
DELIMITER $$
	CREATE FUNCTION `curse_days_duration`(h_id INT, g_id INT) 
    RETURNS VARCHAR(30) 
	DETERMINISTIC
	BEGIN
	   -- Declaro variable para almacenar la duracion del curso
		declare v_duration INT;
        
	-- Si el id del instituto y el id del grado no es 0
	IF (h_id != 0 AND g_id != 0) THEN

		-- Saca la diferencia entre la fecha de inicio y de fin del curso, 
        -- y lo almacena en la variable v_duration que hemos declarado anteriormente
		SELECT DATEDIFF(schedules.end_date, schedules.start_date)
		INTO v_duration
		FROM schedules
		WHERE high_school_id = h_id AND grade_id = g_id;
		
        -- Devuelve la duracion del curso
		RETURN concat(v_duration, ' días');
	ELSE
		RETURN null;
    END IF;
END$$
DELIMITER ;

-- Llamo a la funcion
select curse_days_duration(1, 1);

