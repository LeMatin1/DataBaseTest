use master
go
if exists(select * from sysdatabases where name = 'student')
drop database student
go

create database student
on primary
(
	name ='student',
	filename = 'D:\����ʵѵ\sqlserver\db\student.mdf',
	size = 5mb,
	filegrowth = 1mb
)
log on
(
	name ='student_log',
	filename = 'D:\����ʵѵ\sqlserver\db\student_log.ldf',
	size = 1mb,
	filegrowth = 10%
)
go

use student
go
if exists(select * from sysobjects where name = 'stuinfo')
drop table stuinfo
go

create table stuinfo
(
	stu_id int identity(10000,1) primary key,
	stu_name varchar(60) not null,
	stu_sex char(2) default('��') check(stu_sex = '��' or stu_sex = 'Ů') not null,
	stu_age int not null,
	stu_phone varchar(20) unique not null,
	stu_address varchar(60)
)
go

if exists(select * from sysobjects where name = 'stuscore')
drop table stuscore
go

create table stuscore
(
	stu_id int references stuinfo(stu_id),
	stu_course varchar(20) not null,
	stu_score int not null
)
go

select * from stuinfo
select * from stuscore

--����
--�﷨��insert ��into�� ���� ��(����)�� values(����1������2������3...)
--1.��ʶ�в����ֶ����
insert stuinfo(stu_id,stu_name,stu_sex,stu_age,stu_phone,stu_address)
values(10000,'����','��',17,'577987823','����')
--2.�к�ֵ�������ϲ�ƥ��
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values(10000,'����','��',17,'577987823','����')
--3.�ض��ַ��������������
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����','��2',17,'577987823','����')
--��ȷ
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����','��',17,'577987823','����')
--4.����Υ��Ψһ
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����','��',17,'577987823','����')
--5.checkԼ��
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����','��',17,'577987826','����')

insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����','��',19,'577987826','����')
--Ĭ��Լ����д��
insert stuinfo(stu_name,stu_age,stu_phone,stu_address)
values('Ǯ��',19,'577987828','����')
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('����',default,19,'577987827','����')
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('������','Ů',29,'577987829','����')


insert stuscore values(10001,'java',70)
insert stuscore values(10001,'html',90)

insert stuscore values(10004,'java',80)
insert stuscore values(10004,'html',85)

--���£�update ���� set ����=�����µ����� ��where������
update stuinfo
set stu_sex = 'Ů'
where stu_id = 10006

select * from stuinfo where stu_id = 10006

--ɾ����delete from ���� ��where������
delete from stuinfo 

