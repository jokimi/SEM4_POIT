use UNIVER;

----- 1

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [Преподаватель];
go
create view [Преподаватель]
	as select TEACHER[Код], TEACHER_NAME[Имя], GENDER[Пол], PULPIT[Кафедра]
	from TEACHER;
go
select * from Преподаватель;

----- 2

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [Количество_кафедр];
go
create view [Количество_кафедр]
	as select FACULTY_NAME[Факультет], COUNT(PULPIT)[Количество кафедр]
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY 
	group by FACULTY_NAME;
go
select * from Количество_кафедр;

----- 3

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [Аудитории];
go
create view [Аудитории]
	as select AUDITORIUM[Номер_аудитории], AUDITORIUM_TYPE[Название]
	from AUDITORIUM 
	where AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%';
go
insert Аудитории values('734-1', 'ЛК');
update Аудитории
	set Номер_аудитории = '634-1' where Номер_аудитории = '734-1';
delete from Аудитории
	where Номер_аудитории = '634-1';
go
select * from Аудитории;

----- 4

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [Лекционные_аудитории];
go
create view Лекционные_аудитории
	as select AUDITORIUM, AUDITORIUM_TYPE
	from AUDITORIUM 
	where AUDITORIUM.AUDITORIUM_TYPE like 'ЛК%' with check option;
go
update Лекционные_аудитории
	set AUDITORIUM = '834-1' where AUDITORIUM = '934-1';
delete from Лекционные_аудитории
	where AUDITORIUM = '834-1';
insert Лекционные_аудитории values('934-1', 'ЛК');
--insert Лекционные_аудитории values('534-1', 'ЛБ');
go
select * from Лекционные_аудитории;

----- 5

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view[Дисциплины];
go
create view Дисциплины
	as select top 10 SUBJECT, SUBJECT_NAME, PULPIT
	from SUBJECT
	order by SUBJECT.SUBJECT_NAME
go
select * from Дисциплины;

----- 6

go
alter view [Количество_кафедр] with schemabinding
as select fclt.FACULTY_NAME [Факультет], count(plpt.PULPIT) [Количество_кафедр]
	from dbo.FACULTY fclt inner join dbo.PULPIT plpt
	on fclt.FACULTY = plpt.FACULTY 
	group by FACULTY_NAME;
go
select * from Количество_кафедр;