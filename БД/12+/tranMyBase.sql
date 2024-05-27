
------ 1

use K_MyBase;
delete from МАРШРУТЫ where ID_маршрута = 900100 or ID_маршрута = (900101) or ID_маршрута = (900102) or ID_маршрута = (900103);
declare @c int, @flag char = 'c';		-- commit или rollback?
set implicit_transactions on			-- включ. режим неявной транзакции
declare @tableName nvarchar(128);
set @tableName = 'МАРШРУТЫ'
insert МАРШРУТЫ (ID_маршрута) values (900100), (900101), (900102), (900103);
set @c = (select count(*) from МАРШРУТЫ);
print 'Количество строк в таблице МАРШРУТЫ: ' + cast(@c as varchar(4));
if @flag = 'c'
	begin
		commit;						-- завершение транзакции: фиксация 
	end;
else
	begin
		rollback;					-- завершение транзакции: откат 
	end;
set implicit_transactions off		-- выключ. режим неявной транзакции
if exists (select * from SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.МАРШРУТЫ'))
	begin
		print 'Таблица с названием ' + @tableName + ' существует'
	end;
else
	begin
		print 'Таблица с названием ' + @tableName + ' не существует'
	end;

------ 2

use K_MyBase;
begin try
	begin tran						-- начало явной транзакции (внизу просто удаление и вставка)
		delete ВОДИТЕЛИ where ID_водителя = 1008;
		insert into ВОДИТЕЛИ
			values (1008, 'Матвеев', 'Матвей', 'Матвеевич', 16, 'м');
		update ВОДИТЕЛИ set Стаж = 28
			where ID_водителя = 1006;
	commit tran;
	print 'Успех!';
end try
begin catch
	print 'Ошибка: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
	if @@TRANCOUNT > 0
		rollback tran;
end catch

------ 3

use K_MyBase;
delete ВОДИТЕЛИ where Имя like 'Тарас';
declare @savepoint varchar(30);
begin try
	begin tran
		delete ВОДИТЕЛИ where Фамилия = 'Тарасенко';									
		set @savepoint = 'save1';
		save transaction @savepoint; -- КТ - 1
		insert into ВОДИТЕЛИ
			values (1011, 'Марков', 'Марк', 'Маркович', 1, 'м');							
		set @savepoint = 'save2';
		save transaction @savepoint; -- КТ - 2
		update ВОДИТЕЛИ set Стаж = 3
			where ID_водителя = 1011;		
		set @savepoint = 'save3';
		save transaction @savepoint; -- КТ - 3
	commit tran;
end try
begin catch
	print 'Ошибка: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
	if @@TRANCOUNT > 0
		begin
			print 'Контрольная точка: ' + @savepoint;
			rollback tran @savepoint;
			commit tran;
		end;
end catch;

------ 4

use K_MyBase;

-- Таблица A

	set transaction isolation level read uncommitted -- допускает неподтвержденное, неповторяющееся и фантомное чтение
	begin transaction

	-------------------------- t1 ------------------

	select @@SPID 'SID', 'insert ВОДИТЕЛИ' 'результат', * from МАРШРУТЫ
		where Название_маршрута like 'Минск-В%';
	select @@SPID 'SID', 'update ВОДИТЕЛИ' 'результат', Фамилия, Имя, Стаж from ВОДИТЕЛИ
		where Фамилия = 'Алексеев';
	commit;

	-------------------------- t2 -----------------

--- Таблица B

	begin transaction 
		select @@SPID 'SID'; -- SPID - возвращает системный идентификатор процесса, назначенный сервером текущему подключению
		insert into МАРШРУТЫ
			values (900018, 'Минск-Рига', 689, 3656);   
		update ВОДИТЕЛИ set Стаж = 13
			where Имя = 'Евгения';

	-------------------------- t1 --------------------
	-------------------------- t2 --------------------

	rollback;
	delete МАРШРУТЫ where ID_маршрута = 900018;

------ 5

use K_MyBase;

-- Таблица A

    set transaction isolation level read committed	-- не допускает неподтвержденного чтения, 
													-- но при этом возможно неповторяющееся и фантом-ное чтение
	begin transaction 
	select count(*) from ВОДИТЕЛИ
		where Стаж = 19;

	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------

	select @@SPID 'SID', 'update ВОДИТЕЛИ', 'результат', Фамилия, Имя, Стаж from ВОДИТЕЛИ
		where Фамилия = 'Алексеев';
	commit; 

-- Таблица B	

	begin transaction 	

	-------------------------- t1 --------------------

    select @@SPID 'SID' update ВОДИТЕЛИ set Стаж = 2
		where Фамилия = 'Григорьев';	
      commit; 

	-------------------------- t2 --------------------	

------ 6

use K_MyBase;

-- Таблица А

    set transaction isolation level repeatable read		-- не допускает неподтвержденного чтения и неповторяющегося чтения, 
														-- но при этом возможно фантомное чтение
	begin transaction 
		select ID_маршрута from МАРШРУТЫ where Дальность = 546;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
		select case
			when Название_маршрута = 'Минск-Варшава'
				then 'insert МАРШРУТЫ'
				else ' ' 
	end 'результат', ID_маршрута from МАРШРУТЫ
		where Дальность = 546;
	commit; 

--- Таблица B

	begin transaction
	
	-------------------------- t1 --------------------
    insert into МАРШРУТЫ
		values (900018, 'Минск-Рига', 689, 3656);
    commit; 
	-------------------------- t2 --------------------

	delete МАРШРУТЫ where ID_маршрута = 900018;

------ 7

-- Таблица A
set transaction isolation level serializable	-- отсутствие фантомного, неподтвержденного и неповторяющегося чтения
	begin transaction 
		delete МАРШРУТЫ where ID_маршрута = 900018;
		insert into МАРШРУТЫ
		values (900018, 'Минск-Рига', 689, 3656);
        update МАРШРУТЫ set Название_маршрута = 'Минск-Одесса'
			where Дальность = 689;
	    select Название_маршрута, Оплата from МАРШРУТЫ
			where Оплата = 3656;

	-------------------------- t1 -----------------
	select Название_маршрута, Оплата from МАРШРУТЫ
		where Оплата = 3656;
	-------------------------- t2 ------------------ 

	commit; 	

-- Таблица B

	begin transaction 	  
		delete МАРШРУТЫ where ID_маршрута = 900018;
		insert into МАРШРУТЫ
			values (900018, 'Минск-Рига', 689, 3656);
        update МАРШРУТЫ set Название_маршрута = 'Минск-Одесса'
			where Дальность = 689;
	    select Название_маршрута, Оплата from МАРШРУТЫ
			where Оплата = 3656;

	-------------------------- t1 --------------------
    commit; 
    select Название_маршрута, Оплата from МАРШРУТЫ
		where Оплата = 3656;
    -------------------------- t2 --------------------
	 		
	delete МАРШРУТЫ where ID_маршрута = 900018;

------ 8

delete МАРШРУТЫ where ID_маршрута = 900018;
select * from ЗАКАЗЫ;
begin tran
update ЗАКАЗЫ set Дата_отправления = '2024-02-01'
	where Дата_возвращения = '2024-02-04'
	begin tran 
		update ЗАКАЗЫ set Дата_отправления = '2024-01-31'
			where Дата_возвращения = '2024-02-04'
		commit;
	select * from ЗАКАЗЫ;
rollback
select * from ЗАКАЗЫ;