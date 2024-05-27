
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
		print N'���������� ���������: ' + cast(@numberOfAuditoriums as char);
		print N'������� ����������� ���������: ' + cast(@avgCapacity as char);
		print N'���������� ���������, ��� ����������� ���� �������: ' + cast(@lowerThanAvg as char);
		print N'������� ���� ��������� �� ������ ����������: ' + cast(@percentageOfAuditoriums as char);
	end
else
	print N'����� ����������� ���������' + cast(@totalCapacity as char);
print '';

------ 3

print N'���������� ������������ �����: ' + cast(@@rowcount as char);
print N'������ SQL-�������: ' + cast(@@version as varchar(201));
print N'��������� ������������� ��������, ����������� �������� �������� �����������: ' + cast(@@spid as char);
print N'��� ��������� ������: ' + cast(@@error as char);
print N'��� �������: ' + cast(@@servername as char);
print N'������� ����������� ����������: ' + cast(@@trancount as char);
print N'�������� ���������� ���������� ����� ��������������� ������: ' + cast(@@fetch_status as char);
print N'������� ����������� ������� ���������: ' + cast(@@nestlevel as char);
print '';

------ 4

-- ������� 1

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

-- ������� 2

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
select @shortName [�����������_���];

-- ������� 3

use UNIVER;

declare @currentDate datetime = getdate();
declare @nextMonthDate datetime = dateadd(month, 1, @currentDate);
select NAME, BDAY, datediff(year, BDAY, @currentDate)
	from STUDENT
	where month(BDAY) like month(@nextMonthDate);

-- ������� 4

use UNIVER;

declare @weekDay varchar(10);
select datename(WEEKDAY, PDATE) [����_������]
	from PROGRESS inner join STUDENT S
	on S.IDSTUDENT = PROGRESS.IDSTUDENT
	where IDGROUP = 4 and SUBJECT like '����';

------ 5

use UNIVER;

if (select count(*) from STUDENT) > 50
	begin
		print N'��������� ������ 50'
	end
else
	begin
		print N'��������� ������ 50';
		select NAME, BDAY from STUDENT where year(BDAY) like 1993;
	end

------ 6

use UNIVER;

select case
    when NOTE between 0 and 3 then N'���������'
    when NOTE between 4 and 6 then N'�������'
    when NOTE between 7 and 9 then N'�������'
    else N'�� ����� ����'
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
    values ('203-1', '��-�', '30', '203-1');
end try
begin catch
    print error_number();
    print error_message();
    print error_line();
    print error_procedure();
    print error_severity();
    print error_state();
end catch