
------ 1

use master;
set nocount on						-- ������������ ��� ���������� ��������� � ���������� ������������ �����, 
									-- ������� ������������ ��� ���������� �������.
if exists (select * from  SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.NewTable') )
	begin
		drop table NewTable;
	end;
declare @c int, @flag char = 'c';	-- commit ��� rollback?
set implicit_transactions on		-- �����. ����� ������� ����������
create table NewTable				-- ������ ���������� 
(
	i int identity(1,1),
	word varchar(50) not null
);
declare @tableName nvarchar(128);
set @tableName = 'NewTable'
insert newTable (word) values ('�����1'), ('�����2'), ('�����3'), ('�����4');
set @c = (select count(*) from NewTable);
print '���������� ����� � ������� NewTable: ' + cast( @c as varchar(4));
if @flag = 'c'
	begin
		commit;						-- ���������� ����������: �������� 
	end;
else
	begin
		rollback;					-- ���������� ����������: ����� 
	end;
set implicit_transactions off		-- ������. ����� ������� ����������
if exists (select * from SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.NewTable'))
	begin
		print '������� � ��������� ' + @tableName + ' ����������'
	end;
else
	begin
		print '������� � ��������� ' + @tableName + ' �� ����������'
	end;

------ 2

use UNIVER;
begin try
	begin tran						-- ������ ����� ���������� (����� ������ �������� � �������)
		delete AUDITORIUM where AUDITORIUM_NAME = '301-1';
		insert into AUDITORIUM
			values ('301-1','��-�', '10', '301-1');
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME='301-1';
	commit tran;
	print '������';
end try
begin catch
	print '������: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
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
		save transaction @savepoint; -- �� - 1
		insert into AUDITORIUM
			values ('306-1','��-�', '10', '306-1');							
		set @savepoint = 'save2';
		save transaction @savepoint; -- �� - 2
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME = '306-1';		
		set @savepoint = 'save3';
		save transaction @savepoint; -- �� - 3
	commit tran;
end try
begin catch
	print '������: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
	if @@TRANCOUNT > 0
		begin
			print '����������� �����: ' + @savepoint;
			rollback tran @savepoint;
			commit tran;
		end;
end catch;

------ 4

use UNIVER;

-- ������� A

	set transaction isolation level read uncommitted
	begin transaction

	-------------------------- t1 ------------------

	select @@SPID 'SID', 'insert AUDITORIUM' '���������', * from SUBJECT
		where SUBJECT = '���';
	select @@SPID 'SID', 'update AUDITORIUM' '���������', AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY from AUDITORIUM
		where AUDITORIUM_NAME = '301-1';
	commit;

	-------------------------- t2 -----------------

--- ������� B

	begin transaction 
		select @@SPID 'SID'; -- SPID - ���������� ��������� ������������� ��������, ����������� �������� �������� �����������
		insert into SUBJECT
			values ('���', '������ ���������������� �����������', '����');   
		update AUDITORIUM set AUDITORIUM_CAPACITY = '15'
			where AUDITORIUM_NAME = '301-1';

	-------------------------- t1 --------------------
	-------------------------- t2 --------------------

	rollback;
	delete SUBJECT where SUBJECT = '���';

------ 5

use UNIVER;

-- ������� A

    set transaction isolation level read committed
	begin transaction 

	select count(*) from AUDITORIUM
		where AUDITORIUM_CAPACITY = '30';

	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------

	select @@SPID 'SID', 'update AUDITORIUM', '���������', AUDITORIUM_NAME, AUDITORIUM_TYPE,AUDITORIUM_CAPACITY from AUDITORIUM
		where AUDITORIUM_NAME = '301-1';
	commit; 

-- ������� B	

	begin transaction 	

	-------------------------- t1 --------------------

    select @@SPID 'SID' update AUDITORIUM set AUDITORIUM_CAPACITY = '30'
		where AUDITORIUM_NAME='301-1';	
      commit; 

	-------------------------- t2 --------------------	

------ 6

use UNIVER;

-- ������� �

    set transaction isolation level repeatable read
	begin transaction 
	select SUBJECT_NAME from SUBJECT where PULPIT = '��';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select case
          when SUBJECT = '���'
			then 'insert SUBJECT'
			else ' ' 
	end '���������', SUBJECT_NAME from SUBJECT
		where PULPIT = '��';
	commit; 

--- ������� B

	begin transaction
	
	-------------------------- t1 --------------------
    insert into SUBJECT
		values ('���', '������ ���������������� �����������', '����');   
    commit; 
	-------------------------- t2 --------------------

delete SUBJECT where SUBJECT = '���';

------ 7

-- ������� A
set transaction isolation level serializable
	begin transaction 
		delete SUBJECT where SUBJECT = '���';
		insert into SUBJECT
			values ('���', '������ ���������������� �����������', '����');
        update SUBJECT set SUBJECT_NAME = '������ ���������������� interface'
			where SUBJECT = '���';
	    select SUBJECT_NAME,PULPIT from SUBJECT
			where PULPIT = '����';

	-------------------------- t1 -----------------
	select SUBJECT_NAME, PULPIT from SUBJECT
		where PULPIT = '����';
	-------------------------- t2 ------------------ 

	commit; 	

-- ������� B

	begin transaction 	  
		delete SUBJECT where SUBJECT = '���';
		insert into SUBJECT
			values ('���', '������ ���������������� �����������', '����');
        update SUBJECT set SUBJECT_NAME = '������ ���������������� interface'
			where SUBJECT = '���';
	    select SUBJECT_NAME from SUBJECT where PULPIT = '����';

	-------------------------- t1 --------------------
    commit; 
    select SUBJECT_NAME,PULPIT from SUBJECT
		where PULPIT = '����';
    -------------------------- t2 --------------------
	 		
	delete SUBJECT where SUBJECT = '���';

------ 8

delete SUBJECT where SUBJECT = '���';
select * from PULPIT;
begin tran
update PULPIT set PULPIT_NAME = '������ � ���������� �������������'
	where PULPIT.FACULTY = '����'
	begin tran 
		update PULPIT set PULPIT_NAME = '���'
			where PULPIT.FACULTY = '����'
		commit;
	select * from PULPIT;
rollback
select * from PULPIT;