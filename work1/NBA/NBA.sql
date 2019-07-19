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
	playerId int primary key identity(1,1),  --球员编号
	playerName varchar(20) not null,			 --姓名
	playerRole varchar(8) not null,      --角色
	birthday varchar(10) not null,      --出生日期
	teamId int  not null				--现役球队编号
)

create table team(
	teamId int primary key identity(1,1),	--球队编号
	teamName varchar(20) unique not null,   --队名
	city varchar(10) not null,				--城市
	boss varchar(20) not null,				--老板
	cocah varchar(20) not null				--总教练
)

create table match(
	matchId int primary key identity(1,1), --比赛编号
	date varchar(10) not null,				--比赛时间
	hostTeamId int references team(teamId) not null , --主队编号
	guestTeamId int references team(teamId) not null --客队编号
) 

create table data(
	matchId int not null ,--比赛编号
	teamId int not null references team(teamId), -- 球队编号
	playerId int not null references player(playerId), -- 球员编号
	twoPointNum int not null default(0),  -- 两分球投篮次数
	twoHit int not null default(0),		-- 两分球命中次数
	threePointNum int not null default(0),	-- 三分球投篮次数
	threeHit int not null default(0),	-- 三分球命中次数
	rebound int not null default(0),	-- 篮板球
	assist int not null default(0),	-- 助攻数
	block int not null default(0)  -- 盖帽数
)

create table champion(
	championId int primary key identity(1,1),   --编号
	teamId int references team(teamId) not null,--球队编号
	season int not null  --赛季
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
select player.* ,得分 from (select top 1 player.playerId ,SUM(twoHit)*2+SUM(threeHit)*3 as 得分
	from player , data
	where player.playerId = data.playerId
	group by player.playerId)T,player
where t.playerId = player.playerId


--7
select team.*,champion.season 
from champion,team
where champion.teamId = team.teamId

--8
select (SUM(twoHit)*2+SUM(threeHit)*3) as 得分,data.matchId,team.teamId
from team , data
where team.teamId = data.teamId
group by matchId,team.teamId
order by 得分 desc


--9
select top 1 player.playerId ,SUM(assist) 助攻数
from player , data
where player.playerId = data.playerId
group by player.playerId
order by 助攻数 desc

--10
select match.*,data.* 
from match,data
where match.matchId = data.matchId


