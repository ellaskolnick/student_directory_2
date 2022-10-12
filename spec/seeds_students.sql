TRUNCATE TABLE students, cohorts RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
INSERT INTO cohorts (name, starting_date) VALUES ('blueberries', '2022-03-10');
INSERT INTO cohorts (name, starting_date) VALUES ('raspberries', '2021-03-10');
INSERT INTO students (name, cohort_id) VALUES ('Harry Styles', '1');
INSERT INTO students (name, cohort_id) VALUES ('Taylor Swift', '1');
INSERT INTO students (name, cohort_id) VALUES ('Billie Ellish', '2');
INSERT INTO students (name, cohort_id) VALUES ('Madison Beer', '2');
