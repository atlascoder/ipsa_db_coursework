use db_coursework;

SELECT * from sci_title;

-- перелік докторсіких та кандидитських робіт по катедрах

SELECT c.name AS cathedra_name, st.name AS title, 
	p.name AS name, p.surname AS surname, 
    psc.work_title AS work_title
	FROM person_sci_career AS psc
		JOIN person AS p ON p.id = psc.person_id
		JOIN cathedra_teacher AS ct ON p.id = ct.person_id
		JOIN cathedra AS c ON c.id = ct.cathedra_id
		JOIN sci_title AS st ON psc.sci_title_id = st.id
    WHERE psc.sci_title_id > 2;
    
-- перелік докторських та кандидитських робіт по катедрах

SELECT c.name AS cathedra_name, st.name AS title, COUNT(*)
	FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON c.id = ct.cathedra_id
		JOIN person_sci_career AS psc ON ct.person_id = psc.person_id
		JOIN sci_title AS st ON psc.sci_title_id = st.id
    WHERE psc.sci_title_id > 2
    GROUP BY cathedra_name, title
UNION SELECT "Загалом:", "- доктори", COUNT(*)
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON c.id = ct.cathedra_id
		JOIN person_sci_career AS psc ON ct.person_id = psc.person_id
    WHERE psc.sci_title_id = 4
UNION SELECT NULL, "- кандидати", COUNT(*)
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON c.id = ct.cathedra_id
		JOIN person_sci_career AS psc ON ct.person_id = psc.person_id
    WHERE psc.sci_title_id = 3
UNION SELECT NULL, "- разом", COUNT(*)
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON c.id = ct.cathedra_id
		JOIN person_sci_career AS psc ON ct.person_id = psc.person_id
    WHERE psc.sci_title_id IN (3,4)
