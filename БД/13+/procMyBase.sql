
------ 1

use K_MyBase
go
create procedure PROUTE	
as
begin
	set nocount on;
	declare @count int = (select count(*) from МАРШРУТЫ)
	select s.ID_маршрута ID, s.Название_маршрута Название, s.Дальность Дальность from МАРШРУТЫ s
	return @count
end

go
declare @COUNT_OUTPUT int = 0
exec @COUNT_OUTPUT = PROUTE
print 'Количество маршрутов: ' + cast(@COUNT_OUTPUT as varchar(10))
--drop proc PROUTE;

---2

USE [K_MyBase]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[PROUTE] @p varchar(20), @c int output
as
begin
	set nocount on;
	select s.ID_маршрута Маршрут, s.ID_водителя Водитель, s.Номер_перевозки Номер from ЗАКАЗЫ s
	set @c = (select count(*) from ЗАКАЗЫ where ЗАКАЗЫ.ID_маршрута = @p);

	print 'параметры: @p = ' + @p + ',@c = ' + cast(@c as varchar(3));
	declare @k int = (select count(*) from ЗАКАЗЫ);
	return @k ;
end

go
declare @k int = 0, @r int = 0, @p varchar(20);
exec @k = PROUTE @p = 900004, @c = @r output;
print 'Кол-во дисциплин всего: ' + cast(@k as varchar(3))
print 'Кол-во дисциплин на кафедре ' + cast(@p as varchar(3)) + ' = ' + cast(@r as varchar(3))
--drop proc PROUTE

------ 3

use K_MyBase;
go
alter proc PROUTE @Driver int
as 
begin
	select * from ВОДИТЕЛИ where ВОДИТЕЛИ.ID_водителя != @Driver
end

create table #DRIVERS
(
	Код int primary key,
	Фамилия varchar(50) not null,
	Стаж int not null
);
insert #DRIVERS exec PROUTE @dr = 1004;
select * from #DRIVERS

drop table #DRIVERS
drop proc PROUTE

SELECT * FROM ВОДИТЕЛИ;

------ 4

go
use K_MyBase
go
create proc PROUTE_INSERT @ID int, @NAME varchar(50), @KM int = 0, @COST int
as
begin
	begin try
		insert into МАРШРУТЫ (ID_маршрута, Название_маршрута, Дальность, Оплата)
		values (@ID, @NAME, @KM, @COST)
		return 1
	end try
	begin catch
		print 'Номер ошибка:  ' + cast(ERROR_NUMBER() as varchar(6))
		print 'Уровень: ' + cast(ERROR_SEVERITY() as varchar(6))
		print 'Сообщение:   ' + ERROR_MESSAGE()
		return -1
	end catch
end

go
declare @RETURN int
exec @RETURN = PROUTE_INSERT @ID = 900200, @NAME = 'Минск-Слоним', @KM = 300, @COST = 2563
print 'Процедура завершилась с кодом ' + cast(@RETURN as varchar)

select * from МАРШРУТЫ

delete МАРШРУТЫ where ID_маршрута = 900200
drop proc PROUTE_INSERT;

------ 5

use K_MyBase;
go
create proc DRIVER_REPORT @Driver int
as
begin try
	declare @DR_OUT varchar(200) = ''
	declare @DR_ONE varchar(20) = ''
	declare @ROWCOUNT int = 0
	declare cur cursor local static for (select Фамилия from ВОДИТЕЛИ where ВОДИТЕЛИ.ID_водителя = @Driver)
	if not exists (select Фамилия from ВОДИТЕЛИ where ВОДИТЕЛИ.ID_водителя = @Driver)
		raiserror('Ошибка! ', 11, 1)
	else
	open cur
		fetch cur into @DR_ONE
		while @@FETCH_STATUS = 0
		begin
			set @DR_OUT += rtrim(@DR_ONE) + ', '
			set @ROWCOUNT = @ROWCOUNT + 1
			fetch cur into @DR_ONE
		end
	print @DR_OUT
	close cur
	return @ROWCOUNT
end try
begin catch
	print 'Ошибка в параметрах!'
	print 'Сообщение: ' + cast(ERROR_MESSAGE() as varchar(max))
	print 'Номер строки: ' + cast(@ROWCOUNT as varchar) 
end catch
go
declare @COUNT int = 0
exec @COUNT = DRIVER_REPORT @Driver = 1004
print 'Количество водителей: ' + cast(@COUNT as varchar)

drop proc Driver_REPORT;

------ 6

use K_MyBase
go
create proc PROUTE_INSERTX 
@ID int, @NAME varchar(50), @KM int = 0, @COST int
as 
begin try
	set transaction isolation level SERIALIZABLE
	begin tran
		insert into МАРШРУТЫ (ID_маршрута, Название_маршрута)
		values (@ID, @NAME)
		exec PROUTE_INSERT @ID, @NAME, @KM, @COST
	commit tran
end try
begin catch
	print 'Код ошибки:  ' + cast(ERROR_NUMBER() as varchar)
	print 'Серьёзность: ' + cast(ERROR_SEVERITY() as varchar)
	print 'Сообщение:   ' + cast(ERROR_MESSAGE() as varchar)
	if @@TRANCOUNT > 0 
		rollback tran
	return -1
end catch

go
exec PROUTE_INSERTX @ID = 900201, @NAME = 'Минск-Пружаны', @KM = 590, @COST = 6566

select * from МАРШРУТЫ

delete МАРШРУТЫ where ID_маршрута = 900201

drop proc PROUTE_INSERTX 