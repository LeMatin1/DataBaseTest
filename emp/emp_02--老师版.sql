
--1.�г���ÿ�����Ź�����Ա��������ƽ�����ʺ�ƽ���������ޡ�
select count(*),avg(sal),avg(DATEDIFF(year,HIREDATE,getdate())) from emp group by deptno

--2.�г����в��ŵ���ϸ��Ϣ�Ͳ���������
select deptno, count(*) from emp group by deptno
select * from emp
select * from (select deptno, count(*) dept_num from emp group by deptno) e,dept d
where e.DEPTNO = d.DEPTNO

--3.�г����ֹ�������͹��ʡ�
select min(sal) from emp group by job

--4.�г��������ŵ�clerk(ְԱ)�����н��
select deptno,min(sal) from emp where job = 'clerk' group by deptno

--5.�г�Ա������ÿ�����ŵ�Ա������Ա�����������3�����Ͳ�������
select * from dept
select deptno,count(*) dept_num from emp group by deptno having count(*)>3
select e.dept_num,d.DNAME from (select deptno,count(*) dept_num from emp group by deptno having count(*)>3) e ,dept d
where e.DEPTNO = d.DEPTNO
--6.�ҳ����ʱ�ford�ߵ�Ա��
select sal from emp where ename = 'ford'
select ename from emp where sal > (select sal from emp where ename = 'ford')

--7.��ְλ����,�ҳ�ƽ��������ߵ�����ְλ
select * from emp 
select job,avg(sal) from emp group by job order by avg(sal) desc
select top 2 job,avg(sal) from emp group by job order by avg(sal) desc

--8.���Ҳ��ڲ���30,�ұȲ���30���κ�һ���˹��ʶ��ߵ�Ա������
select max(sal) from emp where deptno = 30

select ename from emp where sal > (select max(sal) from emp where deptno = 30) and deptno <> 30

--9.�õ�ƽ�����ʴ���2000�Ĺ���ְ��
select * from emp 
select job,avg(sal) from emp group by job having avg(sal) > 2000

--10.�õ�ÿ���¹������������Ǹ����ŵĲ��ű��,����,�������ڵ�,��������,��������
select * from dept
select top 1 deptno,count(*) emp_count,sum(sal) sal_sum from emp group by deptno order by sal_sum desc

select d.DEPTNO,d.DNAME,d.LOC,e.sal_sum,e.emp_count from dept d,
(select top 1 deptno,count(*) emp_count,sum(sal) sal_sum from emp group by deptno order by sal_sum desc) e
where e.DEPTNO = d.DEPTNO

--11.���ҳ�����20�Ͳ���30�У�������ߵĵ�1�������ʵ�3����Ա����Ա�����֣��������֣���������
select top 3 * from emp where deptno = 20 order by sal desc
select e.ENAME,d.DNAME,d.LOC from (select top 3 * from emp where deptno = 20 order by sal desc) e,dept d where e.DEPTNO = d.DEPTNO
union all
select e.ENAME,d.DNAME,d.LOC from (select top 3 * from emp where deptno = 30 order by sal desc) e,dept d where e.DEPTNO = d.DEPTNO
--12.���ҳ����루����+���𣩣��¼����Լ��ϼ����ߵ�Ա����ţ�����������
select empno,ename,sal+comm tot_sal from emp
select * from emp
select e.empno,e.ENAME,e.SAL+e.COMM sal1,e2.EMPNO,e2.EMPNO,e2.SAL+e2.COMM sal2 from
 emp e,emp e2 where e.EMPNO = e2.MGR and e2.sal+e2.COMM > e.SAL + e.COMM
--13.������ͳ��Ա����,���Ա�������Ĳ����й��ʵ�1������3��������Ա����Ϣ
select top 1 deptno,count(ename) emp_count from emp group by deptno order by emp_count desc

select top 3 * from emp where deptno = (select top 1 deptno from emp group by deptno order by count(*) desc) order by sal desc

--14.���ADAMS���ڲ��Ź�����������Ա������
select deptno from emp where ename = 'ADAMS'
select top 1 ename from emp where deptno = (select deptno from emp where ename = 'ADAMS') order by HIREDATE

--15.ʹ�÷�ҳд���г�emp���иò�ѯ�ĵ�1�͵�2ҳ���ݣ�ÿҳ10����
--��ҳ�Ĺ���(page - 1) * size + 1 <= rn <= page * size
select ROW_NUMBER() over(order by sal) rn,* from emp

select * from (select ROW_NUMBER() over(order by sal) rn,* from emp) t where t.rn between 1 and 10

select * from (select ROW_NUMBER() over(order by sal) rn,* from emp) t where t.rn between 11 and 20


