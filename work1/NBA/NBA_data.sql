insert into player(playerName,playerRole,birthday,teamId)
values ('Aaaa','ǰ��','1990-2-1',1),
('Bbbb','�г�','1991-4-5',1),
('Cccc','����','1994-2-1',1),
('Eeee','ǰ��','1993-2-1',2),
('Ffff','�г�','1991-2-1',2),
('Gggg','����','1993-2-1',2),
('Hhhh','ǰ��','1991-2-1',3),
('Iiii','�г�','1995-2-1',3),
('Jjjj','����','1997-2-1',3)

insert into team(teamName,city,boss,cocah)
values('1111','Onecity','Oboss','Ococah'),
('2222','Twocity','Tboss','Tcocah'),
('3333','Thrcity','Hboss','Hcocah')

insert into match(date,hostTeamId,guestTeamId)
values('2019-1-1',1,2),
('2019-1-7',1,3),
('2019-1-9',3,2)

insert into data(matchId,teamId,playerId,twoPointNum,twoHit
,threePointNum,threeHit,rebound,assist,block) values
(1,1,1,5,3,4,2,3,3,1),
(1,1,2,7,4,7,6,4,2,5),
(2,1,1,8,6,4,3,4,3,4),
(2,3,7,6,4,5,1,1,4,3),
(3,2,4,7,4,8,5,4,5,3),
(3,2,5,6,3,5,2,2,2,2)

insert into champion(teamId,season)
values(1,1),
(1,2),
(2,3)