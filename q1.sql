
-- select p.name, p.surname, p.birthdate, sg.id, sg.form_year, s.scholarship, sp.name, f.name 
-- 	from person as p
--     join student as s
--     join student_group as sg
--     join speciality as sp
--     join faculty as f
--    order by s.student_group_id;
    
/**
	Вибірка студентів по групах, факультету та курсу
*/
    
SELECT p.name, p.surname, p.birthdate, 
	GetGroupName(sp.signature, sg.form_year) AS `group`, 
    (YEAR(NOW()) - sg.form_year) AS course, 
    s.scholarship, 
    CONCAT(f.name, " факультет") as faculty
		FROM student as s 
		JOIN student_group AS sg ON s.student_group_id = sg.id
		JOIN speciality AS sp ON sg.speciality_id = sp.id
		JOIN faculty AS f ON sp.faculty_id = f.id
		JOIN person AS p ON s.person_id = p.id
    ORDER BY s.scholarship DESC;

/**
Дані про студентів груп за статтю та середня кількість дітей для статті по групі
*/

SELECT p.gender AS gender, 
	COUNT(*) as count, 
    GetGroupName(sp.signature, sg.form_year) AS `group`, 
    FORMAT(AVG(p.children),2) AS children_avg, 
    FORMAT(AVG(YEAR(NOW()) - YEAR(p.birthdate)),0) AS age_avg
		FROM student as s 
		JOIN student_group AS sg ON s.student_group_id = sg.id
		JOIN speciality AS sp ON sg.speciality_id = sp.id
		JOIN faculty AS f ON sp.faculty_id = f.id
		JOIN person AS p ON s.person_id = p.id
    GROUP BY p.gender, `group`
UNION SELECT NULL, COUNT(*), NULL, FORMAT(AVG(children),2), FORMAT(AVG(YEAR(NOW()) - YEAR(p1.birthdate)),0)
    FROM student AS s1
    JOIN person AS p1 ON s1.person_id = p1.id;
    
/**
Дані про студентів за призначеною стипендією
*/

SELECT COUNT(*) as count, 
	GetGroupName(sp.signature, sg.form_year) AS `group`,
    FORMAT(AVG(s.scholarship), 2) AS avg_scholarship
		FROM student as s 
		JOIN student_group AS sg ON s.student_group_id = sg.id
		JOIN speciality AS sp ON sg.speciality_id = sp.id
		JOIN faculty AS f ON sp.faculty_id = f.id
		JOIN person AS p ON s.person_id = p.id
    WHERE s.scholarship > 0
    GROUP BY `group`
UNION SELECT COUNT(*) as count, CONCAT(sp.signature, "-", sg.form_year % 100) AS `group`, 0.0
	FROM student as s 
    JOIN student_group AS sg ON s.student_group_id = sg.id
    JOIN speciality AS sp ON sg.speciality_id = sp.id
    JOIN faculty AS f ON sp.faculty_id = f.id
    JOIN person AS p ON s.person_id = p.id
    WHERE s.scholarship = 0
    GROUP BY `group`
    ORDER BY `group` ASC, avg_scholarship DESC
    
