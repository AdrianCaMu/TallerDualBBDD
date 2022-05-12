DELIMITER //
/*Procedimiento en el que se van ha sacar dos listas de las asignaturas de cada año*/
CREATE PROCEDURE CREATESUBJECTLISTFIRST (INOUT SUBJECTLISTFIRST VARCHAR(4000), INOUT SUBJECTLISTSECOND VARCHAR(4000))
BEGIN
	/*Variable que se usará para saber el final de cada cursor*/
	DECLARE FIN INTEGER DEFAULT 0;
    /*Variable en el que se va a almacenar el nombre de cada asignatura*/
	DECLARE NOMBRE VARCHAR(200) DEFAULT "";
    
    /*Cursor de loas asignaturas de primero*/
    DECLARE CURSUBJECTFIRST
		cursor for
			SELECT NAME FROM SUBJECT WHERE GRADE=1;
            
    /*Cursor de loas asignaturas de segundo*/        
	DECLARE CURSUBJECTSECOND
		cursor for
			SELECT NAME FROM SUBJECT WHERE GRADE=2;
    
    /*Con este handler haremos que FIN se ponga a 1 cuando ya no se encuentren más elementos de los cursores*/
	DECLARE CONTINUE HANDLER
    FOR NOT FOUND SET FIN=1;
    
    /*Se abre el cursor de las asignaturas de primero*/
    OPEN CURSUBJECTFIRST;
    
    /*Bucle con el que se va a recorrer el cursor y concatenar los nombres de las asignaturas en la variable lista*/
    bucleprimero: loop
		FETCH CURSUBJECTFIRST INTO NOMBRE;
        if fin = 1 then
			leave bucleprimero;
		end if;
        SET SUBJECTLISTFIRST = CONCAT(NOMBRE,'; ',SUBJECTLISTFIRST);
	END loop;
    
    /*Se cierra el cursor*/
    CLOSE CURSUBJECTFIRST;
    
    /*Se reinicia la variable FIN a 0*/
    SET FIN=0;
    
	/*Se abre el cursor de las asignaturas de segundo*/
    OPEN CURSUBJECTSECOND;
    
    /*Bucle con el que se va a recorrer el cursor y concatenar los nombres de las asignaturas en la variable lista*/
    buclesegundo: loop
		FETCH CURSUBJECTSECOND INTO NOMBRE;
        if fin = 1 then
			leave buclesegundo;
		end if;
        SET SUBJECTLISTSECOND = CONCAT(NOMBRE,'; ',SUBJECTLISTSECOND);
	END loop;
    
    /*Se cierra el cursor*/
    CLOSE CURSUBJECTSECOND;
    
END//
DELIMITER ;
    