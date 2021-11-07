use db_coursework;

describe speciality;

SELECT * from faculty;

INSERT INTO speciality (faculty_id, name, signature) VALUES (1, 'Хімік-аналітик', 'ХА');
INSERT INTO speciality (faculty_id, name, signature) VALUES (1, 'Хімік-паралітік', 'ХП');

INSERT INTO speciality (faculty_id, name, signature) VALUES (2, 'Фізик-ядерник', 'ФЯ');
INSERT INTO speciality (faculty_id, name, signature) VALUES (2, 'Радіофізик', 'ФР');

INSERT INTO speciality (faculty_id, name, signature) VALUES (3, 'Біолог-грибознавець', 'БГ');
INSERT INTO speciality (faculty_id, name, signature) VALUES (3, 'Біолог-вірусолог', 'БВ');

INSERT INTO speciality (faculty_id, name, signature) VALUES (4, 'Математик-арифметик', 'МА');
INSERT INTO speciality (faculty_id, name, signature) VALUES (4, 'Математик-геометр', 'МГ');

select * from speciality;