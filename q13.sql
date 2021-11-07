use db_coursework;

-- навантаження викладачів катедр по дисциплінам

SELECT CONCAT(pt.name, " ", pt.surname) AS teacher,  
	cat.name AS cathedra, 
    pl.hours, 
    d.name AS discipline, pl.course, 
    pl.semester, 
    GetGroupName(sp.signature, sg.form_year) AS `group`
	FROM cathedra_plan_assignment AS cpa
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN cathedra_plan_charge AS cpc ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN cathedra AS cat ON cat.id = cpc.cathedra_id
    JOIN plan AS pl ON pl.id = cpc.plan_id
    JOIN discipline AS d ON d.id = pl.discipline_id
    JOIN speciality AS sp ON sp.id = pl.speciality_id
    JOIN person as pt ON pt.id = ct.person_id
    JOIN student_group AS sg ON sg.speciality_id = sp.id
UNION SELECT "Загалом, та по викладачах:", NULL, SUM(pl.hours), NULL, NULL, NULL, NULL
	FROM cathedra_plan_assignment AS cpa
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN cathedra_plan_charge AS cpc ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN plan AS pl ON pl.id = cpc.plan_id
    JOIN person as pt ON pt.id = ct.person_id
    GROUP BY pl.year
UNION SELECT CONCAT(pt.name, " ", pt.surname) AS teacher, NULL, SUM(pl.hours), 
	NULL, NULL, NULL, NULL
	FROM cathedra_plan_assignment AS cpa
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN cathedra_plan_charge AS cpc ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN plan AS pl ON pl.id = cpc.plan_id
    JOIN person as pt ON pt.id = ct.person_id
    GROUP BY ct.id
    LIMIT 1000;