use db_coursework;

-- генерація дипломних робіт для 4 курсу

INSERT into diploma (speciality_id, cathedra_teacher_id, student_id, score)
SELECT sp.id AS speciality_id, 
	(
		SELECT randct.id 
			FROM (
				SELECT 
					ct1.id AS id, 
                    RAND() AS rnd 
						FROM cathedra_teacher AS ct1
                        JOIN cathedra AS c1 ON c1.id = ct1.cathedra_id
					WHERE c1.faculty_id =f.id AND ct1.teacher_rank_id >= 14 ORDER BY rnd DESC
            ) AS randct LIMIT 1
    ) AS cathedra_teacher_id,
    s.id AS student_id,
		FLOOR(RAND()*3) + 3 AS score
		FROM speciality AS sp
		JOIN student_group AS sg ON sp.id = sg.speciality_id AND YEAR(NOW()) - sg.form_year = 4
		JOIN student AS s ON s.student_group_id = sg.id
		JOIN faculty AS f ON f.id = sp.faculty_id
        WHERE RAND() > 0.8
    LIMIT 1000;
    
INSERT into diploma (speciality_id, cathedra_teacher_id, student_id, score)
SELECT sp.id AS speciality_id, 
	(
		SELECT randct.id 
			FROM (
				SELECT 
					ct1.id AS id, 
                    RAND() AS rnd 
						FROM cathedra_teacher AS ct1
                        JOIN cathedra AS c1 ON c1.id = ct1.cathedra_id
					WHERE c1.faculty_id =f.id AND ct1.teacher_rank_id >= 14 ORDER BY rnd DESC
            ) AS randct LIMIT 1
    ) AS cathedra_teacher_id,
    s.id AS student_id,
		NULL AS score
		FROM speciality AS sp
		JOIN student_group AS sg ON sp.id = sg.speciality_id AND YEAR(NOW()) - sg.form_year = 4
		JOIN student AS s ON s.student_group_id = sg.id
		JOIN faculty AS f ON f.id = sp.faculty_id
        WHERE s.id NOT IN (SELECT student_id from diploma)
    LIMIT 1000;
    
UPDATE diploma d
	JOIN (SELECT CONCAT("Діпломна робота ", d1.id) AS theme, d1.id AS id FROM diploma d1) d2 ON d.id = d2.id
    SET d.theme = d2.theme;