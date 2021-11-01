CREATE TABLE WORKERS(
    id serial PRIMARY KEY,
    birthday date NOT NULL CHECK (birthday > '1920-1-1' AND birthday < '2002-1-1'),
    worker_name varchar(128) NOT NULL CHECK(worker_name !=''),
    salary  numeric NOT NULL CHECK (salary > 1)
);

INSERT into WORKERS (worker_name, birthday, salary)
VALUES
('Nikita', '1990-1-1', 300),
('Svetlana', '1995-1-3', 1200),
('Yaroslav','1980-1-5', 1200),
('Petr', '1993-2-6', 1000),
('Masha', '1995-6-1', 500),
('Vasiliy', '1999-3-2', 800);

UPDATE WORKERS SET salary = 200 WHERE worker_name = 'Vasiliy';

UPDATE WORKERS SET birthday = '1987-1-1' WHERE id = 4;

UPDATE WORKERS SET salary = 700 WHERE salary = 500;

UPDATE WORKERS SET birthday = '1999/1/1' WHERE id > 2 AND id < 5;

UPDATE WORKERS SET worker_name = 'Masha', salary = 900 WHERE worker_name = 'Vasiliy';

SELECT id = 3 FROM WORKERS;

SELECT worker_name FROM WORKERS WHERE salary > 400;

SELECT worker_name FROM WORKERS WHERE salary != 500;

SELECT age(birthday), salary FROM WORKERS where worker_name = 'Masha';

SELECT worker_name FROM WORKERS WHERE worker_name = 'Petr';

SELECT worker_name FROM WORKERS WHERE worker_name != 'Petr';

SELECT worker_name FROM WORKERS WHERE make_interval(27)=age(birthday) OR salary = 1000;

SELECT worker_name FROM WORKERS WHERE age(birthday) > make_interval(19) AND age(birthday) <= make_interval(28);

SELECT worker_name FROM WORKERS WHERE age(birthday) >= make_interval(23) AND age(birthday) <= make_interval(27) OR salary <= 400 AND salary < 1000;

SELECT worker_name FROM WORKERS WHERE age(birthday) = make_interval(27) OR salary != 400;

DELETE FROM workers WHERE id = 7;

DELETE FROM workers WHERE worker_name = 'Petr';

DELETE FROM workers WHERE age(birthday) = make_interval(20);


