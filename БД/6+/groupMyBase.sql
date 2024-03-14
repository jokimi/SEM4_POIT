use K_MyBase;

------------ 1-2

select МАРШРУТЫ.Название_маршрута,
	max(ЗАКАЗЫ.ID_водителя) as [Максимальный ID водителя],
	min(ЗАКАЗЫ.ID_водителя) as [Минимальный ID водителя],
	avg(ЗАКАЗЫ.ID_водителя) as [Средний ID водителя],
	sum(ЗАКАЗЫ.ID_водителя) as [Сумма ID водителей],
	count(*) as [Количество водителей]
from МАРШРУТЫ inner join ЗАКАЗЫ on ЗАКАЗЫ.ID_маршрута = МАРШРУТЫ.ID_маршрута
group by МАРШРУТЫ.Название_маршрута

------------ 3

select * from ВОДИТЕЛИ;

select * 
	from (select 
		case
			when Стаж between 6 and 10 then 'от 6 до 10'
			when Стаж between 11 and 20 then 'от 11 до 20'
			else '21 и более'
		end [Пределы стажа], count(*)[Количество водителей]
		from ВОДИТЕЛИ
		group by
		case
			when Стаж between 6 and 10 then 'от 6 до 10'
			when Стаж between 11 and 20 then 'от 11 до 20'
			else '21 и более'
		end) as T 
	order by 
		case [Пределы стажа]
			when 'от 6 до 10' then 3
			when 'от 11 до 20' then 2
			when '21 и более' then 1
			else 0
		end

------------ 4-5

select * from ВОДИТЕЛИ;
select * from МАРШРУТЫ;
select * from ЗАКАЗЫ;

select МАРШРУТЫ.Название_маршрута, round(avg(cast(ВОДИТЕЛИ.Стаж as float(4))), 2) [Средний стаж]
	from МАРШРУТЫ inner join ЗАКАЗЫ
	on МАРШРУТЫ.ID_маршрута = ЗАКАЗЫ.ID_маршрута
	inner join ВОДИТЕЛИ
	on ЗАКАЗЫ.ID_водителя = ВОДИТЕЛИ.ID_водителя
	where МАРШРУТЫ.Название_маршрута like '%-См%' or МАРШРУТЫ.Название_маршрута like '%-М%'
	group by МАРШРУТЫ.Название_маршрута
	order by [Средний стаж];

------------ 5-6

select ЗАКАЗЫ.ID_маршрута, МАРШРУТЫ.Название_маршрута, round(avg(cast(ВОДИТЕЛИ.Стаж as float(4))), 2) [Средний стаж]
	from МАРШРУТЫ inner join ЗАКАЗЫ
	on МАРШРУТЫ.ID_маршрута = ЗАКАЗЫ.ID_маршрута
	inner join ВОДИТЕЛИ
	on ЗАКАЗЫ.ID_водителя = ВОДИТЕЛИ.ID_водителя
	group by ЗАКАЗЫ.ID_маршрута, МАРШРУТЫ.Название_маршрута;

------------ 7

select T.ID_маршрута, T.Количество
	from (select
		case
			when ID_водителя between 1006 and 1010 then 'от 1006 до 1010'
			else '1005 и менее'
		end [Пределы ID], COUNT(*)[Количество], ID_маршрута
		from ЗАКАЗЫ
		group by ЗАКАЗЫ.ID_маршрута,
		case
			when ID_водителя between 1006 and 1010 then 'от 1006 до 1010'
			else '1005 и менее'
		end) as T 
	group by T.ID_маршрута, T.[Пределы ID], T.Количество
	having T.[Пределы ID] in ('от 1006 до 1010');