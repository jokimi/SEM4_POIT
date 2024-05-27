use K_MyBase;

create index inDriversID on �������� (ID_��������);
drop index if exists inDriversID on ��������;
create index inRoutesID on �������� (ID_��������);
drop index if exists inRoutesID on ��������;
create index inOrders_idRoutes_idDrivers on ������ (ID_��������, ID_��������);
drop index if exists inOrders_idRoutes_idDrivers on ������;

select * from �������� where ID_�������� = 1010;
select * from �������� where ID_�������� = 900005;
select * from ������ where ID_�������� = 900004 and ID_�������� = 1004;

select * from ������
	inner join �������� on ������.ID_�������� = ��������.ID_��������
	inner join �������� on ������.ID_�������� = ��������.ID_��������;

create clustered index inDrivers_Surname on dbo.�������� (�������);
drop index if exists inDrivers_Surname on ��������;

create index inRoutes_Payment on dbo.�������� (������);
drop index if exists inRoutes_Payment on ��������;

create index inOrders_idRouts_INCLUDE on dbo.������ (ID_��������) include (����_�����������, ����_�����������);
drop index if exists inOrders_idRouts_INCLUDE on ������;

create index inRoutes_Distance_Filter on dbo.�������� (���������)
	where ��������� > 1000;
drop index if exists inRoutes_Distance_Filter on ��������;

create index inRoutes_Payment_FillFactor on dbo.�������� (������) with (fillfactor = 65);
select NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'��������'), null, null, null) SS
    join SYS.INDEXES II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
drop index if exists inRoutes_Payment_FillFactor on ��������;

create index inDrivers_Experience on dbo.�������� (����);
INSERT top(10000) ��������(ID_��������, ���, �������, ��������, ����, ���) select ID_��������, ���, �������, ��������, ����, ��� from ��������;
select NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'��������'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
declare @Counter int;
set @Counter = 1;
while @Counter < 150
	begin
		insert top(10000) ��������(ID_��������, ���, �������, ��������, ����, ���) select ID_��������, ���, �������, ��������, ����, ��� from ��������;
		set @Counter = @Counter + 1; 
	end
select NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'��������'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index inDrivers_Experience on dbo.�������� reorganize;
select NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'��������'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index inDrivers_Experience on dbo.�������� rebuild with(online = off);
select NAME [������], AVG_FRAGMENTATION_IN_PERCENT [������������ (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'��������'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
drop index if exists inDrivers_Experience on dbo.��������;