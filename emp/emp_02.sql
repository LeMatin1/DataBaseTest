--1.�г���ÿ�����Ź�����Ա��������ƽ�����ʺ�ƽ���������ޡ�

select * from emp order by JOB,SAL
select * from dept

select dept.DEPTNO,COUNT(emp1.SAL) Ա������, AVG(SAL) ƽ������ ,AVG(��������) as ƽ����������
from dept,(select DEPTNO,sal,DATEDIFF(DAY,emp.HIREDATE,GETDATE()) as �������� from emp) as emp1
where dept.DEPTNO = emp1.DEPTNO group by dept.DEPTNO


--2.�г����в��ŵ���ϸ��Ϣ�Ͳ���������

select dept.DEPTNO,DNAME,LOC ,COUNT(t.DEPTNO) ���� from dept,(select DEPTNO from emp) t
where dept.DEPTNO = t.DEPTNO group by dept.DEPTNO,DNAME,LOC

--3.�г����ֹ�������͹��ʡ�

select emp.JOB,min(emp.SAL) from emp
group by JOB


--4.�г��������ŵ�clerk(ְԱ)�����н��
select emp.DEPTNO, min(t.sal) from emp,(select sal,DEPTNO from emp where JOB='clerk') t 
where emp.DEPTNO = t.DEPTNO group by emp.DEPTNO

--5.�г�Ա������ÿ�����ŵ�Ա������Ա�����������3�����Ͳ�������

select ���� , DNAME
from (select COUNT(*) ����,deptno  from emp group by DEPTNO) t ,dept
where t.DEPTNO=dept.DEPTNO

--6.�ҳ����ʱ�ford�ߵ�Ա��

select emp.ENAME,emp.SAL from (select emp.SAL from emp where ENAME = 'ford') t,emp
where emp.SAL>t.SAL


--7.��ְλ����,�ҳ�ƽ��������ߵ�����ְλ

select top 2 job,AVG(SAL) 
from emp group by JOB order by Avg(SAL) desc


--8.���Ҳ��ڲ���30,�ұȲ���30���κ�һ���˹��ʶ��ߵ�Ա������

select ename from (select Max(sal) Maxsal from emp where DEPTNO=30) t ,emp 
where SAL>Maxsal and DEPTNO != 30

--9.�õ�ƽ�����ʴ���2000�Ĺ���ְ��

select job,AVG(SAL) 
from emp group by JOB having AVG(SAL) >2000


--10.�õ�ÿ���¹������������Ǹ����ŵĲ��ű��,����,�������ڵ�,��������,��������

select top 1 dept.DEPTNO,DNAME,dept.LOC,�ܹ���,������
from(select DEPTNO,SUM(SAL) �ܹ���,COUNT(*) ������ from emp group by DEPTNO) t,dept
where dept.DEPTNO = t.DEPTNO order by �ܹ��� desc

--11.���ҳ�����20�Ͳ���30�У�������ߵĵ�1�������ʵ�3����Ա����Ա�����֣��������֣���������

select  ENAME,DNAME,LOC
from dept ,( select top 3 sal,ENAME,DEPTNO from emp where DEPTNO in (20,30) order by SAL desc) t
where t.DEPTNO = dept.DEPTNO

--12.���ҳ����루����+���𣩣��¼����Լ��ϼ����ߵ�Ա����ţ�����������

select EMPNO,ENAME,emp.SAL+COMM
from (select sal,deptno from emp where JOB='manager') t ,emp
where t.DEPTNO = emp.DEPTNO and emp.SAL+COMM > t.SAL


--13.������ͳ��Ա����,���Ա�������Ĳ����й��ʵ�1������3��������Ա����Ϣ

select top 3 emp.* from 
( select top 1 COUNT(*) ����,deptno  from emp group by DEPTNO order by ���� desc) t ,emp
where t.DEPTNO = emp.DEPTNO order by SAL desc


--14.���ADAMS���ڲ��Ź�����������Ա������

select top 1 ename 
from (select deptno from emp where ename = 'adams' ) t ,emp
where t.DEPTNO = emp.DEPTNO order by DATEDIFF(DAY,HIREDATE,GETDATE()) desc


--15.ʹ�÷�ҳд���г�emp���иò�ѯ�ĵ�1�͵�2ҳ���ݣ�ÿҳ10����

select top 10 *
from emp
where EMPNO NOT IN (select top 0 EMPNO from emp order by EMPNO)
order by EMPNO
--��һҳ

select top 10 *
from emp
where EMPNO NOT IN (select top 10 EMPNO from emp order by EMPNO)
order by EMPNO
--�ڶ�ҳ
