
------ 1

use master;
set nocount on						-- используется для отключения сообщений о количестве обработанных строк, 
									-- которые возвращаются при выполнении запроса.
if exists (select * from  SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.NewTable') )
	begin
		drop table NewTable;
	end;
declare @c int, @flag char = 'c';	-- commit или rollback?
set implicit_transactions on		-- включ. режим неявной транзакции
create table NewTable				-- начало транзакции 
(
	i int identity(1,1),
	word varchar(50) not null
);
declare @tableName nvarchar(128);
set @tableName = 'NewTable'
insert newTable (word) values ('Слово1'), ('Слово2'), ('Слово3'), ('Слово4');
set @c = (select count(*) from NewTable);
print 'Количество строк в таблице NewTable: ' + cast( @c as varchar(4));
if @flag = 'c'
	begin
		commit;						-- завершение транзакции: фиксация 
	end;
else
	begin
		rollback;					-- завершение транзакции: откат 
	end;
set implicit_transactions off		-- выключ. режим неявной транзакции
if exists (select * from SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.NewTable'))
	begin
		print 'Таблица с названием ' + @tableName + ' существует'
	end;
else
	begin
		print 'Таблица с названием ' + @tableName + ' не существует'
	end;

------ 2

use UNIVER;
begin try
	begin tran						-- начало явной транзакции (внизу просто удаление и вставка)
		delete AUDITORIUM where AUDITORIUM_NAME = '301-1';
		insert into AUDITORIUM
			values ('301-1','ЛБ-К', '10', '301-1');
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME='301-1';
	commit tran;
	print 'Победа';
end try
begin catch
	print 'Ошибка: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
	if @@TRANCOUNT > 0
		rollback tran;
end catch

------ 3

use UNIVER;
delete AUDITORIUM where AUDITORIUM like '306-1';
declare @savepoint varchar(30);
begin try
	begin tran
		delete AUDITORIUM where AUDITORIUM_NAME = '306-1';									
		set @savepoint = 'save1';
		save transaction @savepoint; -- КТ - 1
		insert into AUDITORIUM
			values ('306-1','ЛБ-К', '10', '306-1');							
		set @savepoint = 'save2';
		save transaction @savepoint; -- КТ - 2
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME = '306-1';		
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

use UNIVER;

-- Таблица A

	set transaction isolation level read uncommitted
	begin transaction

	-------------------------- t1 ------------------

	select @@SPID 'SID', 'insert AUDITORIUM' 'результат', * from SUBJECT
		where SUBJECT = 'ДПИ';
	select @@SPID 'SID', 'update AUDITORIUM' 'результат', AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM
		where AUDITORIUM_NAME = '301-1';
	commit;

	-------------------------- t2 -----------------

--- Таблица B

	begin transaction 
		select @@SPID 'SID'; -- SPID - возвращает системный идентификатор процесса, назначенный сервером текущему подключению
		insert into SUBJECT
			values ('ДПИ', 'Дизайн пользовательских интерфейсов', 'ИСиТ');   
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME = '301-1';

	-------------------------- t1 --------------------
	-------------------------- t2 --------------------

	rollback;
	delete SUBJECT where SUBJECT = 'ДПИ';

------ 5

use UNIVER;

-- Таблица A

    set transaction isolation level read committed
	begin transaction 

	select count(*) from AUDITORIUM
		where AUDITORIUM_CAPACITY = '30';

	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------

	select @@SPID 'SID', 'update AUDITORIUM', 'результат', AUDITORIUM_NAME, AUDITORIUM_TYPE,AUDITORIUM_CAPACITY from AUDITORIUM
		where AUDITORIUM_NAME = '301-1';
	commit; 

-- Таблица B	

	begin transaction 	

	-------------------------- t1 --------------------

    select @@SPID 'SID' update AUDITORIUM set AUDITORIUM_CAPACITY = '30'
		where AUDITORIUM_NAME='301-1';	
      commit; 

	-------------------------- t2 --------------------	

------ 6

use UNIVER;

-- Таблица А

    set transaction isolation level repeatable read
	begin transaction 
	select SUBJECT_NAME from SUBJECT where PULPIT = 'ТЛ';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select case
          when SUBJECT = 'ДПИ'
			then 'insert SUBJECT'
			else ' ' 
	end 'результат', SUBJECT_NAME from SUBJECT
		where PULPIT = 'ТЛ';
	commit; 

--- Таблица B

	begin transaction
	
	-------------------------- t1 --------------------
    insert into SUBJECT
		values ('ДПИ', 'Дизайн пользовательских интерфейсов', 'ИСиТ');   
    commit; 
	-------------------------- t2 --------------------

delete SUBJECT where SUBJECT = 'ДПИ';

------ 7

-- Таблица A
set transaction isolation level serializable
	begin transaction 
		delete SUBJECT where SUBJECT = 'ДПИ';
		insert into SUBJECT
			values ('ДПИ', 'Дизайн пользовательских интерфейсов', 'ИСиТ');
        update SUBJECT set SUBJECT_NAME = 'Дизайн пользовательских interface'
			where SUBJECT = 'ДПИ';
	    select SUBJECT_NAME,PULPIT from SUBJECT
			where PULPIT = 'ИСиТ';

	-------------------------- t1 -----------------
	select SUBJECT_NAME, PULPIT from SUBJECT
		where PULPIT = 'ИСиТ';
	-------------------------- t2 ------------------ 

	commit; 	

-- Таблица B

	begin transaction 	  
		delete SUBJECT where SUBJECT = 'ДПИ';
		insert into SUBJECT
			values ('ДПИ', 'Дизайн пользовательских интерфейсов', 'ИСиТ');
        update SUBJECT set SUBJECT_NAME = 'Дизайн пользовательских interface'
			where SUBJECT = 'ДПИ';
	    select SUBJECT_NAME from SUBJECT where PULPIT = 'ИСиТ';

	-------------------------- t1 --------------------
    commit; 
    select SUBJECT_NAME,PULPIT from SUBJECT
		where PULPIT = 'ИСиТ';
    -------------------------- t2 --------------------
	 		
	delete SUBJECT where SUBJECT = 'ДПИ';

------ 8

delete SUBJECT where SUBJECT = 'ДПИ';
select * from PULPIT;
begin tran
update PULPIT set PULPIT_NAME = 'Лесных и технологии лесозаготовок'
	where PULPIT.FACULTY = 'ТТЛП'
	begin tran 
		update PULPIT set PULPIT_NAME = 'Лес'
			where PULPIT.FACULTY = 'ТТЛП'
		commit;
	select * from PULPIT;
rollback
select * from PULPIT;