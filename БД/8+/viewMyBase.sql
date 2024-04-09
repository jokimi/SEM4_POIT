use K_MyBase;

----- 1

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [Водитель];
go
create view [Водитель]
	as select ID_водителя[Код], Фамилия, Пол, Стаж
	from ВОДИТЕЛИ;
go
select * from Водитель;

----- 2

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [Количество_заказов];
go
create view [Количество_заказов]
	as select Название_маршрута[Маршрут], COUNT(Номер_перевозки)[Количество заказов]
	from ЗАКАЗЫ inner join МАРШРУТЫ
	on ЗАКАЗЫ.ID_маршрута = МАРШРУТЫ.ID_маршрута
	group by Название_маршрута;
go
select * from Количество_заказов;

----- 3

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [Маршруты_3];
go
create view [Маршруты_3]
	as select ID_маршрута[Код], Название_маршрута[Маршрут]
	from МАРШРУТЫ
	where Название_маршрута like 'Минск-В%';
go
insert Маршруты_3 values('900012', 'Минск-Витебск');
update Маршруты_3
	set Код = '900013' where Код = '900012';
delete from Маршруты_3
	where Код = '900013';
go
select * from Маршруты_3;

----- 4

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view Маршруты_4;
go
create view Маршруты_4
	as select ID_маршрута[Код], Название_маршрута[Маршрут]
	from МАРШРУТЫ
	where Название_маршрута like 'Минск-В%' with check option;
go
update Маршруты_4
	set Код = '900015' where Код = '900014';
delete from Маршруты_4
	where Код = '900015';
insert Маршруты_4 values('900015', 'Минск-Витебск');
--insert Маршруты_4 values('900016', 'Минск-Гродно');
go
select * from Маршруты_4;

----- 5

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view Перевозки;
go
create view Перевозки
	as select top 5 Номер_перевозки, ID_маршрута, Дата_возвращения
	from ЗАКАЗЫ
	order by ЗАКАЗЫ.ID_маршрута
go
select * from Перевозки;

----- 6

go
alter view [Количество_заказов] with schemabinding
as select rtnm.Название_маршрута [Маршрут], count(amnt.Номер_перевозки) [Количество_заказов]
	from dbo.МАРШРУТЫ rtnm inner join dbo.ЗАКАЗЫ amnt
	on rtnm.ID_маршрута = amnt.ID_маршрута
	group by Название_маршрута;
go
select * from Количество_заказов;