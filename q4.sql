use db_coursework;

-- катедри, що проводять заняття в групах згідно річного плана

SELECT GetGroupName(sp.signature, sg.form_year) AS group_signature, 
	c.name AS cathedra_name, pl.year - sg.form_year AS course, 
    pl.semester AS semester
	FROM student_group AS sg
		JOIN plan AS pl ON pl.speciality_id = sg.speciality_id
		JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
		JOIN cathedra AS c ON c.id = cpc.cathedra_id
		JOIN speciality AS sp ON sp.id = sg.speciality_id
	WHERE pl.course = pl.year - sg.form_year;

-- катедри фізичного факультету що проводять заняття в першому семетрі поточного року по групах

SELECT GetGroupName(sp.signature, sg.form_year) AS group_signature, 
	f.name AS faculty, 
    c.name AS cathedra_name, pl.year - sg.form_year AS course, 
    pl.semester AS semester
	FROM student_group AS sg
		JOIN plan AS pl ON pl.speciality_id = sg.speciality_id
		JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
		JOIN cathedra AS c ON c.id = cpc.cathedra_id
		JOIN faculty AS f ON f.id = c.faculty_id
		JOIN speciality AS sp ON sp.id = sg.speciality_id
	WHERE pl.course = pl.year - sg.form_year
    AND semester = 1
    AND f.id = 2;
