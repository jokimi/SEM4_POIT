use K_MyBase;

----- 1

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [��������];
go
create view [��������]
	as select ID_��������[���], �������, ���, ����
	from ��������;
go
select * from ��������;

----- 2

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [����������_�������];
go
create view [����������_�������]
	as select ��������_��������[�������], COUNT(�����_���������)[���������� �������]
	from ������ inner join ��������
	on ������.ID_�������� = ��������.ID_��������
	group by ��������_��������;
go
select * from ����������_�������;

----- 3

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view [��������_3];
go
create view [��������_3]
	as select ID_��������[���], ��������_��������[�������]
	from ��������
	where ��������_�������� like '�����-�%';
go
insert ��������_3 values('900012', '�����-�������');
update ��������_3
	set ��� = '900013' where ��� = '900012';
delete from ��������_3
	where ��� = '900013';
go
select * from ��������_3;

----- 4

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view ��������_4;
go
create view ��������_4
	as select ID_��������[���], ��������_��������[�������]
	from ��������
	where ��������_�������� like '�����-�%' with check option;
go
update ��������_4
	set ��� = '900015' where ��� = '900014';
delete from ��������_4
	where ��� = '900015';
insert ��������_4 values('900015', '�����-�������');
--insert ��������_4 values('900016', '�����-������');
go
select * from ��������_4;

----- 5

if exists (select name from master.dbo.sysdatabases where name = N'K_MyBase')
drop view ���������;
go
create view ���������
	as select top 5 �����_���������, ID_��������, ����_�����������
	from ������
	order by ������.ID_��������
go
select * from ���������;

----- 6

go
alter view [����������_�������] with schemabinding
as select rtnm.��������_�������� [�������], count(amnt.�����_���������) [����������_�������]
	from dbo.�������� rtnm inner join dbo.������ amnt
	on rtnm.ID_�������� = amnt.ID_��������
	group by ��������_��������;
go
select * from ����������_�������;