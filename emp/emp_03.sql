--(1)�г�������3��Ա���Ĳ�����Ϣ

select COUNT(*) Ա����,DEPT.DEPTNO,dept.DNAME,dept.LOC as ���� from emp,dept where emp.DEPTNO = dept.DEPTNO 
group by DEPT.DEPTNO,dept.DNAME,dept.LOC having  COUNT(*) > 3

--(2)�г����ʱȡ�SMITH�����Ա�������Լ�����

select * from emp order by SAL

select e2.ENAME,e2.SAL from emp e1,emp e2
where e1.ENAME = 'smith' and e2.SAL>e1.SAL

--(3)�г�����Ա������������ֱ���ϼ����������ϼ��Ĳ�������

select e1.ENAME,e2.ENAME,DNAME from emp e1,emp e2,dept
 where e1.MGR = e2.EMPNO and e2.DEPTNO = dept.DEPTNO


--(4)�г��ܹ�����������ֱ���ϼ�������Ա��

select e1.ENAME,e1.HIREDATE,e2.ENAME,e2.HIREDATE from emp e1,emp e2
where e1.MGR = e2.EMPNO and e1.HIREDATE<e2.HIREDATE


--(5)�г��������ƺ���Щ���ŵ�Ա����Ϣ��ͬʱ�г���Щû��Ա���Ĳ���

select DNAME,dept.DEPTNO,emp.* from dept left join emp on dept.DEPTNO = emp.DEPTNO 


--(6)�г����бȡ�CLERK��������Ա��ƽ�����ʸߵ�Ա�����������䲿������

select ENAME,DNAME from emp,dept where SAL >
(select AVG(SAL) from emp where job = 'clerk') and emp.DEPTNO = dept.DEPTNO 

 
--(7)�г�ƽ��н�����1500�Ĺ��������Լ����Ա������

select ENAME,emp.JOB from emp ,(select job,AVG(sal) avg_sal  from emp group by job having AVG(SAL)>1500) t
where emp.SAL > t.avg_sal

--(8)�г��ڲ��š�SALES�������۲���������Ա�����ϼ���ƽ������

select avg(e2.SAL) from emp e1,emp e2 where e1.MGR=e2.EMPNO 
	and e1.DEPTNO = (Select DEPTNO from dept where DNAME='sales')

--(9)�г�н����ڹ�˾ƽ��н�������Ա����

select * from emp where SAL > (select AVG(sal) from emp)

--(10)�г��롰SCOTT��������ͬ����������Ա�����ڲ��ŵ�ƽ������

select avg(sal) from emp 
where emp.DEPTNO in
(select e1.DEPTNO from emp e1,emp e2 
	where e2.ENAME='scott' and e1.JOB =e2.JOB and e1.ENAME != 'scott')


--(11)�г�  ���ڲ���30��Ա���Ĺ��� �벿��30��Ա��������ͬ�� Ա���������͹���

select e1.ename,e1.sal from emp e1,emp e2 
where e1.DEPTNO != 30 and e2.DEPTNO = 30 and e1.SAL = e2.SAL

--(12)�г�   н������ڲ���30����������Ա����н���    Ա��������н��

select ENAME,SAL from emp where sal>(select MAX(SAL) from emp where DEPTNO = 30 )

--(13)�г�����Ա��������  ���ʴ���1000�� �������������ƺ͹���

select ename,DNAME,SAL from emp,dept where emp.DEPTNO = dept.DEPTNO and emp.EMPNO in (
select e1.EMPNO from emp e1,emp e2 where e1.MGR = e2.EMPNO and e1.COMM >1000)
  
--(14)�г����в��ŵ���ϸ��Ϣ�Ͳ�������

select dept.*,COUNT(*) from dept,emp where dept.DEPTNO = emp.DEPTNO
group by dept.DEPTNO,DNAME,LOC

--(15)�г����ֹ�������͹���

select job,min(SAL) from emp group by JOB

--(16)�г�����Ա�����깤��,����н�ӵ͵�������

select emp.ENAME,emp.SAL*12 ��н from emp order by ��н

--(17)�г���������Ա����

select e1.ENAME from emp e1,emp e2 where e1.EMPNO = e2.MGR group by e1.ENAME

