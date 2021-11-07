use db_coursework;

-- викладачи катедр

SELECT c.name AS cathedra_name, tr.name AS teacher_rank, 
	p.name AS person_name, p.surname AS person_surname, ct.wage AS wage
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON ct.cathedra_id = c.id
		JOIN person AS p ON p.id = ct.person_id
		JOIN teacher_rank AS tr ON ct.teacher_rank_id = tr.id
    ORDER BY ct.person_id;
    
-- кількість викладачів по катедрах

SELECT c.name AS cathedra_name, COUNT(*) AS count, 
	FORMAT(AVG(ct.wage),2) AS avg_wage, SUM(ct.wage) AS sum_wage
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON ct.cathedra_id = c.id
    GROUP BY c.id
UNION SELECT "Total:", COUNT(*), FORMAT(AVG(ct.wage), 2), 
	SUM(ct.wage) AS sum_wage
		FROM cathedra_teacher AS ct;
    
-- кількість викладачів-аспірантів

SELECT c.name AS cathedra_name, COUNT(*) AS count
		FROM cathedra AS c
		JOIN cathedra_teacher AS ct ON ct.cathedra_id = c.id
    WHERE ct.person_id IN (SELECT person_id FROM aspirant)
    GROUP BY c.id
UNION SELECT "Total:", COUNT(*)
		FROM cathedra_teacher AS ct
    WHERE ct.person_id IN (SELECT person_id FROM aspirant);

