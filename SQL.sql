-- CREATE DATABASE
create database Java_Internship;
use Java_Internship;

-- CREATE TABLE STUDENT 
create table Student(
ID int auto_increment primary key, -- PRIMARY KEY
NAME varchar(25)not null, -- NOT NULL
ROLL_NUMBER varchar(25)unique, -- UNIQUE KEY
AGE int check(AGE>=12 and AGE<=18), -- CHECK CONSTRAINT
GENDER varchar(20)not null, -- NOT NULL
EMAIL varchar(30)unique, -- UNIQUE KEY
PASSWORD varchar(30)not null -- NOT NULL
);

desc Student;

alter table Student add CLASS varchar(20) not null;

-- INSERT THE RECORDS
INSERT INTO Student(NAME,ROLL_NUMBER,AGE,GENDER,EMAIL,PASSWORD,CLASS) VALUES
('T.AJAY VIGNESH','20UN71',15,'MALE','ajayvignesh.t@anjaconline.org','anjac@2024','10th Standard');

INSERT INTO Student(NAME,ROLL_NUMBER,AGE,GENDER,EMAIL,PASSWORD,CLASS) VALUES
('G.ANANTHA KRISHNAN','20UN72',15,'MALE','krishnan.g@anjaconline.org','anjac@2024','10th Standard'); 

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('S.PRIYA', '20UN73', 16, 'FEMALE', 'priya.s@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('M.KAVYA', '20UN74', 16, 'FEMALE', 'kavya.m@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('R.VIGNESH', '20UN75', 15, 'MALE', 'vignesh.r@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('N.VIJAY', '20UN76', 17, 'MALE', 'vijay.n@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('P.SWETHA', '20UN77', 16, 'FEMALE', 'swetha.p@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('L.RAVI', '20UN78', 15, 'MALE', 'ravi.l@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('A.SAKTHI', '20UN79', 17, 'FEMALE', 'sakthi.a@anjaconline.org', 'anjac@2024', '10th Standard');

INSERT INTO Student(NAME, ROLL_NUMBER, AGE, GENDER, EMAIL, PASSWORD, CLASS)
VALUES('K.RAJESH', '20UN80', 16, 'MALE', 'rajesh.k@anjaconline.org', 'anjac@2024', '10th Standard');
-- SELECT THE STUDENTS
select * from Student;

-- ORDER BY CLAUSE

select * from Student ORDER BY NAME ASC;

-- ADD FOREIGN KEY
create table Student_mark(
ID INT auto_increment PRIMARY KEY,
ROLL_NUMBER VARCHAR(25) unique,
TAMIL VARCHAR(3) CHECK(TAMIL>=0 AND TAMIL<=100),
ENGLISH VARCHAR(3) CHECK(ENGLISH>=0 AND ENGLISH<=100),
MATHS VARCHAR(3) CHECK(MATHS>=0 AND MATHS<=100),
SCIENCE VARCHAR(3) CHECK(SCIENCE>=0 AND SCIENCE<=100),
SOCIAL_SCIENCE VARCHAR(3) CHECK(SOCIAL_SCIENCE>=0 AND SOCIAL_SCIENCE<=100),
TOTAL_MARK VARCHAR(25) NOT NULL,
FOREIGN KEY (ROLL_NUMBER) REFERENCES Student(ROLL_NUMBER)
);


-- INSERT THE RECORDS INTO STUDENT_MARK TABLE
insert into Student_mark(ROLL_NUMBER,TAMIL,ENGLISH,MATHS,SCIENCE,SOCIAL_SCIENCE,TOTAL_MARK)VALUES
('20UN71','98','90','99','100','100','487');

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN72', 85, 88, 92, 95, 89, 449);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN73', 75, 80, 85, 90, 87, 417);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN74', 89, 93, 95, 97, 94, 468);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN75', 90, 92, 88, 94, 91, 455);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN76', 80, 84, 86, 89, 91, 430);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN77', 92, 95, 98, 100, 96, 481);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN78', 88, 91, 94, 96, 90, 459);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN79', 83, 85, 87, 92, 90, 437);

INSERT INTO Student_mark (ROLL_NUMBER, TAMIL, ENGLISH, MATHS, SCIENCE, SOCIAL_SCIENCE, TOTAL_MARK)
VALUES ('20UN80', 91, 93, 90, 95, 93, 462);

DESC Student_mark;

select * from Student_mark;

-- GROUP BY CLAUSE
SELECT GENDER, AVG(TOTAL_MARK) AS avg_total_marks
FROM Student_mark
JOIN Student ON Student_mark.ROLL_NUMBER = Student.ROLL_NUMBER
GROUP BY GENDER;

-- WHERE CLAUSE
select * from Student where Roll_number='20UN71';

-- HAVING CLAUSE
SELECT GENDER, AVG(TOTAL_MARK) AS avg_total_marks
FROM Student_mark
JOIN Student ON Student_mark.ROLL_NUMBER = Student.ROLL_NUMBER
GROUP BY GENDER
HAVING AVG(TOTAL_MARK) > 460;

-- BETWEEN OPERATOR
SELECT Student_mark.ROLL_NUMBER, TAMIL
FROM Student_mark
JOIN Student ON Student_mark.ROLL_NUMBER = Student.ROLL_NUMBER
WHERE TAMIL BETWEEN 80 AND 90;

-- LOGICAL AND OPERATOR
SELECT NAME, Student_mark.ROLL_NUMBER, MATHS, SCIENCE
FROM Student_mark
JOIN Student ON Student_mark.ROLL_NUMBER = Student.ROLL_NUMBER
WHERE MATHS > 85 AND SCIENCE > 85;

-- LOGICAL OR OPERATOR
SELECT  Student_mark.ROLL_NUMBER, TAMIL, ENGLISH
FROM Student_mark
JOIN Student ON Student_mark.ROLL_NUMBER = Student.ROLL_NUMBER
WHERE TAMIL > 90 OR ENGLISH > 90;



