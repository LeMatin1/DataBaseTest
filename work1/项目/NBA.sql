--创建数据库
USE master
GO
IF EXISTS (SELECT * FROM SysDataBases WHERE NAME = 'NBA')
DROP DATABASE NBA
GO
CREATE DATABASE NBA
ON PRIMARY
(
	NAME = 'NBA',
	FILENAME = 'D:\长大实训\sqlserver\db\NBA.mdf',
	SIZE = 5MB,
	FILEGROWTH = 1MB
)
LOG ON
(
	NAME = 'NBA_log',
	FILENAME = 'D:\长大实训\sqlserver\db\NBA_log.ldf',
	SIZE = 1MB,
	FILEGROWTH = 10%
)
GO

--创建数据表
USE NBA
GO

--球员表
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'player')
DROP TABLE player
GO
CREATE TABLE player
(
	playerId INT IDENTITY(1,1) PRIMARY KEY,      --球员编号
	playerName VARCHAR(20) NOT NULL,                 --姓名
	playerRole VARCHAR(8) NOT NULL,                  --角色
	birthday VARCHAR(10) NOT NULL ,                   --出生日期
	teamId INT NOT NULL                              --现役球队编号
)
GO

--球队表
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'team')
DROP TABLE team
GO
CREATE TABLE team
(
	teamId INT IDENTITY(1,1) PRIMARY KEY,        --球队编号
	teamName VARCHAR(20) UNIQUE NOT NULL,            --队名
	city VARCHAR(10) NOT NULL,                       --城市
	boss VARCHAR(20) NOT NULL,                       --老板
	coach VARCHAR(20) NOT NULL,                      --总教练
) 
GO

--比赛表
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'match')
DROP TABLE match
GO
CREATE TABLE match
(
	matchId INT IDENTITY(1,1) PRIMARY KEY,        --比赛编号
	date VARCHAR(10) NOT NULL,                        --比赛时间
	hostTeamId INT REFERENCES team(teamId) NOT NULL,  --主队编号
	guestTeamId INT REFERENCES team(teamId) NOT NULL, --客队编号
) 
GO

--数据表
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'data')
DROP TABLE data
GO
CREATE TABLE data
(
	matchId INT NOT NULL,                                --比赛编号
	teamId INT REFERENCES team(teamId) NOT NULL,         --球队编号	
	playerId INT REFERENCES player(playerId) NOT NULL,   --球员编号
	twoPointNum INT DEFAULT(0) NOT NULL,                 --两分球投篮次数
	twoHit INT DEFAULT(0) NOT NULL,                      --两分球命中次数
	threePointNum INT DEFAULT(0) NOT NULL,               --三分球投篮次数
	threeHit INT DEFAULT(0) NOT NULL,                    --三分球命中次数
	rebound INT DEFAULT(0) NOT NULL,                     --篮板球
	assist INT DEFAULT(0) NOT NULL,                      --助攻数
	block INT DEFAULT(0) NOT NULL,                       --盖帽数
) 
GO

--总冠军表
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'champion')
DROP TABLE champion
GO
CREATE TABLE champion
(
	championId INT IDENTITY(1,1) PRIMARY KEY,             --编号
	teamId INT REFERENCES team(teamId) NOT NULL,         --球队编号
	season INT NOT NULL                                  --赛季
) 
GO


--添加球队信息
INSERT INTO team VALUES ('湖人队' , '洛杉矶' , '巴斯' , '麦克-布朗')
INSERT INTO team VALUES ('公牛队' , '芝加哥' , '杰里·雷恩斯多夫' , '汤姆-希伯杜')
INSERT INTO team VALUES ('国王队' , '萨克拉门托' , '史蒂夫·鲍尔默' , '基斯-斯玛特')
INSERT INTO team VALUES ('小牛队' , '达拉斯' , '马克·库班' , '里克-卡莱尔')
INSERT INTO team VALUES ('火箭队' , '休斯顿' , '莱斯利·亚历山大' , '麦克海尔')

--添加球员信息
INSERT INTO player VALUES ('科比','得分后卫','1978/08/23' , 1)
INSERT INTO player VALUES ('霍华德','中锋','1985/12/08' , 1)
INSERT INTO player VALUES ('加索尔','中锋','1980/07/06' , 1)
INSERT INTO player VALUES ('纳什','组织后卫','1974/02/07' , 1)
INSERT INTO player VALUES ('罗斯','得分后卫','1988/10/04' , 2)
INSERT INTO player VALUES ('乔丹','得分后卫','1963/02/17' , 2)
INSERT INTO player VALUES ('皮蓬','小前锋','1965/09/25' , 2)
INSERT INTO player VALUES ('克里斯韦伯','大前锋','1973/03/01' , 3)
INSERT INTO player VALUES ('威廉姆斯','组织后卫','1975/11/18' , 3)
INSERT INTO player VALUES ('迪瓦茨','中锋','1968/02/03' , 3)
INSERT INTO player VALUES ('诺维斯基','大前锋','1978/06/19' , 4)
INSERT INTO player VALUES ('马里昂','小前锋','1978/05/07' , 4)
INSERT INTO player VALUES ('林书豪','组织后卫','1988/08/23' , 5)
INSERT INTO player VALUES ('哈登','得分后卫','1989/08/26' , 5)

--添加比赛信息
INSERT INTO match VALUES ('2013/11/12' , 1 , 2)
INSERT INTO match VALUES ('2013/11/14' , 3 , 4)
INSERT INTO match VALUES ('2013/11/15' , 5 , 1)

--添加比赛数据
INSERT INTO data VALUES (1, 1 , 1 , 10 , 6 , 3 , 2 , 8 , 5 , 1)
INSERT INTO data VALUES (1, 1 , 2 , 8 , 5 , 4 , 1 , 12 , 2 , 3)
INSERT INTO data VALUES (1, 1 , 3 , 12 , 8 , 1 , 0 , 14 , 4 , 2)
INSERT INTO data VALUES (1, 1 , 4 , 8 , 4 , 4 , 2 , 3 , 12 , 0)
INSERT INTO data VALUES (1, 2 , 5 , 12 , 8 , 4 , 2 , 9 , 6 , 1)
INSERT INTO data VALUES (1, 2 , 6 , 16 , 10 , 5 , 5 , 11 , 8 , 2)
INSERT INTO data VALUES (1, 2 , 7 , 8 , 6 , 4 , 2 , 11 , 5 , 1)

INSERT INTO data VALUES (2, 3 , 8 , 12 , 8 , 4 , 2 , 9 , 6 , 1)
INSERT INTO data VALUES (2, 3 , 9 , 8 , 4 , 4 , 2 , 2 , 12 , 0)
INSERT INTO data VALUES (2, 3 , 10 , 12 , 6 , 1 , 1 , 11 , 5 , 2)
INSERT INTO data VALUES (2, 4 , 11 , 20 , 12 , 4 , 3 , 11 , 2 , 1)
INSERT INTO data VALUES (2, 4 , 12 , 8 , 5 , 3 , 1 , 7 , 2 , 1)

INSERT INTO data VALUES (3, 5 , 13 , 12 , 6 , 3 , 2 , 3 , 8 , 0)
INSERT INTO data VALUES (3, 5 , 14 , 16 , 9 , 3 , 2 , 5 , 4 , 1)
INSERT INTO data VALUES (3, 1 , 1 , 20 , 11 , 4 , 3 , 9 , 8 , 2)
INSERT INTO data VALUES (3, 1 , 2 , 16 , 9 , 0 , 0 , 11 , 5 , 3)
INSERT INTO data VALUES (3, 1 , 3 , 12 , 7 , 0 , 0 , 13 , 3 , 2)
INSERT INTO data VALUES (3, 1 , 4 , 8 , 4 , 2 , 1 , 1 , 12 , 0)

--添加冠军表信息
INSERT INTO champion VALUES (1,2000)
INSERT INTO champion VALUES (1,2001)
INSERT INTO champion VALUES (1,2002)

INSERT INTO champion VALUES (2,1991)
INSERT INTO champion VALUES (2,1992)
INSERT INTO champion VALUES (2,1993)
INSERT INTO champion VALUES (2,1996)
INSERT INTO champion VALUES (2,1997)
INSERT INTO champion VALUES (2,1998)

INSERT INTO champion VALUES (3,1951)
INSERT INTO champion VALUES (4,2011)
INSERT INTO champion VALUES (5,1994)
INSERT INTO champion VALUES (5,1995)
go
--1.查询所有球员的信息
select * from team
select * from player
select * from match
select * from data
select * from champion


--2.查询所有球队信息
select * from team

--3.查询各个球队所有球员的详细信息
select team.teamId,teamName,city,playerName,playerRole,birthday from team,player where team.teamId=player.teamId

--4.根据球队名称查询该球队球员详细信息
select team.teamId,teamName,city,playerName,playerRole,birthday from team,player 
where team.teamId=player.teamId and teamName = '湖人队'

--5.查询所有比赛中，单场三分球命中最多的球员，列出该球员详细信息
select top 1 player.playerId,playerName,playerRole,birthday,threeHit from player,data 
where player.playerId=data.playerId order by threeHit desc

--6.查询总得分最高的球员信息
select top 1 data.playerId,playerName,birthday,sum(twoHit*2+threeHit*3) from player,data
where player.playerId = data.playerId
group by data.playerId,playerName,birthday
order by sum(twoHit*2+threeHit*3) desc

--7.查询所有冠军球队


--8.查询单场得分最高的球队
select top 1 teamName,sum(twoHit*2+threeHit*3) as 最高分 from team,data
where team.teamId=data.teamId
group by matchId,data.teamId,teamName
order by sum(twoHit*2+threeHit*3) desc
select * from data
--9.查询联盟助攻王
select * from data
select top 1 playerName,sum(assist) 总助攻 from  player,data
where player.playerId=data.playerId
group by player.playerId,playerName
order by sum(assist) desc
--10.查询所有比赛信息
select * from team
select a.date 比赛时间,b.teamName as 主场,c.teamName as 客场 from match a 
inner join team b on a.hostTeamId = b.teamId
inner join team c on a.guestTeamId = c.teamId
