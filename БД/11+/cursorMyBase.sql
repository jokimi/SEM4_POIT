use K_MyBase;

------ 1

deallocate curRoutes;
declare @tv nvarchar(20), @t char(300)= '';
declare curRoutes cursor for
	select МАРШРУТЫ.ID_маршрута from МАРШРУТЫ
		where МАРШРУТЫ.Название_маршрута like 'Минск-В%';
open curRoutes;
fetch curRoutes into @tv;
print 'Номера маршрутов: ';
while @@fetch_status = 0
	begin
		set @t = rtrim(@tv) + ', ' + @t; -- удаляет конечные пробелы из строки
		fetch curRoutes into @tv;
	end
print @t;
close curRoutes;

------ 2

-- Локальный курсор

declare curRoutesLength cursor local
	for select МАРШРУТЫ.ID_маршрута, МАРШРУТЫ.Дальность from МАРШРУТЫ;
declare @tv1 nvarchar(20), @length int;
open curRoutesLength;
fetch curRoutesLength into @tv1, @length;
print '1. ' + @tv1 + ' - ' + cast(@length as nvarchar(20));
go
declare @tv1 nvarchar(20), @length int;
fetch curRoutesLength into @tv1, @length;
print '2. ' + @tv1 + ' - ' + cast(@length as nvarchar(20));
go

-- Глобальный курсор

declare curRoutesLength cursor global
	for select МАРШРУТЫ.ID_маршрута, МАРШРУТЫ.Дальность from МАРШРУТЫ;
declare @tv1 nvarchar(20), @length int;
open curRoutesLength;
fetch curRoutesLength into @tv1, @length;
print '1. ' + @tv1 + ' - ' + cast(@length as nvarchar(20));
go
declare @tv1 nvarchar(20), @length int;
fetch curRoutesLength into @tv1, @length;
print '2. ' + @tv1 + ' - ' + cast(@length as nvarchar(20));
close curRoutesLength;
deallocate curRoutesLength;
go

------ 3

-- Статический курсор

insert into МАРШРУТЫ
	values(900012, 'Минск-Смоленск', 378, 1566);
declare curRoutesStatic cursor static
	for select ID_маршрута, Дальность from МАРШРУТЫ
	where Название_маршрута like 'Минск-С%';
declare @q int = 0, @route char(10), @iter int = 1;
open curRoutesStatic;
print 'Количество строк: ' + cast(@@cursor_rows as varchar(5));
delete МАРШРУТЫ where ID_маршрута = 900012;
fetch curRoutesStatic into @route, @q;
while @@fetch_status = 0
	begin
		print cast(@iter as varchar(5)) + '. Маршрут ' + rtrim(@route) +': ' + cast(@q as varchar(5)) + ' км' ;
		set @iter += 1;
		fetch curRoutesStatic into @route, @q;
	end;
close curRoutesStatic;
deallocate curRoutesStatic;

-- Динамический курсор

go
insert into МАРШРУТЫ
	values(900012, 'Минск-Смоленск', 378, 1566);
declare curRoutesDynamic cursor dynamic
	for select ID_маршрута, Дальность from МАРШРУТЫ
	where Название_маршрута like 'Минск-С%';
declare @q int = 0, @route char(10), @iter int = 1;
open curRoutesDynamic;
print 'Количество строк: ' + cast(@@cursor_rows as varchar(5));
delete МАРШРУТЫ where ID_маршрута = 900012;
fetch curRoutesDynamic into @route, @q;
while @@fetch_status = 0
	begin
		print cast(@iter as varchar(5)) + '. Маршрут ' + rtrim(@route) +': ' + cast(@q as varchar(5)) + ' км' ;
		set @iter += 1;
		fetch curRoutesDynamic into @route, @q;
	end;
close curRoutesDynamic;
deallocate curRoutesDynamic;

------ 4

select МАРШРУТЫ.Дальность from МАРШРУТЫ;
declare @tc nvarchar(20),@cp int ;
declare curLength cursor local dynamic scroll
	for select row_number()
		over (order by Название_маршрута), МАРШРУТЫ.Дальность
		from МАРШРУТЫ;
open curLength;
fetch last from curLength into @tc, @cp;
print 'последняя строка: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch first from curLength into @tc, @cp;
print 'первая строка: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch absolute 4 from curLength into @tc, @cp;
print '4 строка от начала: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch relative 3 from curLength into @tc, @cp;
print '3 строка от текущей: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch relative -5 from curLength into @tc, @cp;
print '-5 строк от текущей: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch absolute -10 from curLength into @tc, @cp;
print '-10 строк от конца: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch next from curLength into @tc, @cp;
print 'следующая строка: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
fetch prior from curLength into @tc, @cp;
print 'предыдущая строка: ' + cast(@cp as nvarchar(20)) + ' ' + rtrim (@tc);
close curLength;
deallocate curLength;

------ 5

declare @tc1 nvarchar(20), @tk int;
declare curLen cursor local dynamic
	for select МАРШРУТЫ.Название_маршрута, МАРШРУТЫ.Дальность
	from МАРШРУТЫ
	for update;
open curLen;
fetch curLen into @tc1, @tk;
update МАРШРУТЫ set Дальность = Дальность + 5
	where current of curLen;
close curLen;
deallocate curLen;

------ 6

declare newCursor cursor local dynamic 
	for select ЗАКАЗЫ.Номер_перевозки, МАРШРУТЫ.Название_маршрута, ВОДИТЕЛИ.Стаж
		from ЗАКАЗЫ inner join МАРШРУТЫ on ЗАКАЗЫ.ID_маршрута = МАРШРУТЫ.ID_маршрута
		inner join ВОДИТЕЛИ on ВОДИТЕЛИ.ID_водителя = ЗАКАЗЫ.ID_водителя;
declare @num varchar(300), @name varchar(300), @exp varchar(2), @list varchar(400);
open newCursor;
fetch newCursor into @num, @name, @exp;
if(@exp < 19)
			begin
				delete ВОДИТЕЛИ where current of newCursor;
			end;
print @num + ' - '+ @name + ' - ' + @exp;
while (@@fetch_status = 0)
	begin
		fetch newCursor into @num, @name, @exp;
		print @num + ' ▬ '+ @name + ' ▬ ' + @exp;
		if(@exp < 19)
			begin
				delete ВОДИТЕЛИ where current of newCursor;
			end;
	end;
close newCursor;