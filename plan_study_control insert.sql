use db_coursework;

-- генерація контролю начання в плані (іспит або залік)

START TRANSACTION;

INSERT INTO plan_study_control (study_control_type_id, plan_id)
	SELECT FLOOR(RAND() * 2) + 4 , p.id 
		FROM plan AS p 
        WHERE p.studying_work_type_id IN (1);
        
COMMIT;