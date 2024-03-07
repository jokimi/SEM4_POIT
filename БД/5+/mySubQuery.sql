use K_MyBase;

select distinct МАРШРУТЫ.Название_маршрута, ЗАКАЗЫ.Дата_возвращения
	from МАРШРУТЫ, ВОДИТЕЛИ, ЗАКАЗЫ
	where МАРШРУТЫ.ID_маршрута = ЗАКАЗЫ.ID_маршрута
		and МАРШРУТЫ.ID_маршрута in (select ЗАКАЗЫ.ID_маршрута from ЗАКАЗЫ where ЗАКАЗЫ.Дата_возвращения like '%2024-02%')

select distinct МАРШРУТЫ.Название_маршрута, ЗАКАЗЫ.Дата_возвращения
	from МАРШРУТЫ inner join ЗАКАЗЫ
	on МАРШРУТЫ.ID_маршрута = ЗАКАЗЫ.ID_маршрута
	where МАРШРУТЫ.ID_маршрута in (select ЗАКАЗЫ.ID_маршрута from ЗАКАЗЫ where ЗАКАЗЫ.Дата_возвращения like '%2024-02%')

select distinct МАРШРУТЫ.Название_маршрута, ЗАКАЗЫ.Дата_возвращения
	from МАРШРУТЫ inner join ЗАКАЗЫ
	on МАРШРУТЫ.ID_маршрута = ЗАКАЗЫ.ID_маршрута
	inner join ВОДИТЕЛИ
	on ЗАКАЗЫ.ID_водителя = ВОДИТЕЛИ.ID_водителя
	where ЗАКАЗЫ.Дата_возвращения like '%2024-02%'

select ID_водителя, Фамилия, Стаж
	from ВОДИТЕЛИ dr1
	where Фамилия = (select top(1) Фамилия
		from ВОДИТЕЛИ dr2
		where dr2.Стаж = dr1.Стаж
		and Стаж > 10
		order by Стаж desc)

select ВОДИТЕЛИ.Фамилия from ВОДИТЕЛИ
	where not exists (select * from ЗАКАЗЫ where ЗАКАЗЫ.ID_водителя = ВОДИТЕЛИ.ID_водителя)

select top 1
	(select avg(Номер_перевозки) from ЗАКАЗЫ where Дата_отправления like '%2024-02%')[02.2024],
	(select avg(Номер_перевозки) from ЗАКАЗЫ where Дата_отправления like '%2023-12%')[12.2023]
from ЗАКАЗЫ

select Фамилия, Стаж
	from ВОДИТЕЛИ
	where Фамилия >= all (select Фамилия from ВОДИТЕЛИ where Стаж like 12);

select Фамилия, Стаж
	from ВОДИТЕЛИ
	where Фамилия >= any (select Фамилия from ВОДИТЕЛИ where Стаж like 36);