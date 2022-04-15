--1
CREATE INDEX idx_mj_nm ON major (major_name);

CREATE INDEX idx_st_nm ON student (student_name);

CREATE INDEX idx_st_grnm ON student (grade, student_name);

--2
CREATE VIEW v_student AS
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student s
JOIN major m
ON s.major_id = m.major_id
WHERE s.hometown != '東京'
ORDER BY m.major_name;

--3
CREATE MATERIALIZED VIEW mv_student AS
SELECT s.student_id, s.student_name, s.hometown, m.major_name
FROM student s
JOIN major m
ON s.major_id = m.major_id
WHERE s.hometown != '東京'
ORDER BY m.major_name;


--4
CREATE OR REPLACE FUNCTION tax_inc(price decimal) RETURNS decimal
LANGUAGE plpgsql
AS $$
declare

begin
    return trunc(price * 1.1, 0);
end;
$$;

SELECT *, tax_inc(amount)
FROM sales;

--5
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

SELECT * FROM users_id_seq;

SELECT SETVAL ('users_id_seq', 100);