use master
go
if exists(select * from sysdatabases where name = 'studentTest')
drop database studentTest
go

create database studentTest
on(
	name = studentTest,
	filename = 'D:\长大实训\db\studentTest.mdf',
	size = 5mb,
	filegrowth = 1mb
)

log on(
	name = studentTest_log,
	filename = 'D:\长大实训\db\studentTest.ldf',
	size = 1mb,
	filegrowth = 10%
)
go

use studentTest
go

create table stu_info(
	stu_id int primary key identity(10000,1)

)
