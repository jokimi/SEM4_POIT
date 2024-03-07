use master

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'K_MyBase')
DROP DATABASE K_MyBase

CREATE DATABASE K_MyBase on primary
(
	name = N'K_MyBase_mdf',
	filename = N'D:\BSTU\4 sem\БД\Лабы\3+\K_MyBase_mdf.mdf', 
	size = 10240Kb,
	maxsize=UNLIMITED,
	filegrowth=1024Kb
),
(
	name = N'K_MyBase_ndf',
	filename = N'D:\BSTU\4 sem\БД\Лабы\3+\K_MyBase_ndf.ndf', 
	size = 10240Kb,
	maxsize=1Gb,
	filegrowth=25%
),
filegroup FG1
(
	name = N'K_MyBase_fg1_1',
	filename = N'D:\BSTU\4 sem\БД\Лабы\3+\K_MyBase_fgq-1.ndf', 
	size = 10240Kb,
	maxsize=1Gb,
	filegrowth=25%
),
(
	name = N'K_MyBase_fg1_2',
	filename = N'D:\BSTU\4 sem\БД\Лабы\3+\K_MyBase_fgq-2.ndf', 
	size = 10240Kb,
	maxsize=1Gb,
	filegrowth=25%
)
log on
(
	name = N'K_MyBase_log',
	filename=N'D:\BSTU\4 sem\БД\Лабы\3+\K_MyBase_log.ldf',       
	size=10240Kb, 
	maxsize=2048Gb,
	filegrowth=10%
)