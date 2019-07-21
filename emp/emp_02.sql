--1.列出在每个部门工作的员工数量、平均工资和平均服务期限。

select * from emp order by JOB,SAL
select * from dept

select dept.DEPTNO,COUNT(emp1.SAL) 员工数量, AVG(SAL) 平均工资 ,AVG(服务期限) as 平均服务期限
from dept,(select DEPTNO,sal,DATEDIFF(DAY,emp.HIREDATE,GETDATE()) as 服务期限 from emp) as emp1
where dept.DEPTNO = emp1.DEPTNO group by dept.DEPTNO


--2.列出所有部门的详细信息和部门人数。

select dept.DEPTNO,DNAME,LOC ,COUNT(t.DEPTNO) 人数 from dept,(select DEPTNO from emp) t
where dept.DEPTNO = t.DEPTNO group by dept.DEPTNO,DNAME,LOC

--3.列出各种工作的最低工资。

select emp.JOB,min(emp.SAL) from emp
group by JOB


--4.列出各个部门的clerk(职员)的最低薪金。
select emp.DEPTNO, min(t.sal) from emp,(select sal,DEPTNO from emp where JOB='clerk') t 
where emp.DEPTNO = t.DEPTNO group by emp.DEPTNO

--5.列出员工表中每个部门的员工数（员工数必须大于3），和部门名称

select 人数 , DNAME
from (select COUNT(*) 人数,deptno  from emp group by DEPTNO) t ,dept
where t.DEPTNO=dept.DEPTNO

--6.找出工资比ford高的员工

select emp.ENAME,emp.SAL from (select emp.SAL from emp where ENAME = 'ford') t,emp
where emp.SAL>t.SAL


--7.以职位分组,找出平均工资最高的两种职位

select top 2 job,AVG(SAL) 
from emp group by JOB order by Avg(SAL) desc


--8.查找不在部门30,且比部门30中任何一个人工资都高的员工姓名

select ename from (select Max(sal) Maxsal from emp where DEPTNO=30) t ,emp 
where SAL>Maxsal and DEPTNO != 30

--9.得到平均工资大于2000的工作职种

select job,AVG(SAL) 
from emp group by JOB having AVG(SAL) >2000


--10.得到每个月工资总数最多的那个部门的部门编号,名称,部门所在地,工资总数,部门人数

select top 1 dept.DEPTNO,DNAME,dept.LOC,总工资,总人数
from(select DEPTNO,SUM(SAL) 总工资,COUNT(*) 总人数 from emp group by DEPTNO) t,dept
where dept.DEPTNO = t.DEPTNO order by 总工资 desc

--11.查找出部门20和部门30中，工资最高的第1名到工资第3名的员工的员工名字，部门名字，部门所在

select  ENAME,DNAME,LOC
from dept ,( select top 3 sal,ENAME,DEPTNO from emp where DEPTNO in (20,30) order by SAL desc) t
where t.DEPTNO = dept.DEPTNO

--12.查找出收入（工资+奖金），下级比自己上级还高的员工编号，姓名，收入

select EMPNO,ENAME,emp.SAL+COMM
from (select sal,deptno from emp where JOB='manager') t ,emp
where t.DEPTNO = emp.DEPTNO and emp.SAL+COMM > t.SAL


--13.按部门统计员工数,查出员工数最多的部门中工资第1名到第3名的所有员工信息

select top 3 emp.* from 
( select top 1 COUNT(*) 人数,deptno  from emp group by DEPTNO order by 人数 desc) t ,emp
where t.DEPTNO = emp.DEPTNO order by SAL desc


--14.查出ADAMS所在部门工作年限最大的员工名字

select top 1 ename 
from (select deptno from emp where ename = 'adams' ) t ,emp
where t.DEPTNO = emp.DEPTNO order by DATEDIFF(DAY,HIREDATE,GETDATE()) desc


--15.使用分页写法列出emp表中该查询的第1和第2页数据（每页10条）

select top 10 *
from emp
where EMPNO NOT IN (select top 0 EMPNO from emp order by EMPNO)
order by EMPNO
--第一页

select top 10 *
from emp
where EMPNO NOT IN (select top 10 EMPNO from emp order by EMPNO)
order by EMPNO
--第二页
