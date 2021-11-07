use db_coursework;

select * from faculty;

describe cathedra;

INSERT INTO cathedra (faculty_id, name) VALUES (1, 'Неорганічної хімії');
INSERT INTO cathedra (faculty_id, name) VALUES (1, 'Органічної хімії');

INSERT INTO cathedra (faculty_id, name) VALUES (2, 'Ядерної фізики');
INSERT INTO cathedra (faculty_id, name) VALUES (2, 'Радіофізики');

INSERT INTO cathedra (faculty_id, name) VALUES (3, 'Грибології');
INSERT INTO cathedra (faculty_id, name) VALUES (3, 'Вірусології');

INSERT INTO cathedra (faculty_id, name) VALUES (4, 'Арифметики');
INSERT INTO cathedra (faculty_id, name) VALUES (4, 'Геометрії');

SELECT * FROM cathedra;
