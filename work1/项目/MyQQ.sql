--�������ݿ�
USE master
GO
IF EXISTS (SELECT * FROM SysDataBases WHERE NAME = 'MyQQ')
DROP DATABASE MyQQ
GO
CREATE DATABASE MyQQ
ON PRIMARY
(
	NAME = 'MyQQ',
	FILENAME = 'D:\����ʵѵ\sqlserver\db\MyQQ.mdf',
	SIZE = 5MB,
	FILEGROWTH = 1MB
)
LOG ON
(
	NAME = 'MyQQ_log',
	FILENAME = 'D:\����ʵѵ\sqlserver\db\MyQQ_log.ldf',
	SIZE = 1MB,
	FILEGROWTH = 10%
)
GO

--�������ݱ�
USE MyQQ
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'users')
DROP TABLE users
GO
CREATE TABLE users
(
	qqId INT IDENTITY(10000,1) PRIMARY KEY,      --QQ��
	nickName VARCHAR(20) NOT NULL,               --�ǳ�
	sex CHAR(2) CHECK (sex='��' OR sex='Ů') DEFAULT ('Ů') NOT NULL,                        --�Ա�
	remark VARCHAR(40),                          --��ע                          
	createTime DATETIME DEFAULT(GETDATE())       --ע��ʱ��
)
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'friends')
DROP TABLE friends
GO
CREATE TABLE friends
(
	qqId INT REFERENCES users(qqId) NOT NULL,    --QQ����
	friendId INT REFERENCES users(qqId),         --����QQ����
	remarkName VARCHAR(20) NOT NULL              --��ע���ƣ���ͬ���ǳ�
)
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'msgs')
DROP TABLE msgs
GO
CREATE TABLE msgs
(
	msgId INT PRIMARY KEY IDENTITY(1,1),         --��Ϣ���
	senderId INT REFERENCES users(qqId),         --������Id
	receiveId INT REFERENCES users(qqId),        --������Id
	msg VARCHAR(200) NOT NULL,                   --��������
	sendTime DATETIME DEFAULT(GETDATE())         --����ʱ��
	
)
GO

--����û�����
INSERT INTO users (nickName , sex , remark ) VALUES ('�����' , '��' , '�����ʥ����һ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('��˽�' , '��' , '����Ԫ˧����һ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('ɳ����' , '��' , '��ɳ����һ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('������' , '��' , '���Ƶ���һ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('���' , 'Ů' , '��ŮֻӦ�����У��˼��ĵü�����')
INSERT INTO users (nickName , sex , remark ) VALUES ('ܽ��' , 'Ů' , 'ɵ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('�ǵ�' , '��' , '����֮��')
INSERT INTO users (nickName , sex , remark ) VALUES ('�����' , '��' , 'NBA�漣')
INSERT INTO users (nickName , sex , remark ) VALUES ('�����' , '��' , '������')
INSERT INTO users (nickName , sex , remark ) VALUES ('��ĸ����' , 'Ů' , '��̫��һ��')
INSERT INTO users (nickName , sex , remark ) VALUES ('С��' , '��' , '���裬������֣�')
INSERT INTO users (nickName , sex , remark ) VALUES ('����' , 'Ů' , 'С�£������ڸ�ʲô��')

--��Ӻ�������
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10001 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10002 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10003 , 'ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10009 , '����̫��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10002 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10003 , 'ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10000 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10009 , 'MADAM')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10000 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10001 , '��ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10003 , 'ʦ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10009 , '�ϼ��쵼')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10000 , '���')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10001 , '�˽�')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10002 , '��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10004 , 10005 , 'ɵ��ǰ��')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10005 , 10004 , '���')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10006 , 10007 , 'lin')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10006 , 10008 , 'Shaquille')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10007 , 10006 , '����ү')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10007 , 10008 , '�����')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10008 , 10006 , 'JORDAN')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10008 , 10007 , 'china lin')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10010 , 10011 , '����')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10011 , 10010 , 'С��')

--�����Ϣ����
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10000 , 10001 , '���ӣ�������͵��')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10001 , 10000 , '��磬�´β�����')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10000 , 10001 , '���ӣ����ո�ȥ����')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10004 , 10005 , 'ܽ�ش��裬���')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10004 , 10005 , 'ܽ�ش��裬������û���ҵĺÿ����ۿ���������')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10005 , 10004 , '��㣬�ҼҲ����㳦��')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10005 , 10004 , '�Ҽ�ֻװɵ��')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10006 , 10007 , 'С���ӣ������Ĳ���')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10007 , 10006 , '������ͬ־ѧϰ��')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10008 , 10007 , '���Ǵ�ɣ�')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10007 , 10008 , '��������ȣ�')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10010 , 10011 , '���飬������֣�')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10011 , 10010 , '����˵�˶��ٴΣ����һ����֣�')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10010 , 10011 , '���飬���йⲨ��')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10011 , 10010 , '���������̸�צ��')
go
--1.��ѯ�û�������Ϣ
select * from users
select * from friends
select * from msgs

--2.��ѯ�Ա�Ϊ���С����û��ǳ�
select nickname from users where sex = '��'

--3.��ѯQQ�û�����
select count(*) as QQ�û����� from users

--5.��ѯ�Ա�Ϊ���С����û�����
select count(*) as QQ�û����� from users where sex = '��'

--6.ʹ�÷������ֱ��ѯ�С�Ů�û�����
select sex as �Ա�,count(*) as �û����� from users group by sex

--7.����QQ����Ϊ10000�Ĳ�ѯ���еĺ�����Ϣ
--����1��ʹ��where
select friends.qqId,friends.friendId,nickName,sex,remark from users,friends 
where users.qqId = friends.friendId and friends.qqId=10000

--����2��ʹ��inner join on
select friends.qqId,friends.friendId,nickName,sex,remark from users inner join friends 
on users.qqId = friends.friendId and friends.qqId=10000

--����3��ʹ���Ӳ�ѯ


--8.��ѯ��ĳQQ�����Ϊ���ѵ������û���Ϣ
--����1��ʹ��where
select friends.qqId,friends.friendId,nickName,sex,remark from users,friends 
where users.qqId = friends.qqId and friends.friendId = 10000

--����2��ʹ��inner join on


--����3��ʹ���Ӳ�ѯ


--9.ʹ�÷�������ѯ����QQ�û��ĺ�������
select qqid,count(friendId) as ��������  from friends group by qqid

--10.��ѯ���ݴ���10��������Ϣ
select * from msgs where len(msg) > 10

--11.��ѯ���ݰ�������á���������Ϣ
select * from msgs where msg like '%���%'
