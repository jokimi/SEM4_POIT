
------ 1

use K_MyBase
go
create procedure PROUTE	
as
begin
	set nocount on;
	declare @count int = (select count(*) from ��������)
	select s.ID_�������� ID, s.��������_�������� ��������, s.��������� ��������� from �������� s
	return @count
end

go
declare @COUNT_OUTPUT int = 0
exec @COUNT_OUTPUT = PROUTE
print '���������� ���������: ' + cast(@COUNT_OUTPUT as varchar(10))
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
	select s.ID_�������� �������, s.ID_�������� ��������, s.�����_��������� ����� from ������ s
	set @c = (select count(*) from ������ where ������.ID_�������� = @p);

	print '���������: @p = ' + @p + ',@c = ' + cast(@c as varchar(3));
	declare @k int = (select count(*) from ������);
	return @k ;
end

go
declare @k int = 0, @r int = 0, @p varchar(20);
exec @k = PROUTE @p = 900004, @c = @r output;
print '���-�� ��������� �����: ' + cast(@k as varchar(3))
print '���-�� ��������� �� ������� ' + cast(@p as varchar(3)) + ' = ' + cast(@r as varchar(3))
--drop proc PROUTE

------ 3

use K_MyBase;
go
alter proc PROUTE @Driver int
as 
begin
	select * from �������� where ��������.ID_�������� != @Driver
end

create table #DRIVERS
(
	��� int primary key,
	������� varchar(50) not null,
	���� int not null
);
insert #DRIVERS exec PROUTE @dr = 1004;
select * from #DRIVERS

drop table #DRIVERS
drop proc PROUTE

SELECT * FROM ��������;

------ 4

go
use K_MyBase
go
create proc PROUTE_INSERT @ID int, @NAME varchar(50), @KM int = 0, @COST int
as
begin
	begin try
		insert into �������� (ID_��������, ��������_��������, ���������, ������)
		values (@ID, @NAME, @KM, @COST)
		return 1
	end try
	begin catch
		print '����� ������:  ' + cast(ERROR_NUMBER() as varchar(6))
		print '�������: ' + cast(ERROR_SEVERITY() as varchar(6))
		print '���������:   ' + ERROR_MESSAGE()
		return -1
	end catch
end

go
declare @RETURN int
exec @RETURN = PROUTE_INSERT @ID = 900200, @NAME = '�����-������', @KM = 300, @COST = 2563
print '��������� ����������� � ����� ' + cast(@RETURN as varchar)

select * from ��������

delete �������� where ID_�������� = 900200
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
	declare cur cursor local static for (select ������� from �������� where ��������.ID_�������� = @Driver)
	if not exists (select ������� from �������� where ��������.ID_�������� = @Driver)
		raiserror('������! ', 11, 1)
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
	print '������ � ����������!'
	print '���������: ' + cast(ERROR_MESSAGE() as varchar(max))
	print '����� ������: ' + cast(@ROWCOUNT as varchar) 
end catch
go
declare @COUNT int = 0
exec @COUNT = DRIVER_REPORT @Driver = 1004
print '���������� ���������: ' + cast(@COUNT as varchar)

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
		insert into �������� (ID_��������, ��������_��������)
		values (@ID, @NAME)
		exec PROUTE_INSERT @ID, @NAME, @KM, @COST
	commit tran
end try
begin catch
	print '��� ������:  ' + cast(ERROR_NUMBER() as varchar)
	print '�����������: ' + cast(ERROR_SEVERITY() as varchar)
	print '���������:   ' + cast(ERROR_MESSAGE() as varchar)
	if @@TRANCOUNT > 0 
		rollback tran
	return -1
end catch

go
exec PROUTE_INSERTX @ID = 900201, @NAME = '�����-�������', @KM = 590, @COST = 6566

select * from ��������

delete �������� where ID_�������� = 900201

drop proc PROUTE_INSERTX 