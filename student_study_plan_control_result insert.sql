use db_coursework;

-- усі роботи з контролю навчанння студентів

SELECT p.name, p.surname, GetGroupName(sp.signature, sg.form_year), sp.name, sct.name, pl.course, pl.semester
	FROM student AS s
    JOIN person AS p ON p.id = s.person_id
    JOIN student_group AS sg ON sg.id = s.student_group_id
    JOIN speciality AS sp ON sg.speciality_id = sp.id
    JOIN plan AS pl ON pl.speciality_id = sp.id
    JOIN discipline AS d ON d.id = pl.discipline_id
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN study_control_type AS sct ON sct.id = psc.study_control_type_id
    LIMIT 10000;
    
-- контроль навчання

SELECT p.name, p.surname, GetGroupName(sp.signature, sg.form_year), sp.name, sct.name, pl.course AS course, pl.semester AS semester, CONCAT(tp.name, " ", tp.surname) AS teacher
	FROM student AS s
    JOIN person AS p ON p.id = s.person_id
    JOIN student_group AS sg ON sg.id = s.student_group_id
    JOIN speciality AS sp ON sg.speciality_id = sp.id
    JOIN plan AS pl ON pl.speciality_id = sp.id
    JOIN discipline AS d ON d.id = pl.discipline_id
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN study_control_type AS sct ON sct.id = psc.study_control_type_id
    JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
    JOIN cathedra_plan_assignment AS cpa ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN person AS tp ON tp.id = ct.person_id
    LIMIT 10000;

-- генерація результатів контролю 2-5 курсів

SELECT s.id AS student_id, ct.id AS cathedra_teacher_id, psc.id AS plan_study_control_id, FLOOR(RAND()*4) + 2 AS score
	FROM student AS s
    JOIN person AS p ON p.id = s.person_id
    JOIN student_group AS sg ON sg.id = s.student_group_id
    JOIN speciality AS sp ON sg.speciality_id = sp.id
    JOIN plan AS pl ON pl.speciality_id = sp.id
    JOIN discipline AS d ON d.id = pl.discipline_id
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN study_control_type AS sct ON sct.id = psc.study_control_type_id
    JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
    JOIN cathedra_plan_assignment AS cpa ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN person AS tp ON tp.id = ct.person_id
    WHERE pl.course >=2 AND (pl.year - sg.form_year) = pl.course
    LIMIT 10000;
    
    
-- додавання результатів для груп 2-5 курсів 

START TRANSACTION;

INSERT INTO student_study_plan_control_result (student_id, cathedra_teacher_id, plan_study_control_id, score)
SELECT s.id AS student_id, ct.id AS cathedra_teacher_id, psc.id AS plan_study_control_id, FLOOR(RAND()*4) + 2 AS score
	FROM student AS s
    JOIN person AS p ON p.id = s.person_id
    JOIN student_group AS sg ON sg.id = s.student_group_id
    JOIN speciality AS sp ON sg.speciality_id = sp.id
    JOIN plan AS pl ON pl.speciality_id = sp.id
    JOIN discipline AS d ON d.id = pl.discipline_id
    JOIN plan_study_control AS psc ON psc.plan_id = pl.id
    JOIN study_control_type AS sct ON sct.id = psc.study_control_type_id
    JOIN cathedra_plan_charge AS cpc ON cpc.plan_id = pl.id
    JOIN cathedra_plan_assignment AS cpa ON cpc.id = cpa.cathedra_plan_charge_id
    JOIN cathedra_teacher AS ct ON ct.id = cpa.cathedra_teacher_id
    JOIN person AS tp ON tp.id = ct.person_id
    WHERE pl.course >=2 AND (pl.year - sg.form_year) = pl.course
    LIMIT 10000;

COMMIT;