use UNIVER;

------ 1

deallocate Discipl;
declare @tv nvarchar(20), @t char(300)= '';
declare Discipl cursor for
	select SUBJECT.SUBJECT from SUBJECT
		where SUBJECT.PULPIT like '%ИСиТ%';
open Discipl;
fetch Discipl into @tv;
print 'Список дисциплин: ';
while @@fetch_status = 0
	begin
		set @t = rtrim(@tv) + ', ' + @t; --удаляет конечные пробелы из строки
		fetch Discipl into @tv;
	end
print @t;
close Discipl;

------ 2

-- Локальный курсор

declare Audit cursor local
	for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM;
declare @tv1 nvarchar(20), @capacity int;
open Audit;
fetch Audit into @tv1, @capacity;
print '1. ' + @tv1 + cast(@capacity as nvarchar(20));
go
declare @tv1 nvarchar(20), @capacity int;
fetch Audit into @tv1, @capacity;
print '2. ' + @tv1 + cast(@capacity as nvarchar(20));
go

-- Глобальный курсор

declare Audit cursor global
	for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_CAPACITY from AUDITORIUM;
declare @tv1 nvarchar(20), @capacity int;
open Audit;
fetch Audit into @tv1, @capacity
print '1. ' + @tv1 + cast(@capacity as nvarchar(20));
go
declare @tv1 nvarchar(20), @capacity int;
fetch Audit into @tv1,@capacity;
print '2. ' + @tv1 + cast(@capacity as nvarchar(20));
close Audit;
deallocate Audit;
go

------ 3

-- Статический курсор
insert Into AUDITORIUM values('301-1','ЛБ-К','15','301-1');
declare Auditorium_local_static CURSOR  STATIC for select AUDITORIUM,AUDITORIUM_CAPACITY from AUDITORIUM where  AUDITORIUM_TYPE = 'ЛБ-К';

declare @q int = 0, @auditorium char(10), @iter int = 1;
open Auditorium_local_static;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
delete AUDITORIUM where AUDITORIUM ='301-1';
fetch Auditorium_local_static into @auditorium, @q;
while @@FETCH_STATUS = 0
	begin
		print cast(@iter as varchar(5)) + '. Аудитория ' + rtrim(@auditorium) +': ' + cast(@q as varchar(5)) + ' мест' ;
		set @iter += 1;
		fetch Auditorium_local_static into @auditorium, @q;
	end;
close Auditorium_local_static;
deallocate Auditorium_local_static;

-- Динамический курсор

go
insert into AUDITORIUM values('301-1','ЛБ-К','15','301-1');
declare Auditorium_local_dynamic CURSOR  DYNAMIC for select AUDITORIUM,AUDITORIUM_CAPACITY from AUDITORIUM where  AUDITORIUM_TYPE = 'ЛБ-К';
declare @q int = 0, @auditorium char(10), @iter int = 1;
open Auditorium_local_dynamic;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
delete AUDITORIUM where AUDITORIUM ='301-1';
fetch Auditorium_local_dynamic into @auditorium, @q;
while @@FETCH_STATUS = 0
	begin
		print cast(@iter as varchar(5)) + '. Аудитория ' + rtrim(@auditorium) +': ' + cast(@q as varchar(5)) + ' мест' ;
		set @iter += 1;
		FETCH Auditorium_local_dynamic into @auditorium, @q;
	end;
CLOSE Auditorium_local_dynamic;
deallocate Auditorium_local_dynamic;

------ 4

select AUDITORIUM.AUDITORIUM_CAPACITY FROM AUDITORIUM;
declare @tc nvarchar(20),@cp int ;
declare AUDITOR cursor local dynamic scroll
	for select row_number()
	over (order by AUDITORIUM_NAME), AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM;
open AUDITOR;
fetch last from AUDITOR into @tc,@cp;
print 'последняя строка: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch first from AUDITOR into @tc,@cp;
print 'первая строка: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch absolute 4 from AUDITOR into @tc,@cp;
print '4 строка от начала: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch relative 3 from AUDITOR into @tc,@cp;
print '3 строка от текущей: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch relative -5 from AUDITOR into @tc,@cp;
print '-5 строк от текущей: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch absolute -10 from AUDITOR into @tc,@cp;
print '-10 строк от конца: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch next from AUDITOR into @tc,@cp;
print 'следующая строка: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
fetch prior from AUDITOR into @tc,@cp;
print 'предыдущая строка: ' + cast(@cp as nvarchar(20))+ ' ' + rtrim (@tc);
close AUDITOR;
deallocate AUDITOR;

------ 5

declare @tn nvarchar(20), @tc1 nvarchar(20), @tk int;
declare AUDITOR2 cursor local dynamic
	for select AUDITORIUM.AUDITORIUM, AUDITORIUM.AUDITORIUM_TYPE, AUDITORIUM.AUDITORIUM_CAPACITY
	from AUDITORIUM
	for update;
open AUDITOR2;
fetch AUDITOR2 into @tn,@tc1,@tk;
delete AUDITORIUM where current of AUDITOR2;
fetch AUDITOR2 into @tn, @tc1, @tk;
update AUDITORIUM set AUDITORIUM_CAPACITY = AUDITORIUM_CAPACITY + 5 where current of AUDITOR2;
close AUDITOR2;
deallocate AUDITOR2;

------ 6

DECLARE newCursor cursor local dynamic 
						for SELECT STUDENT.NAME, GROUPS.PROFESSION, PROGRESS.NOTE
						from STUDENT inner join GROUPS on STUDENT.IDGROUP = GROUPS.IDGROUP inner join
						PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT;

DECLARE @name varchar(300), @profession varchar(300), @mark varchar(2), @list varchar(400);

OPEN newCursor;
fetch newCursor into @name,@profession,@mark;
if(@mark < 4)
			begin
				DELETE PROGRESS where CURRENT OF newCursor;
			end;
print @name + ' - '+ @profession + ' - ' + @mark ;
While (@@FETCH_STATUS = 0)
	begin
		fetch newCursor into @name,@profession,@mark;
		print @name + ' ▬ '+ @profession + ' ▬ ' + @mark ;
		if(@mark < 4)
			begin
				DELETE PROGRESS where CURRENT OF newCursor;
			end;
	end;
CLOSE newCursor;