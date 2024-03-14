use UNIVER;

------------ 1-2

select AUDITORIUM.AUDITORIUM_TYPE,
	max(AUDITORIUM_CAPACITY) [Максимальная вместимость],
	min(AUDITORIUM_CAPACITY) [Минимальная вместимость],
	sum(AUDITORIUM_CAPACITY) [Суммарная вместимость],
	count(*) [Общее количество аудиторий]
	from AUDITORIUM inner join AUDITORIUM_TYPE
	on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	group by AUDITORIUM.AUDITORIUM_TYPE;

------------ 3

select * from PROGRESS;

select * 
	from (select 
			case
				when NOTE between 8 and 10 then 'от 8 до 10'
				when NOTE between 5 and 7 then 'от 5 до 7'
				else '4 и меньше'
			end [Пределы оценок], count(*)[Количество]
		from PROGRESS
		group by
			case
				when NOTE between 8 and 10 then 'от 8 до 10'
				when NOTE between 5 and 7 then 'от 5 до 7'
				else '4 и меньше'
			end) as T 
	order by 
		case [Пределы оценок]
			when 'от 8 до 10' then 3
			when 'от 5 до 7' then 2
			when 'меньше 4' then 1
			else 0
		end 

------------ 4-5

/*select * from FACULTY;
select * from GROUPS;
select * from STUDENT;
select * from PROGRESS;*/

select FACULTY.FACULTY, PROGRESS.SUBJECT, GROUPS.PROFESSION, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка]
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
	where PROGRESS.SUBJECT = 'ОАиП' or PROGRESS.SUBJECT = 'СУБД'
	group by FACULTY.FACULTY, PROGRESS.SUBJECT, GROUPS.PROFESSION
	order by [Средняя экзаменационная оценка];

------------ 5-6

select PROGRESS.SUBJECT, GROUPS.PROFESSION, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [Средняя экзаменационная оценка]
	from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
	on GROUPS.IDGROUP = STUDENT.IDGROUP
	inner join PROGRESS
	on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT
	where FACULTY.FACULTY = 'ИДиП'
	group by PROGRESS.SUBJECT, GROUPS.PROFESSION;

------------ 7

select * from PROGRESS;

select T.SUBJECT, T.Количество
	from (select
			case
				when NOTE between 8 and 9 then 'от 8 до 9'
				else '7 и меньше'
			end [Пределы оценок], COUNT(*)[Количество], SUBJECT
		from PROGRESS
		group by PROGRESS.SUBJECT,
			case
				when NOTE between 8 and 9 then 'от 8 до 9'
				else '7 и меньше'
			end) as T 
	group by T.SUBJECT, T.[Пределы оценок], T.Количество
	having T.[Пределы оценок] in ('от 8 до 9');