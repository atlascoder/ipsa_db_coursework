use db_coursework;

--  результати контролю навчання студентів

SELECT CONCAT(p.name, " ", p.surname) AS student, 
	GetGroupName(sp.signature, sg.form_year) AS `group`, 
    pl.course AS course, 
    pl.semester AS semester, 
    d.name AS discipline, 
    scr.score AS score, 
    CONCAT(p.name, " ", p.surname) AS teacher, 
    cat.name AS cathedra
	FROM plan AS pl 
    JOIN plan_study_control AS psc ON psc.id = pl.id
    JOIN study_control_type AS sct ON psc.study_control_type_id = sct.id
    JOIN speciality AS sp ON sp.id = pl.speciality_id
    JOIN student_group AS sg ON sg.speciality_id = sp.id
    JOIN student AS s ON s.student_group_id = sg.id
    JOIN person AS p ON p.id = s.person_id
    JOIN student_study_plan_control_result AS scr ON scr.student_id = s.id
    JOIN discipline AS d ON pl.discipline_id = d.id
    JOIN cathedra_teacher AS ct ON ct.id = scr.cathedra_teacher_id
    JOIN person AS tp ON ct.person_id = tp.id
    JOIN cathedra AS cat ON cat.id = ct.cathedra_id;
    
--  результати контролю навчання студентів групи МА-19 на другому курсі начання

SELECT CONCAT(p.name, " ", p.surname) AS student, 
	GetGroupName(sp.signature, sg.form_year) AS `group`, 
	pl.course AS course, 
    pl.semester AS semester, 
    d.name AS discipline, 
    scr.score AS score, 
    CONCAT(p.name, " ", p.surname) AS teacher, 
    cat.name AS cathedra
	FROM plan AS pl 
    JOIN plan_study_control AS psc ON psc.id = pl.id
    JOIN study_control_type AS sct ON psc.study_control_type_id = sct.id
    JOIN speciality AS sp ON sp.id = pl.speciality_id
    JOIN student_group AS sg ON sg.speciality_id = sp.id
    JOIN student AS s ON s.student_group_id = sg.id
    JOIN person AS p ON p.id = s.person_id
    JOIN student_study_plan_control_result AS scr ON scr.student_id = s.id
    JOIN discipline AS d ON pl.discipline_id = d.id
    JOIN cathedra_teacher AS ct ON ct.id = scr.cathedra_teacher_id
    JOIN person AS tp ON ct.person_id = tp.id
    JOIN cathedra AS cat ON cat.id = ct.cathedra_id
	WHERE sp.signature = 'МА' AND sg.form_year = 2019 AND pl.course = 2;