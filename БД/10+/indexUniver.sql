use UNIVER;

------ 1

exec sp_helpindex 'AUDITORIUM' 
exec sp_helpindex 'AUDITORIUM_TYPE'
exec sp_helpindex 'FACULTY'
exec sp_helpindex 'GROUPS'
exec sp_helpindex 'PROFESSION'
exec sp_helpindex 'PROGRESS'
exec sp_helpindex 'PULPIT'
exec sp_helpindex 'STUDENT'
exec sp_helpindex 'SUBJECT'
exec sp_helpindex 'TEACHER'
drop table if exists #TempTable1;
create table #TempTable1 (
    ID int,
    Name nvarchar(50)
);
declare @ID int;
declare @Name nvarchar(50);
set @ID = 1;
set @Name = 'Name';
while @ID < 1000
	begin
		insert into #TempTable1 (ID, Name) values (@ID, @Name);
		set @ID = @ID + 1;
		set @Name = 'Name' + cast(@ID as nvarchar(10));
	end
select * from #TempTable1;
select ID from #TempTable1;
-- фиксация БД
checkpoint;
-- очистить буферный кэш
dbcc DROPCLEANBUFFERS; 
create clustered index #TempTable1_in on #TempTable1(ID);
select ID from #TempTable1;
drop index #TempTable1_in on #TempTable1;
drop table if exists #TempTable1;

------ 2

drop table if exists #TempTable2;
create table #TempTable2 (
    ID int,
    Name nvarchar(50)
);
declare @ID2 int;
declare @Name2 nvarchar(50);
set @ID2 = 1;
set @Name2 = 'Name';
while @ID2 < 10000
	begin
		insert into #TempTable2 (ID, Name) values (@ID2, @Name2);
		set @ID2 = @ID2 + 1;
		set @Name2 = 'Name' + cast(@ID2 as nvarchar(10));
	end
select * from #TempTable2;
create index #TempTable2_NONCLU on #TempTable2(ID, Name);
select * from #TempTable2
	where ID < 500 and Name like '%';
select * from #TempTable2
	where ID = 500 and Name like '%';
drop table if exists #TempTable2;

------ 3

drop table if exists #TempTable3;
create table #TempTable3 (
    ID int,
    Name nvarchar(50)
);
declare @ID3 int;
declare @Name3 nvarchar(50);
set @ID3 = 1
set @Name3 = 'Name';
while @ID3 < 10000
	begin
		insert #TempTable3 (ID, Name) values (@ID3, @Name3);
		set @ID3 = @ID3 + 1;
		set @Name3 = 'Name' + cast(@ID3 as nvarchar(10));
	end
create index #TempTable3_INDEX on #TempTable3(ID) include (Name);
select Name from #TempTable3
	where ID = 5;

------ 4

create index #TempTable3_in on #TempTable3(ID)
	where (ID >= 0 and ID <= 10)
drop index #TempTable3_in on #TempTable3;
-- очистить буферный кэш
dbcc DROPCLEANBUFFERS;
select Name from #TempTable3
	where ID >= 0 and ID <= 10;

------ 5

use tempdb;
drop table if exists #TempTable5;
create table #TempTable5 (
    ID int,
    Name nvarchar(50)
);
declare @ID5 int;
declare @Name5 nvarchar(50);
set @ID5 = 1
set @Name5 = 'Name';
while @ID5 < 10000
	begin
		insert into #TempTable5 (ID, Name) values (@ID5, @Name5);
		set @ID5 = @ID5 + 1;
		set @Name5 = 'Name' + cast(@ID5 as nvarchar(10));
	end
create index #TempTable5_NONCLU on #TempTable5(ID, Name);
INSERT top(10000) #TempTable5(ID, Name) select ID, Name from #TempTable5;
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'tempdb'), object_id(N'#TempTable5'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
declare @Counter int;
set @Counter = 1;
while @Counter < 150
	begin
		insert top(10000) #TempTable5(ID, Name) select ID, Name from #TempTable5;
		set @Counter = @Counter + 1; 
	end
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'tempdb'), object_id(N'#TempTable5'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index #TempTable5_NONCLU on #TempTable5 reorganize;
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'tempdb'), object_id(N'#TempTable5'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index #TempTable5_NONCLU on #TempTable5 rebuild with(online = off);
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'tempdb'), object_id(N'#TempTable5'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;

------ 6

drop table if exists #TempTable3;
create table #TempTable3 (
    ID int,
    Name nvarchar(50)
);
declare @ID5 int;
declare @Name5 nvarchar(50);
set @ID5 = 1
set @Name5 = 'Name';
while @ID5 < 10000
	begin
		insert into #TempTable3 (ID, Name) values (@ID5, @Name5);
		set @ID5 = @ID5 + 1;
		set @Name5 = 'Name' + cast(@ID5 as nvarchar(10));
	end
create index #TempTable3_NONCLU6 on #TempTable3(ID) with (fillfactor = 65)
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'tempdb'), object_id(N'#TempTable3'), null, null, null) SS
    join SYS.INDEXES II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID 
	where NAME is not null;
drop index #TempTable3_NONCLU6 ON #TempTable3
drop table if exists #TempTable3;