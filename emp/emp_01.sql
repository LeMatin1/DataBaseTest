select * from emp;
select * from dept;


--1.选择部门30中的所有员工.	
select * from emp where emp.deptno = 30

--2.列出所有办事员(clerk)的姓名，编号和部门编号.	
select * from emp where emp.job = 'clerk'

--3.找出部门10中所有经理(manager)和部门20中所有办事员(clerk)的详细资料.
select * from emp where (emp.deptno = 10 and emp.job = 'manager')
or (emp.deptno = 20 and emp.job = 'clerk')

--4.找出部门10中所有经理(manager),部门20中所有办事员(clerk),既不是经理又不是办事员但其薪金大于或等于2000的所有员工的详细资料.	
select * from emp where (emp.deptno = 10 and emp.job = 'manager')
or (emp.deptno = 20 and emp.job = 'clerk')
or (emp.job != 'manager' and emp.job != 'clerk' and emp.sal >= 2000)

--5.以字母小写的方式显示所有员工的姓名.	

select LOWER( emp.ENAME )from emp

--6.显示正好为5个字符的员工的姓名.	

select ENAME from emp where Len(ENAME) = 5

--7.显示不带有"r"的员工的姓名.	

select ENAME from emp where ENAME not like '%r%'

--8.显示所有员工姓名的前三个字符.

select Left(ename,3) from emp 
select SUBSTRING(ename,1,3) from emp

--9.显示所有员工的姓名,用a替换所有"A"	

update emp set ENAME = REPLACE(ENAME,'A','a')

--update emp set ENAME = UPPER(ENAME)

--10.显示员工的详细资料,按姓名排序.	
select * from emp order by ENAME 

--11.显示员工的姓名和受雇日期,根据其服务年限,将最老的员工排在最前面.	

select ENAME,HIREDATE from emp order by HIREDATE

--12.显示所有员工的姓名、工作和薪金,按工作的降序排序,若工作相同则按薪金排序.

select ENAME,JOB,SAL from emp 
order by  JOB desc ,sal

--13.显示姓名字段的任何位置包含"A"的所有员工的姓名.

select ENAME from emp where ENAME  like '%A%'