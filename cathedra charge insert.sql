use db_coursework;

-- створення доручень катедрам

INSERT INTO cathedra_plan_charge (plan_id, cathedra_id)
SELECT pl.id, d.cathedra_id 
	FROM plan AS pl
    JOIN discipline AS d ON d.id = pl.discipline_id
    WHERE pl.id NOT IN (SELECT plan_id FROM cathedra_plan_charge);