--select ���� from ���� ��where ������
--1.��ѯ�����С�
select * from stuinfo

--2.��ѯ������
select stu_id,stu_name,stu_phone from stuinfo

--3.��ѯǰN��
select top 2 * from stuinfo

--4.���ֶ������
select stu_name as ����,stu_sex as �Ա� from stuinfo

--5.ƴ��
--1.�ַ���
select stu_name +  stu_sex as '����&�Ա�'  from stuinfo
--2.����
select stu_id +  stu_age as 'ѧ��&����'  from stuinfo

--6.������ѯ
select * from stuinfo where stu_sex = 'Ů'
select * from stuscore where stu_id = 10004 and stu_course = 'java'

--7.��Χ��ѯ
select * from stuinfo where stu_id >= 10004 and stu_id <= 10007
select * from stuinfo where stu_id between 10004 and  10007

--8.�б������ in
select * from stuinfo where stu_id = 10004 or stu_id = 10007
select * from stuinfo where stu_id in (10004,10005,10007)

--9.ģ����ѯ
select * from stuinfo where stu_name like '��%'
select * from stuinfo where stu_name like '%��'
select * from stuinfo where stu_name like '%��%'

--10.����
select * into bakup from  stuscore
select *from bakup 

delete from stuscore
select * from stuscore

insert stuscore(stu_id,stu_course,stu_score)
select stu_id,stu_course,stu_score from bakup

--11.����
select * from stuscore order by stu_score asc ---����Ĭ��asc
select * from stuscore order by stu_score desc ---����
select top 1 * from stuscore order by stu_score desc
select top 1 * from stuscore where stu_course = 'java' order by stu_score desc

--12.�ۺϺ���
--1.sum
select sum(stu_score) as �ܷ� from stuscore
--2.avg
select avg(stu_score) as �ܷ� from stuscore
--3.count
select count(*) from stuscore
--4.max
select max(stu_score) as �ܷ� from stuscore
--5.min
select min(stu_score) as �ܷ� from stuscore

--13.����
select * from stuinfo
--�Ա�    ����
--��      3
--Ů      2 

select stu_sex as �Ա�,count(*) as ���� from stuinfo group by stu_sex

select * from stuscore

select stu_course as �γ�,avg(stu_score) as ƽ���� from stuscore group by stu_course 
having avg(stu_score) >= 70 order by avg(stu_score)

--����:1,����   2.����
--1.���� inner join ... on
select * from stuinfo
select * from stuscore

select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo inner join stuscore on stuinfo.stu_id = stuscore.stu_id
select a.stu_id,stu_name,stu_course,stu_score from stuinfo a inner join stuscore b on a.stu_id = b.stu_id
select a.stu_id,stu_name,stu_course,stu_score from stuinfo a , stuscore b where a.stu_id = b.stu_id

--2.���������������� left/right join on
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo inner join stuscore on stuinfo.stu_id = stuscore.stu_id
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo left join stuscore on stuinfo.stu_id = stuscore.stu_id
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuscore right join stuinfo on stuinfo.stu_id = stuscore.stu_id