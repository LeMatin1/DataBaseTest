--(1)�г�������3��Ա���Ĳ�����Ϣ

select COUNT(*) Ա����,DEPT.DEPTNO,dept.DNAME,dept.LOC as ���� from emp,dept where emp.DEPTNO = dept.DEPTNO 
group by DEPT.DEPTNO,dept.DNAME,dept.LOC having  COUNT(*) > 3

--(2)�г����ʱȡ�SMITH�����Ա�������Լ�����

select * from emp

select e2.ENAME,e2.SAL from emp e1,emp e2
where e1.ENAME = 'smith' and e2.SAL>e1.SAL

--(3)�г�����Ա������������ֱ���ϼ����������ϼ��Ĳ�������

select e1.ENAME,e2.ENAME,DNAME from emp e1,emp e2,dept
 where e1.MGR = e2.EMPNO and e2.DEPTNO = dept.DEPTNO


--(4)�г��ܹ�����������ֱ���ϼ�������Ա��

select e1.ENAME,e1.HIREDATE,e2.ENAME,e2.HIREDATE from emp e1,emp e2
where e1.MGR = e2.EMPNO and e1.HIREDATE<e2.HIREDATE


--(5)�г��������ƺ���Щ���ŵ�Ա����Ϣ��ͬʱ�г���Щû��Ա���Ĳ���


--(6)�г����бȡ�CLERK��������Ա��ƽ�����ʸߵ�Ա�����������䲿������

 
--(7)�г�ƽ��н�����1500�Ĺ��������Լ����Ա������


--(8)�г��ڲ��š�SALES�������۲���������Ա�����ϼ���ƽ������


--(9)�г�н����ڹ�˾ƽ��н�������Ա����


--(10)�г��롰SCOTT��������ͬ����������Ա�����ڲ��ŵ�ƽ������


--(11)�г�  ���ڲ���30��Ա���Ĺ��� �벿��30��Ա��������ͬ�� Ա���������͹���


--(12)�г�   н������ڲ���30����������Ա����н���    Ա��������н��


--(13)�г�����Ա��������  ���ʴ���1000�� �������������ƺ͹���

  
--(14)�г����в��ŵ���ϸ��Ϣ�Ͳ�������


--(15)�г����ֹ�������͹���


--(16)�г�����Ա�����깤��,����н�ӵ͵�������


--(17)�г���������Ա����

