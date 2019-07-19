--select 列名 from 表名 【where 条件】
--1.查询所有列、
select * from stuinfo

--2.查询若干列
select stu_id,stu_name,stu_phone from stuinfo

--3.查询前N笔
select top 2 * from stuinfo

--4.给字段起别名
select stu_name as 姓名,stu_sex as 性别 from stuinfo

--5.拼接
--1.字符串
select stu_name +  stu_sex as '姓名&性别'  from stuinfo
--2.数字
select stu_id +  stu_age as '学号&年龄'  from stuinfo

--6.条件查询
select * from stuinfo where stu_sex = '女'
select * from stuscore where stu_id = 10004 and stu_course = 'java'

--7.范围查询
select * from stuinfo where stu_id >= 10004 and stu_id <= 10007
select * from stuinfo where stu_id between 10004 and  10007

--8.列表运算符 in
select * from stuinfo where stu_id = 10004 or stu_id = 10007
select * from stuinfo where stu_id in (10004,10005,10007)

--9.模糊查询
select * from stuinfo where stu_name like '蔡%'
select * from stuinfo where stu_name like '%坤'
select * from stuinfo where stu_name like '%徐%'

--10.备份
select * into bakup from  stuscore
select *from bakup 

delete from stuscore
select * from stuscore

insert stuscore(stu_id,stu_course,stu_score)
select stu_id,stu_course,stu_score from bakup

--11.排序
select * from stuscore order by stu_score asc ---升序：默认asc
select * from stuscore order by stu_score desc ---降序
select top 1 * from stuscore order by stu_score desc
select top 1 * from stuscore where stu_course = 'java' order by stu_score desc

--12.聚合函数
--1.sum
select sum(stu_score) as 总分 from stuscore
--2.avg
select avg(stu_score) as 总分 from stuscore
--3.count
select count(*) from stuscore
--4.max
select max(stu_score) as 总分 from stuscore
--5.min
select min(stu_score) as 总分 from stuscore

--13.分组
select * from stuinfo
--性别    人数
--男      3
--女      2 

select stu_sex as 性别,count(*) as 人数 from stuinfo group by stu_sex

select * from stuscore

select stu_course as 课程,avg(stu_score) as 平均分 from stuscore group by stu_course 
having avg(stu_score) >= 70 order by avg(stu_score)

--联表:1,内联   2.外联
--1.内联 inner join ... on
select * from stuinfo
select * from stuscore

select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo inner join stuscore on stuinfo.stu_id = stuscore.stu_id
select a.stu_id,stu_name,stu_course,stu_score from stuinfo a inner join stuscore b on a.stu_id = b.stu_id
select a.stu_id,stu_name,stu_course,stu_score from stuinfo a , stuscore b where a.stu_id = b.stu_id

--2.外联：左联、右联 left/right join on
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo inner join stuscore on stuinfo.stu_id = stuscore.stu_id
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuinfo left join stuscore on stuinfo.stu_id = stuscore.stu_id
select stuinfo.stu_id,stu_name,stu_course,stu_score from stuscore right join stuinfo on stuinfo.stu_id = stuscore.stu_id