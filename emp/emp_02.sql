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


--6.�ҳ����ʱ�ford�ߵ�Ա��


--7.��ְλ����,�ҳ�ƽ��������ߵ�����ְλ


--8.���Ҳ��ڲ���30,�ұȲ���30���κ�һ���˹��ʶ��ߵ�Ա������


--9.�õ�ƽ�����ʴ���2000�Ĺ���ְ��


--10.�õ�ÿ���¹������������Ǹ����ŵĲ��ű��,����,�������ڵ�,��������,��������


--11.���ҳ�����20�Ͳ���30�У�������ߵĵ�1�������ʵ�3����Ա����Ա�����֣��������֣���������


--12.���ҳ����루����+���𣩣��¼����Լ��ϼ����ߵ�Ա����ţ�����������


--13.������ͳ��Ա����,���Ա�������Ĳ����й��ʵ�1������3��������Ա����Ϣ


--14.���ADAMS���ڲ��Ź�����������Ա������


--15.ʹ�÷�ҳд���г�emp���иò�ѯ�ĵ�1�͵�2ҳ���ݣ�ÿҳ10����


