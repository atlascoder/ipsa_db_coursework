use db_coursework;

-- діпломні роботи по катедрах

SELECT cat.name AS cathedra, 
	CONCAT(tp.name, " ", tp.surname) AS teacher_name, 
    CONCAT(sp.name, " ", sp.surname) AS student_name, 
    s.name AS speciality, d.theme AS dimploma_theme
	FROM diploma AS d
    JOIN speciality AS s ON s.id = d.speciality_id
    JOIN cathedra_teacher AS ct ON ct.id = d.cathedra_teacher_id
    JOIN cathedra AS cat ON cat.id = ct.cathedra_id
    JOIN person AS tp ON tp.id = ct.person_id
    JOIN student AS st ON st.id = d.student_id
    JOIN person AS sp ON sp.id = st.person_id;

-- діпломні роботи по катеді Вірусології

SELECT CONCAT(tp.name, " ", tp.surname) AS teacher_name, 
	CONCAT(sp.name, " ", sp.surname) AS student_name, 
    s.name AS speciality, d.theme AS dimploma_theme
	FROM diploma AS d
    JOIN speciality AS s ON s.id = d.speciality_id
    JOIN cathedra_teacher AS ct ON ct.id = d.cathedra_teacher_id
    JOIN cathedra AS cat ON cat.id = ct.cathedra_id
    JOIN person AS tp ON tp.id = ct.person_id
    JOIN student AS st ON st.id = d.student_id
    JOIN person AS sp ON sp.id = st.person_id
    WHERE cat.name = 'Вірусології';


