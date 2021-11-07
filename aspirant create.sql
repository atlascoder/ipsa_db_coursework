use db_coursework;

-- створення 10 аспирантів на власних катедрах

INSERT INTO aspirant (person_id, cathedra_id)
SELECT rnd.person_id, rnd.cathedra_id FROM (
	SELECT p.id AS person_id, ct.cathedra_id AS cathedra_id, RAND() AS ord FROM cathedra_teacher AS ct
		JOIN person AS p ON p.id = ct.person_id
		WHERE p.id NOT IN (SELECT person_id FROM person_sci_career AS psc WHERE psc.sci_title_id < 3)
		ORDER BY ord DESC
   LIMIT 10) AS rnd;