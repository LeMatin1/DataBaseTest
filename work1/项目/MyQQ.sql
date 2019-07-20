--创建数据库
USE master
GO
IF EXISTS (SELECT * FROM SysDataBases WHERE NAME = 'MyQQ')
DROP DATABASE MyQQ
GO
CREATE DATABASE MyQQ
ON PRIMARY
(
	NAME = 'MyQQ',
	FILENAME = 'D:\长大实训\sqlserver\db\MyQQ.mdf',
	SIZE = 5MB,
	FILEGROWTH = 1MB
)
LOG ON
(
	NAME = 'MyQQ_log',
	FILENAME = 'D:\长大实训\sqlserver\db\MyQQ_log.ldf',
	SIZE = 1MB,
	FILEGROWTH = 10%
)
GO

--创建数据表
USE MyQQ
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'users')
DROP TABLE users
GO
CREATE TABLE users
(
	qqId INT IDENTITY(10000,1) PRIMARY KEY,      --QQ号
	nickName VARCHAR(20) NOT NULL,               --昵称
	sex CHAR(2) CHECK (sex='男' OR sex='女') DEFAULT ('女') NOT NULL,                        --性别
	remark VARCHAR(40),                          --备注                          
	createTime DATETIME DEFAULT(GETDATE())       --注册时间
)
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'friends')
DROP TABLE friends
GO
CREATE TABLE friends
(
	qqId INT REFERENCES users(qqId) NOT NULL,    --QQ号码
	friendId INT REFERENCES users(qqId),         --好友QQ号码
	remarkName VARCHAR(20) NOT NULL              --备注名称，不同于昵称
)
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'msgs')
DROP TABLE msgs
GO
CREATE TABLE msgs
(
	msgId INT PRIMARY KEY IDENTITY(1,1),         --信息编号
	senderId INT REFERENCES users(qqId),         --发送者Id
	receiveId INT REFERENCES users(qqId),        --接受者Id
	msg VARCHAR(200) NOT NULL,                   --发送内容
	sendTime DATETIME DEFAULT(GETDATE())         --发送时间
	
)
GO

--添加用户数据
INSERT INTO users (nickName , sex , remark ) VALUES ('孙悟空' , '男' , '齐天大圣到此一游')
INSERT INTO users (nickName , sex , remark ) VALUES ('猪八戒' , '男' , '天蓬元帅到此一游')
INSERT INTO users (nickName , sex , remark ) VALUES ('沙和尚' , '男' , '老沙到此一游')
INSERT INTO users (nickName , sex , remark ) VALUES ('唐玄奘' , '男' , '老唐到此一游')
INSERT INTO users (nickName , sex , remark ) VALUES ('凤姐' , '女' , '此女只应厕所有，人间哪得几回闻')
INSERT INTO users (nickName , sex , remark ) VALUES ('芙蓉' , '女' , '傻叉')
INSERT INTO users (nickName , sex , remark ) VALUES ('乔丹' , '男' , '篮球之神')
INSERT INTO users (nickName , sex , remark ) VALUES ('林书豪' , '男' , 'NBA奇迹')
INSERT INTO users (nickName , sex , remark ) VALUES ('奥尼尔' , '男' , '大鲨鱼')
INSERT INTO users (nickName , sex , remark ) VALUES ('王母娘娘' , '女' , '老太婆一个')
INSERT INTO users (nickName , sex , remark ) VALUES ('小新' , '男' , '妈妈，你回来乐！')
INSERT INTO users (nickName , sex , remark ) VALUES ('美伢' , '女' , '小新，你又在干什么！')

--添加好友数据
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10001 , '二师兄')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10002 , '三师弟')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10003 , '师父')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10000 , 10009 , '死老太婆')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10002 , '三师弟')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10003 , '师父')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10000 , '大师兄')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10001 , 10009 , 'MADAM')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10000 , '大师兄')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10001 , '二师兄')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10003 , '师父')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10002 , 10009 , '上级领导')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10000 , '悟空')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10001 , '八戒')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10003 , 10002 , '悟净')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10004 , 10005 , '傻×前辈')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10005 , 10004 , '疯姐')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10006 , 10007 , 'lin')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10006 , 10008 , 'Shaquille')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10007 , 10006 , '乔老爷')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10007 , 10008 , '奥尼尔')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10008 , 10006 , 'JORDAN')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10008 , 10007 , 'china lin')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10010 , 10011 , '老妈')
INSERT INTO friends (qqid , friendId , remarkName) VALUES (10011 , 10010 , '小新')

--添加信息数据
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10000 , 10001 , '呆子，你又在偷懒')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10001 , 10000 , '猴哥，下次不敢了')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10000 , 10001 , '呆子，我勒个去啊！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10004 , 10005 , '芙蓉大妈，你好')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10004 , 10005 , '芙蓉大妈，你的嘴巴没有我的好看！哇卡卡卡卡！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10005 , 10004 , '疯姐，我家不卖香肠！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10005 , 10004 , '我家只装傻！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10006 , 10007 , '小伙子，最近打的不错！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10007 , 10006 , '向老乔同志学习！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10008 , 10007 , '咱们搭档吧！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10007 , 10008 , '大叔减肥先！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10010 , 10011 , '麻麻，你回来乐！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10011 , 10010 , '跟你说了多少次，是我回来乐！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10010 , 10011 , '麻麻，动感光波！')
INSERT INTO msgs (senderId , receiveId , msg) VALUES (10011 , 10010 , '动感你奶奶个爪！')
go
--1.查询用户所有信息
select * from users
select * from friends
select * from msgs

--2.查询性别为“男”的用户昵称
select nickname from users where sex = '男'

--3.查询QQ用户总数
select count(*) as QQ用户总数 from users

--5.查询性别为“男”的用户数量
select count(*) as QQ用户总数 from users where sex = '男'

--6.使用分组语句分别查询男、女用户数量
select sex as 性别,count(*) as 用户数量 from users group by sex

--7.根据QQ号码为10000的查询所有的好友信息
--方法1，使用where
select friends.qqId,friends.friendId,nickName,sex,remark from users,friends 
where users.qqId = friends.friendId and friends.qqId=10000

--方法2，使用inner join on
select friends.qqId,friends.friendId,nickName,sex,remark from users inner join friends 
on users.qqId = friends.friendId and friends.qqId=10000

--方法3，使用子查询


--8.查询将某QQ号码加为好友的所有用户信息
--方法1，使用where
select friends.qqId,friends.friendId,nickName,sex,remark from users,friends 
where users.qqId = friends.qqId and friends.friendId = 10000

--方法2，使用inner join on


--方法3，使用子查询


--9.使用分组语句查询所有QQ用户的好友数量
select qqid,count(friendId) as 好友数量  from friends group by qqid

--10.查询内容大于10的所有信息
select * from msgs where len(msg) > 10

--11.查询内容包含“你好”的所有信息
select * from msgs where msg like '%你好%'
