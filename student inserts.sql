use db_coursework;

SELECT FLOOR(RAND()*(SELECT COUNT(*)-1 FROM student_group)) + 1;

describe student_group;

select * from person where birthdate > '1950-01-01' order by birthdate;

INSERT INTO student (person_id, scholarshipstudent_group_id, scholarship) SELECT id, (SELECT FLOOR(RAND()*(SELECT COUNT(*)-1 FROM student_group)) + 1), RAND()*1000 FROM person WHERE birthdate > '1950-01-01';