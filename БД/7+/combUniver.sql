use UNIVER

--------- 1

select GROUPS.PROFESSION, FACULTY.FACULTY, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT;

select GROUPS.PROFESSION, FACULTY.FACULTY, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT with rollup;
		
--------- 2

select GROUPS.PROFESSION, FACULTY.FACULTY, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT with cube;

--------- 3

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'КГ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
union
select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'ОАиП'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
--------------------------------------------------------------------------------------	
select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'КГ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
union all
select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'ОАиП'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT

--------- 4

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'КГ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
intersect
select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'СУБД'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
		
-------- 5

select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'КГ'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT
except
select GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка] 
	from GROUPS inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'СУБД'
	group by GROUPS.PROFESSION, PROGRESS.SUBJECT