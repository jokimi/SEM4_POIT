use UNIVER;

------------ 1-2

select AUDITORIUM.AUDITORIUM_TYPE,
	max(AUDITORIUM_CAPACITY) [������������ �����������],
	min(AUDITORIUM_CAPACITY) [����������� �����������],
	sum(AUDITORIUM_CAPACITY) [��������� �����������],
	count(*) [����� ���������� ���������]
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM.AUDITORIUM_TYPE;

------------ 3

select * from PROGRESS;

select * 
	from (select 
			case
				when NOTE between 8 and 10 then '�� 8 �� 10'
				when NOTE between 5 and 7 then '�� 5 �� 7'
				else '4 � ������'
			end [������� ������], count(*)[����������]
		from PROGRESS
		group by
			case
				when NOTE between 8 and 10 then '�� 8 �� 10'
				when NOTE between 5 and 7 then '�� 5 �� 7'
				else '4 � ������'
			end) as T 
	order by 
		case [������� ������]
			when '�� 8 �� 10' then 3
			when '�� 5 �� 7' then 2
			when '������ 4' then 1
			else 0
		end 

------------ 4-5

/*select * from FACULTY;
select * from GROUPS;
select * from STUDENT;
select * from PROGRESS;*/

select FACULTY.FACULTY, PROGRESS.SUBJECT, GROUPS.PROFESSION, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [������� ��������������� ������]
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
	where PROGRESS.SUBJECT = '����' or PROGRESS.SUBJECT = '����'
	group by FACULTY.FACULTY, PROGRESS.SUBJECT, GROUPS.PROFESSION
	order by [������� ��������������� ������];

------------ 5-6

select PROGRESS.SUBJECT, GROUPS.PROFESSION, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [������� ��������������� ������]
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
	where FACULTY.FACULTY = '����'
	group by PROGRESS.SUBJECT, GROUPS.PROFESSION;

------------ 7

select * from PROGRESS;

select T.SUBJECT, T.����������
	from (select
			case
				when NOTE between 8 and 9 then '�� 8 �� 9'
				else '7 � ������'
			end [������� ������], COUNT(*)[����������], SUBJECT
		from PROGRESS
		group by PROGRESS.SUBJECT,
			case
				when NOTE between 8 and 9 then '�� 8 �� 9'
				else '7 � ������'
			end) as T 
	group by T.SUBJECT, T.[������� ������], T.����������
	having T.[������� ������] in ('�� 8 �� 9');