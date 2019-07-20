--½¨¿â
USE master
GO
IF EXISTS(SELECT * FROM SYSDATABASES WHERE NAME = 'emp_db')
DROP DATABASE emp_db
GO                                                            
CREATE DATABASE emp_db
ON PRIMARY
(
	NAME = 'emp_db',
	FILENAME = 'D:\course\01_sql\db\emp_db.mdf',
	SIZE = 5MB,
	FILEGROWTH = 1MB
)                                                             
LOG ON
(
	NAME = 'emp_db_log',
	FILENAME = 'D:\course\01_sql\db\emp_db_log.ldf',
	SIZE = 1MB,
	FILEGROWTH = 10%
)
GO                                                            

USE emp_db
GO
                                                         

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'emp')
DROP TABLE emp
GO                                                             
CREATE TABLE emp
(
	EMPNO INT PRIMARY KEY ,
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR INT,
	HIREDATE DATETIME,
	SAL decimal(7,2),
	COMM decimal(7,2),
	DEPTNO INT REFERENCES dept(DEPTNO)
)                                                              
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'dept')
DROP TABLE dept
GO                                                             
CREATE TABLE dept
(
	DEPTNO INT PRIMARY KEY not null,
	DNAME varchar(14),
	LOC  varchar(14)
)
GO      

select * from dept 
select * from emp    

insert dept values(10,'ACCOUNTING','NEW YORK')                                                  
insert dept values(20,'RESEARCH','DALLAS')
insert dept values(30,'SALES','CHICAGO')
insert dept values(40,'OPERATIONS','BOSTON')


delete from emp
insert emp values(7369,'SMITH','CLERK',7902,convert(datetime,'1980-12-17'),800.00,0,20)
insert emp values(7499,'ALLEN','SALESMAN',7698,convert(datetime,'1981-02-20'),1600.00,300.00,30)
insert emp values(7521,'WARD','SALESMAN',7698,convert(datetime,'1981-02-22'),1250.00,500.00,30)
insert emp values(7566,'JONES','MANAGER',7839,convert(datetime,'1981-04-02'),2975.00,0,20)
insert emp values(7654,'MARTIN','SALESMAN',7698,convert(datetime,'1981-09-28'),1250.00,1400.00,30)
insert emp values(7698,'BLAKE','MANAGER',7839,convert(datetime,'1981-05-01'),2850.00,0,30)
insert emp values(7782,'CLARK','MANAGER',7839,convert(datetime,'1981-06-09'),2450.00,0,10)
insert emp values(7788,'SCOTT','ANALYST',7566,convert(datetime,'1987-04-19'),3000.00,0,20)
insert emp values(7839,'KING','PRESIDENT',' ',convert(datetime,'1981-11-17'),5000.00,0,10)
insert emp values(7844,'TURNER','SALESMAN',7698,convert(datetime,'1981-09-08'),1500.00,0,30)
insert emp values(7876,'ADAMS','CLERK',7788,convert(datetime,'1987-05-23'),1100.00,0,20)
insert emp values(7900,'JAMES','CLERK',7698,convert(datetime,'1981-12-03'),950.00,0,30)
insert emp values(7902,'FORD','ANALYST',7566,convert(datetime,'1981-12-03'),3000.00,0,20)
insert emp values(7934,'MILLER','CLERK',7782,convert(datetime,'1982-01-23'),1300.00,0,10)
