use db_coursework;

-- викладачі, що приймали іспити та середій бал

SELECT CONCAT(p.name, " ", p.surname) AS teacher, 
	pl.course AS course, 
	pl.semester AS semester, 
	FORMAT(AVG(scr.score), 2) AS avg_score
	FROM plan AS pl
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN student_study_plan_control_result AS scr ON scr.plan_study_control_id = psc.id
    JOIN cathedra_teacher AS ct ON ct.id = scr.cathedra_teacher_id
    JOIN person AS p ON p.id = ct.person_id
    GROUP BY ct.id, pl.course, pl.semester;
    
-- викладачі та оцінки 5

SELECT CONCAT(p.name, " ", p.surname) AS teacher, 
	pl.course AS course, 
	pl.semester AS semester, 
	COUNT(*) AS count
	FROM plan AS pl
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN student_study_plan_control_result AS scr ON scr.plan_study_control_id = psc.id AND scr.score = 5
    JOIN cathedra_teacher AS ct ON ct.id = scr.cathedra_teacher_id
    JOIN person AS p ON p.id = ct.person_id
    GROUP BY teacher, course, semester;
    

