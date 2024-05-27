use K_MyBase;

------ 1

go
CREATE FUNCTION COUNT_Drivers (@z int) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(d.ID_водителя) FROM ВОДИТЕЛИ d join ЗАКАЗЫ z
					ON d.ID_водителя = z.ID_водителя
					WHERE z.Номер_перевозки = @z);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_Drivers (8);
print 'Number of drivers: ' + cast(@f as varchar(4));

SELECT z.Номер_перевозки, dbo.COUNT_Drivers (z.Номер_перевозки) [number of drivers] 
	FROM ЗАКАЗЫ z GROUP BY z.Номер_перевозки

------ 1.2

go
CREATE FUNCTION COUNT_Drivers2(@z int, @km int) returns int
AS BEGIN
	DECLARE @rc int = 0;
	SET @rc = (SELECT COUNT(d.ID_водителя) FROM ВОДИТЕЛИ d join ЗАКАЗЫ z
					ON d.ID_водителя = z.ID_водителя
					join МАРШРУТЫ r
					ON z.ID_маршрута = r.ID_маршрута
					WHERE z.Номер_перевозки = @z AND r.Дальность = @km);
	RETURN @rc;
END;

go
DECLARE @f int = dbo.COUNT_Drivers2(8, 16);
print 'Number of driverss: ' + cast(@f as varchar(4));

SELECT z.Номер_перевозки, d.Стаж, dbo.COUNT_Drivers (z.Номер_перевозки) [number of drivers] 
	FROM ЗАКАЗЫ z join ВОДИТЕЛИ d
	ON z.ID_водителя = d.ID_водителя
	GROUP BY z.Номер_перевозки, d.Стаж;

------ 2

go
CREATE FUNCTION FROUTES(@name varchar(20)) returns varchar(300)
AS BEGIN
DECLARE Cost CURSOR LOCAL FOR SELECT s.Оплата FROM МАРШРУТЫ s WHERE s.Название_маршрута like @name;
DECLARE @pay varchar(60), @pay_ret varchar(300) ='';
OPEN Cost;
FETCH Cost into @pay;
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @pay_ret = RTRIM(@pay) +', ' +  @pay_ret;
		FETCH Cost into @pay;
	END;
CLOSE Cost;
SET @pay_ret = 'Оплата: ' + @pay_ret;
RETURN @pay_ret;
END;
--DROP FUNCTION FROUTES;
go
SELECT p.Название_маршрута, dbo.FROUTES(p.Название_маршрута) [Disciplines] FROM МАРШРУТЫ p;

------ 3

go
CREATE FUNCTION FRoZ(@name varchar(20), @date date) returns table
AS RETURN 
SELECT f.Название_маршрута, p.Дата_отправления FROM МАРШРУТЫ f left outer join ЗАКАЗЫ p
	ON f.ID_маршрута = p.ID_маршрута
	WHERE f.Название_маршрута = isnull(@name, f.Название_маршрута)and
		p.Дата_отправления = isnull(@date, p.Дата_отправления);

go
select * from dbo.FRoZ(NULL,NULL);
select * from dbo.FRoZ('Минск-Орша',NULL);
select * from dbo.FRoZ(NULL,'2024-02-04');
select * from dbo.FRoZ('Минск-Москва','2024-02-16');
select * from dbo.FRoZ('Минск-Брест','2023-12-12');

------ 4

go
CREATE FUNCTION FKM (@z int) returns int
AS BEGIN
		DECLARE @result int = 0;
		SET @result  = (SELECT count(*) FROM
									МАРШРУТЫ t inner join ЗАКАЗЫ p
									ON t.ID_маршрута = p.ID_маршрута
									WHERE p.Номер_перевозки = isnull(@z, p.Номер_перевозки));
		RETURN @result;
END;

go
SELECT Номер_перевозки, dbo.FKM(ЗАКАЗЫ.Номер_перевозки) 'Количество маршрутов' FROM ЗАКАЗЫ;
SELECT dbo.FKM(NULL) 'Всего маршрутов';