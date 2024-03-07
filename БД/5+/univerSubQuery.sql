use UNIVER;

-- список наименований кафедр, которые находятся на факультете, обеспечивающем подготовку по специальности,
-- в наименовании которого содержится слово технология или технологии. 

select distinct PULPIT.PULPIT_NAME
	from FACULTY, PULPIT, PROFESSION
	where FACULTY.FACULTY = PULPIT.FACULTY
		and
		FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION.PROFESSION_NAME like '%технологи[ия]%')

select distinct PULPIT.PULPIT_NAME
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
	where FACULTY.FACULTY in (select PROFESSION.FACULTY from PROFESSION where PROFESSION.PROFESSION_NAME like '%технологи[ия]%')

select distinct PULPIT.PULPIT_NAME
	from FACULTY inner join PULPIT
	on FACULTY.FACULTY = PULPIT.FACULTY
	inner join PROFESSION
	on FACULTY.FACULTY = PROFESSION.FACULTY
	where PROFESSION.PROFESSION_NAME like '%технологи[ия]%'

select AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
	from AUDITORIUM aud1
	where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY
		from AUDITORIUM aud2
		where aud2.AUDITORIUM_TYPE = aud1.AUDITORIUM_TYPE
		order by AUDITORIUM_CAPACITY desc)

select FACULTY_NAME from FACULTY
	where not exists (select * from PULPIT where PULPIT.FACULTY = FACULTY.FACULTY)

select top 1
	(select avg(NOTE) from PROGRESS where SUBJECT like '%ОАиП%')[ОАиП],
	(select avg(NOTE) from PROGRESS where SUBJECT like '%СУБД')[СУБД],
	(select avg(NOTE) from PROGRESS where SUBJECT like '%КГ%')[КГ]
from PROGRESS

select NOTE, SUBJECT
	from PROGRESS
	where NOTE >= all (select NOTE from PROGRESS where SUBJECT like 'КГ');

select NOTE, SUBJECT
	from PROGRESS
	where NOTE >= any (select NOTE from PROGRESS where SUBJECT like 'СУБД');

-- студенты, у которых день рождения в один и тот же день

select NAME, BDAY
	from STUDENT a
	where BDAY in (select BDAY from STUDENT where a.NAME != STUDENT.NAME)
	order by BDAY