use UNIVER;

----1

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM 
	from AUDITORIUM inner join AUDITORIUM_TYPE 
	on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE;

----2

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM 
	from AUDITORIUM inner join AUDITORIUM_TYPE 
	on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE 
	and AUDITORIUM_TYPE.AUDITORIUM_TYPENAME like '%���������%';

----3

select FACULTY.FACULTY as ���������, PULPIT.PULPIT as �������, 
	GROUPS.PROFESSION as �������������, SUBJECT.SUBJECT as ����������, 
	STUDENT.NAME as [��� ��������],
	case
		when (PROGRESS.NOTE = 6) then '�����'
		when (PROGRESS.NOTE = 7) then '����'
		when (PROGRESS.NOTE = 8) then '������'
	end [������]
	from PROGRESS inner join STUDENT 
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	inner join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join SUBJECT on SUBJECT.SUBJECT = PROGRESS.SUBJECT
	inner join PULPIT on PULPIT.PULPIT = SUBJECT.PULPIT
	inner join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	where PROGRESS.NOTE between 6 and 8
	order by PROGRESS.NOTE desc;

----4

select * from PULPIT;
select * from TEACHER;
select isnull (TEACHER.TEACHER, '***')[�������������], PULPIT.PULPIT [�������]
	from PULPIT left outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT;

----5

select PULPIT.FACULTY, PULPIT.PULPIT, PULPIT.PULPIT_NAME
	from PULPIT full outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT; 
select TEACHER.GENDER, TEACHER.PULPIT, TEACHER.TEACHER, TEACHER.TEACHER_NAME
	from PULPIT full outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT; 
select *
	from PULPIT full outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT;
select count(*)
	from PULPIT full outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT
	where TEACHER.TEACHER is null; 
select count(*)
	from PULPIT full outer join TEACHER
	on TEACHER.PULPIT = PULPIT.PULPIT
	where TEACHER.TEACHER is not null;

----6

select AUDITORIUM_TYPE.AUDITORIUM_TYPENAME, AUDITORIUM.AUDITORIUM 
	from AUDITORIUM cross join AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;