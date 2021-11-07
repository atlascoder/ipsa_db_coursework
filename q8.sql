use db_coursework;

-- середні бали студентів

SELECT CONCAT(p.name, " ", p.surname) AS student, 
	pl.course AS course, pl.semester AS semester, 
    FORMAT(AVG(scr.score), 2) AS avg_score
	FROM plan AS pl
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN student_study_plan_control_result AS scr ON scr.plan_study_control_id = psc.id
    JOIN student AS st ON st.id = scr.student_id
    JOIN person AS p ON p.id = st.person_id
    GROUP BY st.id, pl.course, pl.semester;
    
-- відмінники 2 курсу
    
SELECT * FROM (
	SELECT CONCAT(p.name, " ", p.surname) AS student, 
		pl.course AS course, 
        pl.semester AS semester, 
        FORMAT(AVG(scr.score), 2) AS avg_score
		FROM plan AS pl
		JOIN plan_study_control AS psc ON psc.plan_id = pl.id
		JOIN student_study_plan_control_result AS scr ON scr.plan_study_control_id = psc.id
		JOIN student AS st ON st.id = scr.student_id
		JOIN person AS p ON p.id = st.person_id
    GROUP BY st.id, pl.course, pl.semester
) AS avs
	WHERE avs.avg_score = 5 AND avs.course = 2;