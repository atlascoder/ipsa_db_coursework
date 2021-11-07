use db_coursework;

/**
Доступні посади вікладачів за їх науковими досягненнями
*/

SELECT p.id, p.name, p.surname, st.name AS sci_title, tr.name AS teacher_rank
	FROM person AS p
    JOIN person_sci_career AS psc ON p.id = psc.person_id
    JOIN sci_title AS st ON st.id = psc.sci_title_id
    JOIN teacher_rank AS tr ON tr.required_sci_title_id <= st.id;