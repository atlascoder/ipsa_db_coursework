use db_coursework;

-- викладачи, що проводять різні види занятть по групах

SELECT CONCAT(p.name, " ", p.surname) AS teacher_name,
	d.name AS discipline,
    GetGroupName(sp.signature, sg.form_year) AS group_signature,
    pl.year - sg.form_year AS course,
    pl.semester AS semester,
    swt.name AS studying_class
	FROM student_group AS sg
		JOIN plan AS pl ON pl.speciality_id = sg.speciality_id
		JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
		JOIN cathedra AS c ON c.id = cpc.cathedra_id
		JOIN speciality AS sp ON sp.id = sg.speciality_id
		JOIN cathedra_plan_assignment AS cpa ON cpa.cathedra_plan_charge_id = cpc.id
		JOIN cathedra_teacher AS ct ON cpa.cathedra_teacher_id = ct.id
		JOIN person AS p ON p.id = ct.person_id
		JOIN discipline AS d ON d.id = pl.discipline_id
		JOIN studying_work_type AS swt ON pl.studying_work_type_id = swt.id
	WHERE pl.course = pl.year - sg.form_year;

-- викладачі, що проводять заняття в групі ФР-18 (id = 8)

SELECT CONCAT(p.name, " ", p.surname) AS teacher_name,
	d.name AS discipline, 
    GetGroupName(sp.signature, sg.form_year) AS group_signature, 
    pl.year - sg.form_year AS course, 
    pl.semester AS semester, 
    cpa.hours AS hours, 
    swt.name AS studying_class
	FROM student_group AS sg
		JOIN plan AS pl ON pl.speciality_id = sg.speciality_id
		JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
		JOIN cathedra AS c ON c.id = cpc.cathedra_id
		JOIN speciality AS sp ON sp.id = sg.speciality_id
		JOIN cathedra_plan_assignment AS cpa ON cpa.cathedra_plan_charge_id = cpc.id
		JOIN cathedra_teacher AS ct ON cpa.cathedra_teacher_id = ct.id
		JOIN person AS p ON p.id = ct.person_id
		JOIN discipline AS d ON d.id = pl.discipline_id
		JOIN studying_work_type AS swt ON pl.studying_work_type_id = swt.id
	WHERE pl.course = pl.year - sg.form_year AND sg.id = 8;
