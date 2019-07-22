
--1.列出在每个部门工作的员工数量、平均工资和平均服务期限。
select count(*),avg(sal),avg(DATEDIFF(year,HIREDATE,getdate())) from emp group by deptno

--2.列出所有部门的详细信息和部门人数。
select deptno, count(*) from emp group by deptno
select * from emp
select * from (select deptno, count(*) dept_num from emp group by deptno) e,dept d
where e.DEPTNO = d.DEPTNO

--3.列出各种工作的最低工资。
select min(sal) from emp group by job

--4.列出各个部门的clerk(职员)的最低薪金。
select deptno,min(sal) from emp where job = 'clerk' group by deptno

--5.列出员工表中每个部门的员工数（员工数必须大于3），和部门名称
select * from dept
select deptno,count(*) dept_num from emp group by deptno having count(*)>3
select e.dept_num,d.DNAME from (select deptno,count(*) dept_num from emp group by deptno having count(*)>3) e ,dept d
where e.DEPTNO = d.DEPTNO
--6.找出工资比ford高的员工
select sal from emp where ename = 'ford'
select ename from emp where sal > (select sal from emp where ename = 'ford')

--7.以职位分组,找出平均工资最高的两种职位
select * from emp 
select job,avg(sal) from emp group by job order by avg(sal) desc
select top 2 job,avg(sal) from emp group by job order by avg(sal) desc

--8.查找不在部门30,且比部门30中任何一个人工资都高的员工姓名
select max(sal) from emp where deptno = 30

select ename from emp where sal > (select max(sal) from emp where deptno = 30) and deptno <> 30

--9.得到平均工资大于2000的工作职种
select * from emp 
select job,avg(sal) from emp group by job having avg(sal) > 2000

--10.得到每个月工资总数最多的那个部门的部门编号,名称,部门所在地,工资总数,部门人数
select * from dept
select top 1 deptno,count(*) emp_count,sum(sal) sal_sum from emp group by deptno order by sal_sum desc

select d.DEPTNO,d.DNAME,d.LOC,e.sal_sum,e.emp_count from dept d,
(select top 1 deptno,count(*) emp_count,sum(sal) sal_sum from emp group by deptno order by sal_sum desc) e
where e.DEPTNO = d.DEPTNO

--11.查找出部门20和部门30中，工资最高的第1名到工资第3名的员工的员工名字，部门名字，部门所在
select top 3 * from emp where deptno = 20 order by sal desc
select e.ENAME,d.DNAME,d.LOC from (select top 3 * from emp where deptno = 20 order by sal desc) e,dept d where e.DEPTNO = d.DEPTNO
union all
select e.ENAME,d.DNAME,d.LOC from (select top 3 * from emp where deptno = 30 order by sal desc) e,dept d where e.DEPTNO = d.DEPTNO
--12.查找出收入（工资+奖金），下级比自己上级还高的员工编号，姓名，收入
select empno,ename,sal+comm tot_sal from emp
select * from emp
select e.empno,e.ENAME,e.SAL+e.COMM sal1,e2.EMPNO,e2.EMPNO,e2.SAL+e2.COMM sal2 from
 emp e,emp e2 where e.EMPNO = e2.MGR and e2.sal+e2.COMM > e.SAL + e.COMM
--13.按部门统计员工数,查出员工数最多的部门中工资第1名到第3名的所有员工信息
select top 1 deptno,count(ename) emp_count from emp group by deptno order by emp_count desc

select top 3 * from emp where deptno = (select top 1 deptno from emp group by deptno order by count(*) desc) order by sal desc

--14.查出ADAMS所在部门工作年限最大的员工名字
select deptno from emp where ename = 'ADAMS'
select top 1 ename from emp where deptno = (select deptno from emp where ename = 'ADAMS') order by HIREDATE

--15.使用分页写法列出emp表中该查询的第1和第2页数据（每页10条）
--分页的规则：(page - 1) * size + 1 <= rn <= page * size
select ROW_NUMBER() over(order by sal) rn,* from emp

select * from (select ROW_NUMBER() over(order by sal) rn,* from emp) t where t.rn between 1 and 10

select * from (select ROW_NUMBER() over(order by sal) rn,* from emp) t where t.rn between 11 and 20


