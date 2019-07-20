select * from emp;
select * from dept;


--1.ѡ����30�е�����Ա��.	
select * from emp where emp.deptno = 30

--2.�г����а���Ա(clerk)����������źͲ��ű��.	
select * from emp where emp.job = 'clerk'

--3.�ҳ�����10�����о���(manager)�Ͳ���20�����а���Ա(clerk)����ϸ����.
select * from emp where (emp.deptno = 10 and emp.job = 'manager')
or (emp.deptno = 20 and emp.job = 'clerk')

--4.�ҳ�����10�����о���(manager),����20�����а���Ա(clerk),�Ȳ��Ǿ����ֲ��ǰ���Ա����н����ڻ����2000������Ա������ϸ����.	
select * from emp where (emp.deptno = 10 and emp.job = 'manager')
or (emp.deptno = 20 and emp.job = 'clerk')
or (emp.job != 'manager' and emp.job != 'clerk' and emp.sal >= 2000)

--5.����ĸСд�ķ�ʽ��ʾ����Ա��������.	

select LOWER( emp.ENAME )from emp

--6.��ʾ����Ϊ5���ַ���Ա��������.	

select ENAME from emp where Len(ENAME) = 5

--7.��ʾ������"r"��Ա��������.	

select ENAME from emp where ENAME not like '%r%'

--8.��ʾ����Ա��������ǰ�����ַ�.

select Left(ename,3) from emp 
select SUBSTRING(ename,1,3) from emp

--9.��ʾ����Ա��������,��a�滻����"A"	

update emp set ENAME = REPLACE(ENAME,'A','a')

--update emp set ENAME = UPPER(ENAME)

--10.��ʾԱ������ϸ����,����������.	
select * from emp order by ENAME 

--11.��ʾԱ�����������ܹ�����,�������������,�����ϵ�Ա��������ǰ��.	

select ENAME,HIREDATE from emp order by HIREDATE

--12.��ʾ����Ա����������������н��,�������Ľ�������,��������ͬ��н������.

select ENAME,JOB,SAL from emp 
order by  JOB desc ,sal

--13.��ʾ�����ֶε��κ�λ�ð���"A"������Ա��������.

select ENAME from emp where ENAME  like '%A%'