SELECT ЗАКАЗЫ.*, Дата_поставки AS Expr1
FROM     ЗАКАЗЫ
WHERE  (Дата_поставки > CONVERT(DATETIME, '2024-03-12 00:00:00', 102))

SELECT ТОВАРЫ.*, Цена AS Expr1
FROM     ТОВАРЫ
WHERE  (Цена > 40 AND Цена < 400)

SELECT Заказчик, Наименование_товара AS Expr1
FROM     ЗАКАЗЫ
WHERE  (Наименование_товара = N'Стул')

SELECT ЗАКАЗЫ.*, Заказчик AS Expr1, Дата_поставки AS Expr2
FROM     ЗАКАЗЫ
WHERE  (Заказчик = N'ISsoft')
ORDER BY Expr2