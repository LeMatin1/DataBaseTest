--(1)列出至少有3个员工的部门信息

select COUNT(*) 员工数,DEPT.DEPTNO,dept.DNAME,dept.LOC as 人数 from emp,dept where emp.DEPTNO = dept.DEPTNO 
group by DEPT.DEPTNO,dept.DNAME,dept.LOC having  COUNT(*) > 3

--(2)列出工资比“SMITH”多的员工名称以及工资

select * from emp

select e2.ENAME,e2.SAL from emp e1,emp e2
where e1.ENAME = 'smith' and e2.SAL>e1.SAL

--(3)列出所有员工的姓名及其直接上级的姓名和上级的部门名称

select e1.ENAME,e2.ENAME,DNAME from emp e1,emp e2,dept
 where e1.MGR = e2.EMPNO and e2.DEPTNO = dept.DEPTNO


--(4)列出受雇日期早于其直接上级的所有员工

select e1.ENAME,e1.HIREDATE,e2.ENAME,e2.HIREDATE from emp e1,emp e2
where e1.MGR = e2.EMPNO and e1.HIREDATE<e2.HIREDATE


--(5)列出部门名称和这些部门的员工信息，同时列出那些没有员工的部门


--(6)列出所有比“CLERK”（办事员）平均工资高的员工的姓名及其部门名称

 
--(7)列出平均薪金大于1500的工作种类以及相关员工名称


--(8)列出在部门“SALES”（销售部）工作的员工的上级的平均工资


--(9)列出薪金高于公司平均薪金的所有员工。


--(10)列出与“SCOTT”从事相同工作的所有员工所在部门的平均工资


--(11)列出  不在部门30中员工的工资 与部门30中员工工资相同的 员工的姓名和工资


--(12)列出   薪金高于在部门30工作的所有员工的薪金的    员工姓名和薪金


--(13)列出所有员工的下属  工资大于1000的 姓名、部门名称和工资

  
--(14)列出所有部门的详细信息和部门人数


--(15)列出各种工作的最低工资


--(16)列出所有员工的年工资,按年薪从低到高排序


--(17)列出有下属的员工名

