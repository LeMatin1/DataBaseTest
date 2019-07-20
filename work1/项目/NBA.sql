--�������ݿ�
USE master
GO
IF EXISTS (SELECT * FROM SysDataBases WHERE NAME = 'NBA')
DROP DATABASE NBA
GO
CREATE DATABASE NBA
ON PRIMARY
(
	NAME = 'NBA',
	FILENAME = 'D:\����ʵѵ\sqlserver\db\NBA.mdf',
	SIZE = 5MB,
	FILEGROWTH = 1MB
)
LOG ON
(
	NAME = 'NBA_log',
	FILENAME = 'D:\����ʵѵ\sqlserver\db\NBA_log.ldf',
	SIZE = 1MB,
	FILEGROWTH = 10%
)
GO

--�������ݱ�
USE NBA
GO

--��Ա��
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'player')
DROP TABLE player
GO
CREATE TABLE player
(
	playerId INT IDENTITY(1,1) PRIMARY KEY,      --��Ա���
	playerName VARCHAR(20) NOT NULL,                 --����
	playerRole VARCHAR(8) NOT NULL,                  --��ɫ
	birthday VARCHAR(10) NOT NULL ,                   --��������
	teamId INT NOT NULL                              --������ӱ��
)
GO

--��ӱ�
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'team')
DROP TABLE team
GO
CREATE TABLE team
(
	teamId INT IDENTITY(1,1) PRIMARY KEY,        --��ӱ��
	teamName VARCHAR(20) UNIQUE NOT NULL,            --����
	city VARCHAR(10) NOT NULL,                       --����
	boss VARCHAR(20) NOT NULL,                       --�ϰ�
	coach VARCHAR(20) NOT NULL,                      --�ܽ���
) 
GO

--������
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'match')
DROP TABLE match
GO
CREATE TABLE match
(
	matchId INT IDENTITY(1,1) PRIMARY KEY,        --�������
	date VARCHAR(10) NOT NULL,                        --����ʱ��
	hostTeamId INT REFERENCES team(teamId) NOT NULL,  --���ӱ��
	guestTeamId INT REFERENCES team(teamId) NOT NULL, --�Ͷӱ��
) 
GO

--���ݱ�
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'data')
DROP TABLE data
GO
CREATE TABLE data
(
	matchId INT NOT NULL,                                --�������
	teamId INT REFERENCES team(teamId) NOT NULL,         --��ӱ��	
	playerId INT REFERENCES player(playerId) NOT NULL,   --��Ա���
	twoPointNum INT DEFAULT(0) NOT NULL,                 --������Ͷ������
	twoHit INT DEFAULT(0) NOT NULL,                      --���������д���
	threePointNum INT DEFAULT(0) NOT NULL,               --������Ͷ������
	threeHit INT DEFAULT(0) NOT NULL,                    --���������д���
	rebound INT DEFAULT(0) NOT NULL,                     --������
	assist INT DEFAULT(0) NOT NULL,                      --������
	block INT DEFAULT(0) NOT NULL,                       --��ñ��
) 
GO

--�ܹھ���
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'champion')
DROP TABLE champion
GO
CREATE TABLE champion
(
	championId INT IDENTITY(1,1) PRIMARY KEY,             --���
	teamId INT REFERENCES team(teamId) NOT NULL,         --��ӱ��
	season INT NOT NULL                                  --����
) 
GO


--��������Ϣ
INSERT INTO team VALUES ('���˶�' , '��ɼ�' , '��˹' , '���-����')
INSERT INTO team VALUES ('��ţ��' , '֥�Ӹ�' , '����׶�˹���' , '��ķ-ϣ����')
INSERT INTO team VALUES ('������' , '����������' , 'ʷ�ٷ򡤱���Ĭ' , '��˹-˹����')
INSERT INTO team VALUES ('Сţ��' , '����˹' , '��ˡ����' , '���-������')
INSERT INTO team VALUES ('�����' , '��˹��' , '��˹��������ɽ��' , '��˺���')

--�����Ա��Ϣ
INSERT INTO player VALUES ('�Ʊ�','�÷ֺ���','1978/08/23' , 1)
INSERT INTO player VALUES ('������','�з�','1985/12/08' , 1)
INSERT INTO player VALUES ('������','�з�','1980/07/06' , 1)
INSERT INTO player VALUES ('��ʲ','��֯����','1974/02/07' , 1)
INSERT INTO player VALUES ('��˹','�÷ֺ���','1988/10/04' , 2)
INSERT INTO player VALUES ('�ǵ�','�÷ֺ���','1963/02/17' , 2)
INSERT INTO player VALUES ('Ƥ��','Сǰ��','1965/09/25' , 2)
INSERT INTO player VALUES ('����˹Τ��','��ǰ��','1973/03/01' , 3)
INSERT INTO player VALUES ('����ķ˹','��֯����','1975/11/18' , 3)
INSERT INTO player VALUES ('���ߴ�','�з�','1968/02/03' , 3)
INSERT INTO player VALUES ('ŵά˹��','��ǰ��','1978/06/19' , 4)
INSERT INTO player VALUES ('���ﰺ','Сǰ��','1978/05/07' , 4)
INSERT INTO player VALUES ('�����','��֯����','1988/08/23' , 5)
INSERT INTO player VALUES ('����','�÷ֺ���','1989/08/26' , 5)

--��ӱ�����Ϣ
INSERT INTO match VALUES ('2013/11/12' , 1 , 2)
INSERT INTO match VALUES ('2013/11/14' , 3 , 4)
INSERT INTO match VALUES ('2013/11/15' , 5 , 1)

--��ӱ�������
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

--��ӹھ�����Ϣ
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
--1.��ѯ������Ա����Ϣ
select * from team
select * from player
select * from match
select * from data
select * from champion


--2.��ѯ���������Ϣ
select * from team

--3.��ѯ�������������Ա����ϸ��Ϣ
select team.teamId,teamName,city,playerName,playerRole,birthday from team,player where team.teamId=player.teamId

--4.����������Ʋ�ѯ�������Ա��ϸ��Ϣ
select team.teamId,teamName,city,playerName,playerRole,birthday from team,player 
where team.teamId=player.teamId and teamName = '���˶�'

--5.��ѯ���б����У���������������������Ա���г�����Ա��ϸ��Ϣ
select top 1 player.playerId,playerName,playerRole,birthday,threeHit from player,data 
where player.playerId=data.playerId order by threeHit desc

--6.��ѯ�ܵ÷���ߵ���Ա��Ϣ
select top 1 data.playerId,playerName,birthday,sum(twoHit*2+threeHit*3) from player,data
where player.playerId = data.playerId
group by data.playerId,playerName,birthday
order by sum(twoHit*2+threeHit*3) desc

--7.��ѯ���йھ����


--8.��ѯ�����÷���ߵ����
select top 1 teamName,sum(twoHit*2+threeHit*3) as ��߷� from team,data
where team.teamId=data.teamId
group by matchId,data.teamId,teamName
order by sum(twoHit*2+threeHit*3) desc
select * from data
--9.��ѯ����������
select * from data
select top 1 playerName,sum(assist) ������ from  player,data
where player.playerId=data.playerId
group by player.playerId,playerName
order by sum(assist) desc
--10.��ѯ���б�����Ϣ
select * from team
select a.date ����ʱ��,b.teamName as ����,c.teamName as �ͳ� from match a 
inner join team b on a.hostTeamId = b.teamId
inner join team c on a.guestTeamId = c.teamId
