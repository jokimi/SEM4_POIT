use K_MyBase;

create index inDriversID on ВОДИТЕЛИ (ID_водителя);
drop index if exists inDriversID on ВОДИТЕЛИ;
create index inRoutesID on МАРШРУТЫ (ID_маршрута);
drop index if exists inRoutesID on МАРШРУТЫ;
create index inOrders_idRoutes_idDrivers on ЗАКАЗЫ (ID_маршрута, ID_водителя);
drop index if exists inOrders_idRoutes_idDrivers on ЗАКАЗЫ;

select * from ВОДИТЕЛИ where ID_водителя = 1010;
select * from МАРШРУТЫ where ID_маршрута = 900005;
select * from ЗАКАЗЫ where ID_маршрута = 900004 and ID_водителя = 1004;

select * from ЗАКАЗЫ
	inner join МАРШРУТЫ on ЗАКАЗЫ.ID_маршрута = МАРШРУТЫ.ID_маршрута
	inner join ВОДИТЕЛИ on ЗАКАЗЫ.ID_водителя = ВОДИТЕЛИ.ID_водителя;

create clustered index inDrivers_Surname on dbo.ВОДИТЕЛИ (Фамилия);
drop index if exists inDrivers_Surname on ВОДИТЕЛИ;

create index inRoutes_Payment on dbo.МАРШРУТЫ (Оплата);
drop index if exists inRoutes_Payment on МАРШРУТЫ;

create index inOrders_idRouts_INCLUDE on dbo.ЗАКАЗЫ (ID_маршрута) include (Дата_отправления, Дата_возвращения);
drop index if exists inOrders_idRouts_INCLUDE on ЗАКАЗЫ;

create index inRoutes_Distance_Filter on dbo.МАРШРУТЫ (Дальность)
	where Дальность > 1000;
drop index if exists inRoutes_Distance_Filter on МАРШРУТЫ;

create index inRoutes_Payment_FillFactor on dbo.МАРШРУТЫ (Оплата) with (fillfactor = 65);
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'МАРШРУТЫ'), null, null, null) SS
    join SYS.INDEXES II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
drop index if exists inRoutes_Payment_FillFactor on МАРШРУТЫ;

create index inDrivers_Experience on dbo.ВОДИТЕЛИ (Стаж);
INSERT top(10000) ВОДИТЕЛИ(ID_водителя, Имя, Фамилия, Отчество, Стаж, Пол) select ID_водителя, Имя, Фамилия, Отчество, Стаж, Пол from ВОДИТЕЛИ;
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'ВОДИТЕЛИ'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
declare @Counter int;
set @Counter = 1;
while @Counter < 150
	begin
		insert top(10000) ВОДИТЕЛИ(ID_водителя, Имя, Фамилия, Отчество, Стаж, Пол) select ID_водителя, Имя, Фамилия, Отчество, Стаж, Пол from ВОДИТЕЛИ;
		set @Counter = @Counter + 1; 
	end
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'ВОДИТЕЛИ'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index inDrivers_Experience on dbo.ВОДИТЕЛИ reorganize;
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'ВОДИТЕЛИ'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
alter index inDrivers_Experience on dbo.ВОДИТЕЛИ rebuild with(online = off);
select NAME [Индекс], AVG_FRAGMENTATION_IN_PERCENT [Фрагментация (%)]
	from sys.dm_db_index_physical_stats(db_id(N'K_MyBase'), object_id(N'ВОДИТЕЛИ'), null, null, null) SS
	JOIN sys.indexes II
	on SS.object_id = II.object_id and SS.INDEX_ID = II.INDEX_ID
	where NAME is not null;
drop index if exists inDrivers_Experience on dbo.ВОДИТЕЛИ;