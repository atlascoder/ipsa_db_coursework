use db_coursework;

/**
Генерація викладачів катедр
*/

INSERT INTO cathedra_teacher (cathedra_id, person_id, teacher_rank_id, wage)
SELECT FLOOR(RAND()*8) + 1 AS cathedra_id, p.id AS person_id, (SELECT teacher_rank_id FROM PersonAllowedTeacherRank WHERE person_id = p.id ORDER BY RAND() LIMIT 1) AS teacher_rank_id, ROUND(RAND()*10000,2) as wage
	FROM person as p
    WHERE p.id IN (SELECT person_id FROM PersonAllowedTeacherRank)
    LIMIT 1000;
    