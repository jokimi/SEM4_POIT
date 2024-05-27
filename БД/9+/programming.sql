
------ 1

declare @charVariable char = 'A',
    @varcharVariable varchar(50) = 'Word',
    @datetimeVariable datetime,
    @timeVariable time,
    @integerVariable int,
    @smallIntegerVariable smallint,
    @tinyIntVariable tinyint,
    @numericVariable numeric(12, 5);

set @datetimeVariable = getdate();
set @timeVariable = '12:20:03:100';
set @integerVariable = 12415;
select @smallIntegerVariable = 123, @tinyIntVariable = 12, @numericVariable = 1241314.12451;

select @charVariable [Char], @varcharVariable [Varchar], @datetimeVariable [Datetime], @timeVariable [Time];
print 'Integer = ' + cast(@integerVariable as varchar(10));
print 'Small int = ' + cast(@smallIntegerVariable as varchar(5));
print 'Tiny int = ' + cast(@tinyIntVariable as varchar(3));
print 'Numeric = ' + cast(@numericVariable as varchar(15));
print '';

------ 2

use UNIVER;

declare @totalCapacity int = (select cast(sum(AUDITORIUM_CAPACITY) as int) from AUDITORIUM),
    @numberOfAuditoriums integer,
    @avgCapacity real,
    @lowerThanAvg integer,
    @percentageOfAuditoriums numeric(12, 5);

if @totalCapacity > 200
	begin
		select @numberOfAuditoriums = (select cast(count(*) as int) from AUDITORIUM);
		select @avgCapacity = (select cast(avg(AUDITORIUM_CAPACITY) as int) from AUDITORIUM);
		select @lowerThanAvg = (select cast(count(*) as int) from AUDITORIUM where AUDITORIUM_CAPACITY < @avgCapacity);
		select @percentageOfAuditoriums = cast(cast(@lowerThanAvg as float) / cast(@numberOfAuditoriums as float) * 100  as float);
		print N'Количество аудиторий: ' + cast(@numberOfAuditoriums as char);
		print N'Средняя вместимость аудитории: ' + cast(@avgCapacity as char);
		print N'Количество аудиторий, где вместимость ниже средней: ' + cast(@lowerThanAvg as char);
		print N'Процент этих аудиторий от общего количества: ' + cast(@percentageOfAuditoriums as char);
	end
else
	print N'Общая вместимость аудиторий' + cast(@totalCapacity as char);
print '';

------ 3

print N'Количество обработанных строк: ' + cast(@@rowcount as char);
print N'Версия SQL-сервера: ' + cast(@@version as varchar(201));
print N'Системный идентификатор процесса, назначенный сервером текущему подключению: ' + cast(@@spid as char);
print N'Код последней ошибки: ' + cast(@@error as char);
print N'Имя сервера: ' + cast(@@servername as char);
print N'Уровень вложенности транзакции: ' + cast(@@trancount as char);
print N'Проверка результата считывания строк результирующего набора: ' + cast(@@fetch_status as char);
print N'Уровень вложенности текущей процедуры: ' + cast(@@nestlevel as char);
print '';

------ 4

-- Задание 1

declare @t integer = 2, @x integer = 1, @z numeric(12, 5);
if (@t > @x)
	begin
		select @z = cast(power(sin(@t), 2) as numeric);
		print 'z = sin^2(t) = ' + cast(@z as char);
	end
else if (@t < @x)
	begin
		select @z = 4 * (@t + @x);
		print 'z = 4 * (t + x) = ' + cast(@z as char);
	end
else if (@t = @x)
	begin
		select @z = 1 - exp(@x - 2);
		print '1 - e^(x - 2) = ' + cast(@z as char);
	end

-- Задание 2

use UNIVER;

declare @fullName varchar(50) = (select top(1) STUDENT.NAME from STUDENT), @shortName varchar(20);
set @shortName = concat(
    left(@fullName, charindex(' ', @fullName)),
    ' ',
    left(substring(@fullName, charindex(' ', @fullName) + 1, len(@fullName)), 1),
    '. ',
    left(substring(@fullName, charindex(' ', @fullName, charindex(' ', @fullName) + 1) + 1, len(@fullName)), 1),
    '.'
    );
select @shortName [Сокращенное_ФИО];

-- Задание 3

use UNIVER;

declare @currentDate datetime = getdate();
declare @nextMonthDate datetime = dateadd(month, 1, @currentDate);
select NAME, BDAY, datediff(year, BDAY, @currentDate)
	from STUDENT
	where month(BDAY) like month(@nextMonthDate);

-- Задание 4

use UNIVER;

declare @weekDay varchar(10);
select datename(WEEKDAY, PDATE) [День_недели]
	from PROGRESS inner join STUDENT S
	on S.IDSTUDENT = PROGRESS.IDSTUDENT
	where IDGROUP = 4 and SUBJECT like 'СУБД';

------ 5

use UNIVER;

if (select count(*) from STUDENT) > 50
	begin
		print N'Студентов больше 50'
	end
else
	begin
		print N'Студентов меньше 50';
		select NAME, BDAY from STUDENT where year(BDAY) like 1993;
	end

------ 6

use UNIVER;

select case
    when NOTE between 0 and 3 then N'Пересдача'
    when NOTE between 4 and 6 then N'Неплохо'
    when NOTE between 7 and 9 then N'Молодец'
    else N'Ты очень крут'
end, NAME, NOTE
from PROGRESS inner join STUDENT S on S.IDSTUDENT = PROGRESS.IDSTUDENT;

------ 7

use UNIVER;

if exists (select name from master.dbo.sysdatabases where name = N'UNIVER')
drop table #tempTable;

create table #tempTable
(
    Id integer,
    Name nvarchar(50),
    Birth_date datetime
);

set nocount on;
declare @i integer = 0;

while @i < 10
	begin
		insert #tempTable (Id, Name, Birth_date)
		values (@i, convert(varchar(255), newid()), getdate())
		set @i = @i + 1;
	end

select * from #tempTable;

------ 8

declare @xx int = 1;
print @xx + 1
print @xx + 2
return
print @xx + 3

------ 9

use UNIVER;

begin try
    insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
    values ('203-1', 'ЛК-К', '30', '203-1');
end try
begin catch
    print error_number();
    print error_message();
    print error_line();
    print error_procedure();
    print error_severity();
    print error_state();
end catch