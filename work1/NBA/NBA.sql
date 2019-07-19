use master
go

create database NBA_Db
on (
	name = NBA,
	filename = 'D:\DataBaseTest\work1\name.mdf',
	size = 5mb,
	filegrowth = 10%
)

log on (
	name = NBA_log,
	filename = 'D:\DataBaseTest\work1\name.ldf',
	size = 1mb,
	filegrowth = 10%
)
go

use NBA_Db
go

create table player(
	playerId int primary key identity(1,1),  --��Ա���
	playerName varchar(20) not null,			 --����
	playerRole varchar(8) not null,      --��ɫ
	birthday varchar(10) not null,      --��������
	teamId int  not null				--������ӱ��
)

create table team(
	teamId int primary key identity(1,1),	--��ӱ��
	teamName varchar(20) unique not null,   --����
	city varchar(10) not null,				--����
	boss varchar(20) not null,				--�ϰ�
	cocah varchar(20) not null				--�ܽ���
)

create table match(
	matchId int primary key identity(1,1), --�������
	date varchar(10) not null,				--����ʱ��
	hostTeamId int references team(teamId) not null , --���ӱ��
	guestTeamId int references team(teamId) not null --�Ͷӱ��
) 

create table data(
	matchId int not null ,--�������
	teamId int not null references team(teamId), -- ��ӱ��
	playerId int not null references player(playerId), -- ��Ա���
	twoPointNum int not null default(0),  -- ������Ͷ������
	twoHit int not null default(0),		-- ���������д���
	threePointNum int not null default(0),	-- ������Ͷ������
	threeHit int not null default(0),	-- ���������д���
	rebound int not null default(0),	-- ������
	assist int not null default(0),	-- ������
	block int not null default(0)  -- ��ñ��
)

create table champion(
	championId int primary key identity(1,1),   --���
	teamId int references team(teamId) not null,--��ӱ��
	season int not null  --����
)

--1
select * from player

--2
select * from team

--3
select player.* 
from player inner join team 
on player.teamId=team.teamId and team.teamId =1

--4
select player.* 
from player inner join team 
on player.teamId=team.teamId and team.teamName = '1111'

--5
select top 1 player.* ,data.threeHit
from player inner join data 
on data.playerId = player.playerId 
order by data.threePointNum desc

--6
select player.* ,�÷� from (select top 1 player.playerId ,SUM(twoHit)*2+SUM(threeHit)*3 as �÷�
	from player , data
	where player.playerId = data.playerId
	group by player.playerId)T,player
where t.playerId = player.playerId


--7
select team.*,champion.season 
from champion,team
where champion.teamId = team.teamId

--8
select (SUM(twoHit)*2+SUM(threeHit)*3) as �÷�,data.matchId,team.teamId
from team , data
where team.teamId = data.teamId
group by matchId,team.teamId
order by �÷� desc


--9
select top 1 player.playerId ,SUM(assist) ������
from player , data
where player.playerId = data.playerId
group by player.playerId
order by ������ desc

--10
select match.*,data.* 
from match,data
where match.matchId = data.matchId


