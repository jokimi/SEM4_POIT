
------ 1

use K_MyBase;
delete from �������� where ID_�������� = 900100 or ID_�������� = (900101) or ID_�������� = (900102) or ID_�������� = (900103);
declare @c int, @flag char = 'c';		-- commit ��� rollback?
set implicit_transactions on			-- �����. ����� ������� ����������
declare @tableName nvarchar(128);
set @tableName = '��������'
insert �������� (ID_��������) values (900100), (900101), (900102), (900103);
set @c = (select count(*) from ��������);
print '���������� ����� � ������� ��������: ' + cast(@c as varchar(4));
if @flag = 'c'
	begin
		commit;						-- ���������� ����������: �������� 
	end;
else
	begin
		rollback;					-- ���������� ����������: ����� 
	end;
set implicit_transactions off		-- ������. ����� ������� ����������
if exists (select * from SYS.OBJECTS where OBJECT_ID = object_id (N'DBO.��������'))
	begin
		print '������� � ��������� ' + @tableName + ' ����������'
	end;
else
	begin
		print '������� � ��������� ' + @tableName + ' �� ����������'
	end;

------ 2

use K_MyBase;
begin try
	begin tran						-- ������ ����� ���������� (����� ������ �������� � �������)
		delete �������� where ID_�������� = 1008;
		insert into ��������
			values (1008, '�������', '������', '���������', 16, '�');
		update �������� set ���� = 28
			where ID_�������� = 1006;
	commit tran;
	print '�����!';
end try
begin catch
	print '������: ' + cast(error_number() as varchar(5)) + ' ' + error_message()
	if @@TRANCOUNT > 0
		rollback tran;
end catch

------ 3

use K_MyBase;
delete �������� where ��� like '�����';
declare @savepoint varchar(30);
begin try
	begin tran
		delete �������� where ������� = '���������';									
		set @savepoint = 'save1';
		save transaction @savepoint; -- �� - 1
		insert into ��������
			values (1011, '������', '����', '��������', 1, '�');							
		set @savepoint = 'save2';
		save transaction @savepoint; -- �� - 2
		update �������� set ���� = 3
			where ID_�������� = 1011;		
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

use K_MyBase;

-- ������� A

	set transaction isolation level read uncommitted -- ��������� ����������������, ��������������� � ��������� ������
	begin transaction

	-------------------------- t1 ------------------

	select @@SPID 'SID', 'insert ��������' '���������', * from ��������
		where ��������_�������� like '�����-�%';
	select @@SPID 'SID', 'update ��������' '���������', �������, ���, ���� from ��������
		where ������� = '��������';
	commit;

	-------------------------- t2 -----------------

--- ������� B

	begin transaction 
		select @@SPID 'SID'; -- SPID - ���������� ��������� ������������� ��������, ����������� �������� �������� �����������
		insert into ��������
			values (900018, '�����-����', 689, 3656);   
		update �������� set ���� = 13
			where ��� = '�������';

	-------------------------- t1 --------------------
	-------------------------- t2 --------------------

	rollback;
	delete �������� where ID_�������� = 900018;

------ 5

use K_MyBase;

-- ������� A

    set transaction isolation level read committed	-- �� ��������� ����������������� ������, 
													-- �� ��� ���� �������� ��������������� � ������-��� ������
	begin transaction 
	select count(*) from ��������
		where ���� = 19;

	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------

	select @@SPID 'SID', 'update ��������', '���������', �������, ���, ���� from ��������
		where ������� = '��������';
	commit; 

-- ������� B	

	begin transaction 	

	-------------------------- t1 --------------------

    select @@SPID 'SID' update �������� set ���� = 2
		where ������� = '���������';	
      commit; 

	-------------------------- t2 --------------------	

------ 6

use K_MyBase;

-- ������� �

    set transaction isolation level repeatable read		-- �� ��������� ����������������� ������ � ���������������� ������, 
														-- �� ��� ���� �������� ��������� ������
	begin transaction 
		select ID_�������� from �������� where ��������� = 546;
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
		select case
			when ��������_�������� = '�����-�������'
				then 'insert ��������'
				else ' ' 
	end '���������', ID_�������� from ��������
		where ��������� = 546;
	commit; 

--- ������� B

	begin transaction
	
	-------------------------- t1 --------------------
    insert into ��������
		values (900018, '�����-����', 689, 3656);
    commit; 
	-------------------------- t2 --------------------

	delete �������� where ID_�������� = 900018;

------ 7

-- ������� A
set transaction isolation level serializable	-- ���������� ����������, ����������������� � ���������������� ������
	begin transaction 
		delete �������� where ID_�������� = 900018;
		insert into ��������
		values (900018, '�����-����', 689, 3656);
        update �������� set ��������_�������� = '�����-������'
			where ��������� = 689;
	    select ��������_��������, ������ from ��������
			where ������ = 3656;

	-------------------------- t1 -----------------
	select ��������_��������, ������ from ��������
		where ������ = 3656;
	-------------------------- t2 ------------------ 

	commit; 	

-- ������� B

	begin transaction 	  
		delete �������� where ID_�������� = 900018;
		insert into ��������
			values (900018, '�����-����', 689, 3656);
        update �������� set ��������_�������� = '�����-������'
			where ��������� = 689;
	    select ��������_��������, ������ from ��������
			where ������ = 3656;

	-------------------------- t1 --------------------
    commit; 
    select ��������_��������, ������ from ��������
		where ������ = 3656;
    -------------------------- t2 --------------------
	 		
	delete �������� where ID_�������� = 900018;

------ 8

delete �������� where ID_�������� = 900018;
select * from ������;
begin tran
update ������ set ����_����������� = '2024-02-01'
	where ����_����������� = '2024-02-04'
	begin tran 
		update ������ set ����_����������� = '2024-01-31'
			where ����_����������� = '2024-02-04'
		commit;
	select * from ������;
rollback
select * from ������;