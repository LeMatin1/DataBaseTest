create table users(
	qqId int primary key identity(10000,1),--QQ��
	nickName varchar(20) not null,--�ǳ�
	sex char(2) default('Ů') check (sex = '��' or sex = 'Ů') ,--�Ա�
	remark varchar(40) ,--����ǩ��
	creatTime datetime default(GETDATE())  --ע��ʱ��
)

create table friends(
	qqId int references users(qqId) not null , --qq��
	friendId int references users(qqId),    --����QQ��
	remarkName varchar(20) not null			--��ע����
)

create table msgs(
	msgId int primary key identity(1,1),  --��ϢId
	SenderId int references users(qqId),  --������Id
	ReceiveId int references users(qqId), --������ID
	msg varchar(200) not null,			 -- ��������
	sendTime DateTime default(getDate()) --����ʱ��
)
--1
select * from users

--2
select nickName from users where sex='��'

--3
select COUNT(qqId)�û����� from users

--5
select COUNT(qqId)�û����� from users where sex = '��'

--6
select sex,COUNT(sex)�û����� from users group by sex; 

--7.1 where
select friends.qqId,users.qqId as ����ID,nickName,sex,remark,creatTime
from users,friends 
where users.qqId = friends.friendId

--7.2 inner join on
select friends.qqId,users.qqId as ����ID,nickName,sex,remark,creatTime
from users inner join friends 
on users.qqId = friends.friendId

-- 8 
select friends.qqId as ��ѯid, friends.friendId as ����ID,nickName,sex,remark,creatTime
from users inner join friends 
on friends.qqId = 10000 and users.qqId = friends.friendId

-- 9 
select friends.qqId ,count(friends.friendId) as �������� 
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
where msg like '%���%'