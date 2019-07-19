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

select * from users

select * from users where sex='��'

select COUNT(qqId)�û����� from users

select COUNT(qqId)�û����� from users where sex = '��'

select sex,COUNT(sex)�û����� from users group by sex; 