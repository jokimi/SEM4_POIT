use UNIVER;

----- 1

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [�������������];
go
create view [�������������]
	as select TEACHER[���], TEACHER_NAME[���], GENDER[���], PULPIT[�������]
	from TEACHER;
go
select * from �������������;

----- 2

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [����������_������];
go
create view [����������_������]
	as select FACULTY_NAME[���������], COUNT(PULPIT)[���������� ������]
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY 
	group by FACULTY_NAME;
go
select * from ����������_������;

----- 3

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [���������];
go
create view [���������]
	as select AUDITORIUM[�����_���������], AUDITORIUM_TYPE[��������]
	from AUDITORIUM 
	where AUDITORIUM.AUDITORIUM_TYPE like '��%';
go
insert ��������� values('734-1', '��');
update ���������
	set �����_��������� = '634-1' where �����_��������� = '734-1';
delete from ���������
	where �����_��������� = '634-1';
go
select * from ���������;

----- 4

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view [����������_���������];
go
create view ����������_���������
	as select AUDITORIUM, AUDITORIUM_TYPE
	from AUDITORIUM 
	where AUDITORIUM.AUDITORIUM_TYPE like '��%' with check option;
go
update ����������_���������
	set AUDITORIUM = '834-1' where AUDITORIUM = '934-1';
delete from ����������_���������
	where AUDITORIUM = '834-1';
insert ����������_��������� values('934-1', '��');
--insert ����������_��������� values('534-1', '��');
go
select * from ����������_���������;

----- 5

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop view[����������];
go
create view ����������
	as select top 10 SUBJECT, SUBJECT_NAME, PULPIT
	from SUBJECT
	order by SUBJECT.SUBJECT_NAME
go
select * from ����������;

----- 6

go
alter view [����������_������] with schemabinding
as select fclt.FACULTY_NAME [���������], count(plpt.PULPIT) [����������_������]
	from dbo.FACULTY fclt inner join dbo.PULPIT plpt
	on fclt.FACULTY = plpt.FACULTY 
	group by FACULTY_NAME;
go
select * from ����������_������;