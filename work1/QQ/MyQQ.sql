create table users(
	qqId int primary key identity(10000,1),--QQ号
	nickName varchar(20) not null,--昵称
	sex char(2) default('女') check (sex = '男' or sex = '女') ,--性别
	remark varchar(40) ,--个性签名
	creatTime datetime default(GETDATE())  --注册时间
)

create table friends(
	qqId int references users(qqId) not null , --qq号
	friendId int references users(qqId),    --好友QQ号
	remarkName varchar(20) not null			--备注名称
)

create table msgs(
	msgId int primary key identity(1,1),  --消息Id
	SenderId int references users(qqId),  --发送者Id
	ReceiveId int references users(qqId), --接受者ID
	msg varchar(200) not null,			 -- 发送内容
	sendTime DateTime default(getDate()) --发送时间
)
--1
select * from users

--2
select nickName from users where sex='男'

--3
select COUNT(qqId)用户总数 from users

--5
select COUNT(qqId)用户总数 from users where sex = '男'

--6
select sex,COUNT(sex)用户数量 from users group by sex; 

--7.1 where
select friends.qqId,users.qqId as 好友ID,nickName,sex,remark,creatTime
from users,friends 
where users.qqId = friends.friendId

--7.2 inner join on
select friends.qqId,users.qqId as 好友ID,nickName,sex,remark,creatTime
from users inner join friends 
on users.qqId = friends.friendId

-- 8 
select friends.qqId as 查询id, friends.friendId as 好友ID,nickName,sex,remark,creatTime
from users inner join friends 
on friends.qqId = 10000 and users.qqId = friends.friendId

-- 9 
select friends.qqId ,count(friends.friendId) as 好友数量 
from users inner join friends
on users.qqId = friends.friendId 
group by friends.qqId

-- 10 
select msgs.* 
from msgs
where len(msg)>10;

-- 11
select msgs.*
from msgs
where msg like '%你好%'