CREATE SCHEMA immigration;

USE immigration;

-- 1. Employee
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

-- 2. Contact
CREATE TABLE contact(
Phone_No VARCHAR(20) NOT NULL PRIMARY KEY,
Email_Id VARCHAR(30),
Address VARCHAR(60),
ID_Emp CHAR(10),
FOREIGN KEY (ID_Emp) REFERENCES employee (ID_Emp));

-- 3. Project
CREATE TABLE Project(
Project_ID  INT NOT NULL PRIMARY KEY,
Project_start_date DATE,
Project_end_date DATE,
Project_name VARCHAR(50),
Duration VARCHAR(10));

-- 4. Department
CREATE TABLE department(
Dept_ID INT NOT NULL PRIMARY KEY,
Dept_Name VARCHAR(20));

-- 5. Belongs To
CREATE TABLE belongs_to(
Dept_ID INT,
Project_ID INT,
PRIMARY KEY (Project_ID, Dept_ID),
FOREIGN KEY (Project_ID) REFERENCES Project (Project_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Dept_ID) REFERENCES department (Dept_ID)
ON DELETE CASCADE ON UPDATE CASCADE);

-- 6. Works In
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

-- 7. Previous Work Experience
CREATE TABLE Previous_works_experience(
ID_Emp CHAR(10) NOT NULL PRIMARY KEY,
Num_years_Exp INT,
Prev_Job_Title VARCHAR(20),
Last_Working_Date DATE,
Prev_Company_Loc VARCHAR(30),
Prev_Company_Name VARCHAR(50));

-- 8. Passport
CREATE TABLE Passport (
    Passport_No VARCHAR(20) PRIMARY KEY,
    Nationality VARCHAR(255),
    Passport_exp_date DATE,
    Passport_issue_date DATE,
    ID_emp CHAR(10),
    FOREIGN KEY (ID_emp) REFERENCES Employee(ID_emp)
);
 
-- 9. I9-Form
CREATE TABLE I9_Form (
    Form_ID CHAR(14) PRIMARY KEY,
    Document_type VARCHAR(255),
    Form_date_completion DATE,
    Form_status VARCHAR(255),
    e_verify_result VARCHAR(255),
    Doc_exp_date DATE,
    Doc_No VARCHAR(255),
    ID_emp CHAR(10),
    FOREIGN KEY (ID_emp) REFERENCES Employee(ID_emp)
);
 
-- 10. Green_Card
CREATE TABLE Green_Card (
    GreenCard_ID CHAR(11) PRIMARY KEY,
    GreenCard_status VARCHAR(255),
    GreenCard_exp_date DATE,
    GreenCard_issue_date DATE,
    ID_emp CHAR(10),
    FOREIGN KEY (ID_emp) REFERENCES Employee(ID_emp)
);
 
-- 11. Visa
CREATE TABLE Visa (
    Visa_ID CHAR(12) PRIMARY KEY,
    Visa_type VARCHAR(255),
    Visa_exp_Date DATE,
    Visa_Issue_Date DATE,
    ID_emp CHAR(10),
    FOREIGN KEY (ID_emp) REFERENCES Employee(ID_emp)
);
 
-- 12. Budget
CREATE TABLE Budget (
    ID_emp CHAR(10) PRIMARY KEY,
    Total_Acc_amt_$ DECIMAL(10, 2)
);
 
-- 13. Visa_Sponshership
CREATE TABLE Visa_Sponshership (
    ID_emp CHAR(10) PRIMARY KEY,
    Legal_Fee DECIMAL(10, 2),
    Form_Fill_Fee DECIMAL(10, 2)
);
 -- 14. On-Boarding
CREATE TABLE On_Boarding (
    ID_emp CHAR(10) PRIMARY KEY,
    Onboarding_cost DECIMAL(10, 2),
    Relocation_cost DECIMAL(10, 2)
);
-- 15. Salary
CREATE TABLE Salary (
    ID_emp CHAR(10) PRIMARY KEY,
    Base_salary DECIMAL(10, 2)
);