-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/wIKby5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS department CASCADE;
CREATE TABLE department (
    deptno char(5)   NOT NULL,
    deptname varchar(30)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        deptno
     )
);

DROP TABLE IF EXISTS employee CASCADE;
CREATE TABLE employee (
    empno int   NOT NULL,
    titleid char(5)   NOT NULL,
    birthdate Date   NOT NULL,
    firstname varchar(30)   NOT NULL,
    lastname varchar(30)   NOT NULL,
    sex char(1)   NOT NULL,
    hiredate Date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        empno
     )
);

DROP TABLE IF EXISTS title;
CREATE TABLE title (
    titleid char(5) PRIMARY KEY NOT NULL,
    title varchar(30)   NOT NULL
);

DROP TABLE IF EXISTS deptmanager;
CREATE TABLE deptmanager (
    deptno char(5)   NOT NULL,
    empno int   NOT NULL,
	CONSTRAINT "pk_DeptManager" PRIMARY KEY (deptno, empno)
);

DROP TABLE IF EXISTS deptemp;
CREATE TABLE deptemp (
    empno int   NOT NULL,
    deptno char(5)   NOT NULL,
	CONSTRAINT "pk_DeptEmp" PRIMARY KEY (deptno, empno)
);

DROP TABLE IF EXISTS salary;
CREATE TABLE salary (
    empno int  PRIMARY KEY NOT NULL,
    salary int NOT NULL
);

ALTER TABLE employee ADD CONSTRAINT "fk_Employee_TitleID" FOREIGN KEY(titleid) REFERENCES title (titleid);

ALTER TABLE deptmanager ADD CONSTRAINT "fk_DeptManager_DeptNo" FOREIGN KEY(deptno) REFERENCES department (deptno);

ALTER TABLE deptmanager ADD CONSTRAINT "fk_DeptManager_EmpNo" FOREIGN KEY(empno) REFERENCES employee (empno);

ALTER TABLE deptemp ADD CONSTRAINT "fk_DeptEmp_EmpNo" FOREIGN KEY(empno) REFERENCES employee (empno);

ALTER TABLE deptemp ADD CONSTRAINT "fk_DeptEmp_DeptNo" FOREIGN KEY(deptno) REFERENCES department (deptno);

ALTER TABLE salary ADD CONSTRAINT "fk_Salary_EmpNo" FOREIGN KEY(empno) REFERENCES employee (empno);

