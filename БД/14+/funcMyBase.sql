use K_MyBase;

------ 1

go
CREATE FUNCTION COUNT_Drivers (@z int) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(d.ID_��������) FROM �������� d join ������ z
					ON d.ID_�������� = z.ID_��������
					WHERE z.�����_��������� = @z);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_Drivers (8);
print 'Number of drivers: ' + cast(@f as varchar(4));

SELECT z.�����_���������, dbo.COUNT_Drivers (z.�����_���������) [number of drivers] 
	FROM ������ z GROUP BY z.�����_���������

------ 1.2

go
CREATE FUNCTION COUNT_Drivers2(@z int, @km int) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(d.ID_��������) FROM �������� d join ������ z
					ON d.ID_�������� = z.ID_��������
					join �������� r
					ON z.ID_�������� = r.ID_��������
					WHERE z.�����_��������� = @z AND r.��������� = @km);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_Drivers2(8, 16);
print 'Number of driverss: ' + cast(@f as varchar(4));

SELECT z.�����_���������, d.����, dbo.COUNT_Drivers (z.�����_���������) [number of drivers] 
	FROM ������ z join �������� d
	ON z.ID_�������� = d.ID_��������
	GROUP BY z.�����_���������, d.����;

------ 2

go
CREATE FUNCTION FROUTES(@name varchar(20)) returns varchar(300)
AS BEGIN
DECLARE Cost CURSOR LOCAL FOR SELECT s.������ FROM �������� s WHERE s.��������_�������� like @name;
DECLARE @pay varchar(60), @pay_ret varchar(300) ='';
OPEN Cost;
FETCH Cost into @pay;
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @pay_ret = RTRIM(@pay) +', ' +  @pay_ret;
		FETCH Cost into @pay;
	END;
CLOSE Cost;
SET @pay_ret = '������: ' + @pay_ret;
RETURN @pay_ret;
END;
--DROP FUNCTION FROUTES;
go
SELECT p.��������_��������, dbo.FROUTES(p.��������_��������) [Disciplines] FROM �������� p;

------ 3

go
CREATE FUNCTION FRoZ(@name varchar(20), @date date) returns table
AS RETURN 
SELECT f.��������_��������, p.����_����������� FROM �������� f left outer join ������ p
	ON f.ID_�������� = p.ID_��������
	WHERE f.��������_�������� = isnull(@name, f.��������_��������)and
		p.����_����������� = isnull(@date, p.����_�����������);

go
select * from dbo.FRoZ(NULL,NULL);
select * from dbo.FRoZ('�����-����',NULL);
select * from dbo.FRoZ(NULL,'2024-02-04');
select * from dbo.FRoZ('�����-������','2024-02-16');
select * from dbo.FRoZ('�����-�����','2023-12-12');

------ 4

go
CREATE FUNCTION FKM (@z int) returns int
AS BEGIN
		DECLARE @result int = 0;
		SET @result  = (SELECT count(*) FROM
									�������� t inner join ������ p
									ON t.ID_�������� = p.ID_��������
									WHERE p.�����_��������� = isnull(@z, p.�����_���������));
		RETURN @result;
END;

go
SELECT �����_���������, dbo.FKM(������.�����_���������) '���������� ���������' FROM ������;
SELECT dbo.FKM(NULL) '����� ���������';