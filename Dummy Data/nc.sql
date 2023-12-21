use immigration_project;

select * from Previous_works_experience;

CREATE TABLE employee
(ID_Emp CHAR(10) NOT NULL PRIMARY KEY, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(20), 
Gender VARCHAR(15), 
SSN CHAR(11),
DOB DATE,
Job_Title VARCHAR(40),
ID_Dept INT,
Age INT);

CREATE TABLE contact(
Phone_No VARCHAR(20) NOT NULL PRIMARY KEY,
Email_Id VARCHAR(30),
Address VARCHAR(60),
ID_Emp CHAR(10));

CREATE TABLE Project(
Project_ID  INT NOT NULL PRIMARY KEY,
Project_start_date DATE,
Project_end_date DATE,
Project_name VARCHAR(50),
Duration VARCHAR(10));

CREATE TABLE department(
Dept_ID INT NOT NULL PRIMARY KEY,
Dept_Name VARCHAR(20)
);

CREATE TABLE belongs_to(
Dept_ID INT,
Project_ID INT,
PRIMARY KEY (Project_ID, Dept_ID),
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Dept_ID) REFERENCES department (Dept_ID)
ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE works_in(
Project_ID INT NOT NULL,
ID_Emp CHAR(10) NOT NULL,
Hours INT,
email VARCHAR(30),
PRIMARY KEY (Project_ID, ID_Emp),
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (ID_Emp) REFERENCES employee (ID_Emp)
ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Previous_works_experience(
ID_Emp CHAR(10) NOT NULL PRIMARY KEY,
Num_years_Exp INT,
Prev_Job_Title VARCHAR(20),
Last_Working_Date DATE,
Prev_Company_Loc VARCHAR(30),
Prev_Company_Name VARCHAR(50)
);