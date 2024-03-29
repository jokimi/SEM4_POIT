use K_MyBase;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'������')
drop table ������;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'��������')
drop table ��������;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'��������')
drop table ��������;

CREATE table ��������
(
	ID_�������� int primary key,
	��������_�������� nvarchar(30),
	��������� int not null,
	������ int not null
) on FG1;

CREATE table ��������
(
	ID_�������� int primary key,
	������� nvarchar(15) not null,
	��� nvarchar(15) not null,
	�������� nvarchar(15) not null,
	���� tinyint not null
) on FG1;

CREATE table ������
(
	�����_��������� int primary key,
	ID_�������� int not null foreign key references ��������(ID_��������),
	ID_�������� int not null foreign key references ��������(ID_��������), 
	����_����������� date not null,
	����_����������� date not null
) on FG1;

ALTER Table �������� ADD ����_�������� date; 
ALTER Table �������� ADD ��� nchar(1) default '�' check (��� in ('�', '�')); 
ALTER Table �������� DROP Column ����_��������;

INSERT into �������� Values
	(1001, '�����',  	'�����',	'��������',    10, '�'),
	(1002, '������',	'����',		'��������',     5, '�'),
	(1003, '�������',	'�������',	'���������',   19, '�'),
	(1004, '���������', '�������',	'����������',  11, '�'),
	(1005, '�������',	'������',	'���������',    8, '�'),
	(1006, '��������',	'�������',	'����������',  27, '�'),
	(1007, '��������',	'�������',	'����������',  12, '�'),
	(1008, '������',	'����',		'��������',	   36, '�'),
	(1009, '���������', '��������', '�����������', 27, '�'),
	(1010, '��������',	'�������',	'����������',   7, '�'),
	(1011, '���������',	'�����',	'���������',   14, '�')

INSERT into �������� Values
	(900001, '�����-������',	   718,  2533),
	(900002, '�����-�.-���������', 777,  5566),
	(900003, '�����-��������',	   378,  1114),
	(900004, '�����-������',	   1538, 8556),
	(900005, '�����-�������',	   546,  6526),
	(900006, '�����-�����',		   351,  2123),
	(900007, '�����-�������',	   546,  1555),
	(900008, '�����-������',	   1538, 7244),
	(900009, '�����-�������',	   184,  6251),
	(900010, '�����-����',		   220,  1766)

INSERT into ������ Values
	(1,  900001, 1001, '2024-02-02', '2024-02-04'),
	(2,  900002, 1002, '2024-01-19', '2024-01-22'),
	(3,  900003, 1003, '2023-12-06', '2024-12-07'),
	(4,  900004, 1004, '2024-01-31', '2024-02-04'),
	(5,  900005, 1005, '2024-01-04', '2024-01-06'),
	(6,  900006, 1006, '2024-02-13', '2024-02-14'),
	(7,  900007, 1007, '2023-12-29', '2023-12-31'),
	(8,  900008, 1008, '2024-01-24', '2024-01-28'),
	(9,  900009, 1009, '2024-02-09', '2024-02-11'),
	(10, 900010, 1010, '2024-02-16', '2024-02-17')

SELECT �������, ���� From ��������;
SELECT count(*)[���-�� ����� � �������] From ��������; 
SELECT * FROM ��������;

UPDATE �������� set ��� = '�';
UPDATE �������� set ���� = ����+1 Where (�������� = '��������' or �������� = '��������');

SELECT * FROM ��������;