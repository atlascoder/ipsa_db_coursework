use db_coursework;

DELIMITER $$  
CREATE PROCEDURE GENERATE_PLAN()

BEGIN
	DECLARE a INT Default 1 ;
	simple_loop: LOOP         
		INSERT INTO plan (speciality_id, discipline_id, course, semester, studying_work_type_id, year, hours)
			SELECT FLOOR(RAND()* 8) + 1 AS speciality_id,
				FLOOR(RAND() * 17) + 1 AS discipline_id,
				FLOOR(RAND() * 5) + 1 AS course,
				FLOOR(RAND()*2) + 1 AS semester,
				FLOOR(RAND()*5) + 1 AS studying_work_type_id,
				2021 AS year,
				ROUND(RAND() * 400) * 4 AS hours;
		SET a=a+1;
		IF a=101 THEN
			LEAVE simple_loop;
		END IF;
	END LOOP simple_loop;
END $$

CALL `GENERATE_PLAN`();

DROP PROCEDURE IF EXISTS GENERATE_PLAN;
