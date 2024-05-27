﻿use K_MyBase;
drop table TR_R
drop trigger TR_R_INS
drop trigger TR_R_DEL
drop trigger TR_R_UPD
drop trigger TR_R
drop trigger if exists TR_R_DEL1
drop trigger if exists TR_R_DEL2
drop trigger if exists TR_R_DEL3
drop trigger R_TRAN
drop trigger TR_R_INSTEAD_OF
drop trigger TR_R_DDL

﻿------ 1

use K_MyBase;
go
create table TR_R
(
	ID int identity(1, 1),										-- номер
	STMT varchar(20) check (STMT in ('INS', 'DEL', 'UPD')),		-- DML название оператора
	TRNAME varchar(50),											-- имя триггера
	CC varchar(300)												-- комментарий
)

go
create trigger TR_R_INS on МАРШРУТЫ after insert
as 
declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300)
print 'Выполнена операция INSERT'
set @RID = (select ID_маршрута from INSERTED)
set @RNAME = (select Название_маршрута from INSERTED)
set @RKM = (select Дальность from INSERTED)
set @RCOST = (select Оплата from INSERTED)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))
insert into TR_R (STMT, TRNAME, CC) values ('INS', 'TR_R_INS', @IN)
return;

go
insert into МАРШРУТЫ values (900300, 'Минск-Киев', 952, 3642)
select * from МАРШРУТЫ
select * from TR_R order by ID
delete from МАРШРУТЫ where ID_маршрута = 900300;

------ 2

use K_MyBase;
go
create trigger TR_R_DEL on МАРШРУТЫ after delete
as 
declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300)
print 'Выполнена операция DELETE'
set @RID = (select ID_маршрута from DELETED)
set @RNAME = (select Название_маршрута from DELETED)
set @RKM = (select Дальность from DELETED)
set @RCOST = (select Оплата from DELETED)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))
insert into TR_R (STMT, TRNAME, CC) values ('DEL', 'TR_R_DEL', @IN)
return;

go
delete from МАРШРУТЫ where ID_маршрута = 900300;
select * from МАРШРУТЫ;
select * from TR_R order by ID;

------ 3

use K_MyBase;
go
create trigger TR_R_UPD on МАРШРУТЫ after update
as 
declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300)
print 'Выполнена операция UPDATE'

set @RID = (select ID_маршрута from DELETED where ID_маршрута is not null)
set @RNAME = (select Название_маршрута from DELETED where Название_маршрута is not null)
set @RKM = (select Дальность from DELETED where Дальность is not null)
set @RCOST = (select Оплата from DELETED where Оплата is not null)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST)) + ' -> '

set @RID = (select ID_маршрута from DELETED where ID_маршрута is not null)
set @RNAME = (select Название_маршрута from DELETED where Название_маршрута is not null)
set @RKM = (select Дальность from DELETED where Дальность is not null)
set @RCOST = (select Оплата from DELETED where Оплата is not null)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))

insert into TR_R (STMT, TRNAME, CC) values ('UPD', 'TR_R_UPD', @IN)
return;

go
update МАРШРУТЫ set Оплата = 4444 where ID_маршрута = 900300
select * from МАРШРУТЫ;
select * from TR_R;

------ 4

use K_MyBase
go
create trigger TR_RTE on МАРШРУТЫ after insert, update, delete
as
declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300);

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) > 0
begin
	print 'Выполнена операция UPDATE'
set @RID = (select ID_маршрута from DELETED where ID_маршрута is not null)
set @RNAME = (select Название_маршрута from DELETED where Название_маршрута is not null)
set @RKM = (select Дальность from DELETED where Дальность is not null)
set @RCOST = (select Оплата from DELETED where Оплата is not null)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST)) + ' -> '

set @RID = (select ID_маршрута from DELETED where ID_маршрута is not null)
set @RNAME = (select Название_маршрута from DELETED where Название_маршрута is not null)
set @RKM = (select Дальность from DELETED where Дальность is not null)
set @RCOST = (select Оплата from DELETED where Оплата is not null)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))

	insert into TR_R (STMT, TRNAME, CC) values ('UPD', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) > 0 and (select count(*) from DELETED) = 0
begin
	print 'Выполнена операция INSERT'
set @RID = (select ID_маршрута from DELETED)
set @RNAME = (select Название_маршрута from DELETED)
set @RKM = (select Дальность from DELETED)
set @RCOST = (select Оплата from DELETED)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))
	insert into TR_R (STMT, TRNAME, CC) values ('INS', 'TR_TEACHER', @IN)
end

if (select count(*) from INSERTED) = 0 and (select count(*) from DELETED) > 0
begin
	print 'Выполнена операция DELETE'
set @RID = (select ID_маршрута from DELETED)
set @RNAME = (select Название_маршрута from DELETED)
set @RKM = (select Дальность from DELETED)
set @RCOST = (select Оплата from DELETED)
set @IN = ltrim(rtrim(@RID)) + ' ' + ltrim(rtrim(@RNAME)) + 
		  ' ' + ltrim(rtrim(@RKM)) + ' ' + ltrim(rtrim(@RCOST))
	insert into TR_R (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER', @IN)
end

go
update МАРШРУТЫ set Дальность = 444 where ID_маршрута = 900300
select * from МАРШРУТЫ
select * from TR_R;

------ 5

use K_MyBase;
delete from МАРШРУТЫ where ID_маршрута = 900400;
insert into МАРШРУТЫ values (900400, 'Для теста', 1, 1)
select * from TR_R order by ID

------ 6

use K_MyBase;
go
create trigger TR_R_DEL1 on МАРШРУТЫ after delete
as declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300);
print 'DELETE Trigger 1'
set @IN = 'Trigger Normal Priority'
insert into TR_R (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL1', @IN)

go
create trigger TR_TEACHER_DEL2 on МАРШРУТЫ after delete
as declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300);
print 'DELETE Trigger 2'
set @IN = 'Trigger Low Priority'
insert into TR_R (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL2', @IN)

go
create trigger TR_TEACHER_DEL3 on МАРШРУТЫ after delete
as declare @RID int, @RNAME varchar(100), @RKM int, @RCOST int, @IN varchar(300);
print 'DELETE Trigger 3'
set @IN = 'Trigger Highest Priority'
insert into TR_R (STMT, TRNAME, CC) values ('DEL', 'TR_TEACHER_DEL3', @IN)

go
select t.name, e.type_desc 
from sys.triggers t join  sys.trigger_events e  
on t.object_id = e.object_id  
where OBJECT_NAME(t.parent_id) = 'R' and e.type_desc = 'DELETE'

go
exec SP_SETTRIGGERORDER @triggername = 'TR_R_DEL3', @order = 'First', @stmttype = 'DELETE'
exec SP_SETTRIGGERORDER @triggername = 'TR_R_DEL2', @order = 'Last',  @stmttype = 'DELETE'

go
delete from МАРШРУТЫ where ID_маршрута = 900300
insert into МАРШРУТЫ values (900300, 'Минск-Киев', 956, 3614)
select * from МАРШРУТЫ
select * from TR_R order by ID

------ 7

use K_MyBase;
go
create trigger R_TRAN on МАРШРУТЫ after insert, delete, update
as
declare @c int = (select COUNT(ID_маршрута) from МАРШРУТЫ);
		if(@c > 10)
			begin
				raiserror('Маршрутов не может быть больше 10', 10, 1);
				rollback;
			end;
		return;

go
delete from МАРШРУТЫ where ID_маршрута = 900400;
insert into МАРШРУТЫ values (900400, 'Просто для теста', 2, 2)
select * from МАРШРУТЫ
select * from TR_R order by ID

------ 8

use K_MyBase;
go
create trigger TR_R_INSTEAD_OF on МАРШРУТЫ instead of delete
as raiserror('Удаление запрещено', 10, 1)
return;

go
set nocount on
delete from МАРШРУТЫ where ID_маршрута = 900401
select * from TR_R order by ID

------ 9

use K_MyBase;
go
create trigger TR_R_DDL on database 
for DDL_DATABASE_LEVEL_EVENTS  as   
declare @EVENT_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)')
declare @OBJ_NAME varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)')
declare @OBJ_TYPE varchar(50) = EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)')
if @OBJ_NAME = 'МАРШРУТЫ' 
begin
	print 'Тип события: ' + cast(@EVENT_TYPE as varchar)
	print 'Имя объекта: ' + cast(@OBJ_NAME as varchar)
	print 'Тип объекта: ' + cast(@OBJ_TYPE as varchar)
	raiserror('Операции с таблицей МАРШРУТЫ запрещены.', 16, 1)
	rollback  
end

go
alter table МАРШРУТЫ drop column Дальность