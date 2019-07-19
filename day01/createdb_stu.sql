use master
go
if exists(select * from sysdatabases where name = 'student')
drop database student
go

create database student
on primary
(
	name ='student',
	filename = 'D:\长大实训\sqlserver\db\student.mdf',
	size = 5mb,
	filegrowth = 1mb
)
log on
(
	name ='student_log',
	filename = 'D:\长大实训\sqlserver\db\student_log.ldf',
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
	stu_sex char(2) default('男') check(stu_sex = '男' or stu_sex = '女') not null,
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

--新增
--语法：insert 【into】 表名 【(列名)】 values(数据1，数据2，数据3...)
--1.标识列不能手动添加
insert stuinfo(stu_id,stu_name,stu_sex,stu_age,stu_phone,stu_address)
values(10000,'张三','男',17,'577987823','地球')
--2.列和值在数量上不匹配
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values(10000,'张三','男',17,'577987823','地球')
--3.截断字符串或二进制数据
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('张三','男2',17,'577987823','地球')
--正确
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('张三','男',17,'577987823','地球')
--4.不能违反唯一
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('李四','男',17,'577987823','地球')
--5.check约束
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('李四','妖',17,'577987826','地球')

insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('李四','男',19,'577987826','地球')
--默认约束的写法
insert stuinfo(stu_name,stu_age,stu_phone,stu_address)
values('钱五',19,'577987828','地球')
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('赵六',default,19,'577987827','地球')
insert stuinfo(stu_name,stu_sex,stu_age,stu_phone,stu_address)
values('蔡徐坤','女',29,'577987829','火星')


insert stuscore values(10001,'java',70)
insert stuscore values(10001,'html',90)

insert stuscore values(10004,'java',80)
insert stuscore values(10004,'html',85)

--更新：update 表名 set 列名=待更新的数据 【where条件】
update stuinfo
set stu_sex = '女'
where stu_id = 10006

select * from stuinfo where stu_id = 10006

--删除：delete from 表名 【where条件】
delete from stuinfo 

