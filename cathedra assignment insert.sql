-- віпадковий викладач катедри
-- SELECT teacher_id FROM RandomCathedraTeachers WHERE cathedra_id = 1 LIMIT 1;

START TRANSACTION;

INSERT INTO cathedra_plan_assignment (cathedra_plan_charge_id, cathedra_teacher_id, hours)
SELECT cpc.id AS cathedra_plan_charge_id, 
		(SELECT teacher_id FROM RandomCathedraTeachers WHERE cathedra_id = cpc.cathedra_id LIMIT 1) AS cathedra_teacher_id,
        pl.hours
	FROM cathedra_plan_charge AS cpc
    JOIN plan AS pl ON pl.id = cpc.plan_id;
    
COMMIT;