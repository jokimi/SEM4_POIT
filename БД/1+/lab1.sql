SELECT ������.*, ����_�������� AS Expr1
FROM     ������
WHERE  (����_�������� > CONVERT(DATETIME, '2024-03-12 00:00:00', 102))

SELECT ������.*, ���� AS Expr1
FROM     ������
WHERE  (���� > 40 AND ���� < 400)

SELECT ��������, ������������_������ AS Expr1
FROM     ������
WHERE  (������������_������ = N'����')

SELECT ������.*, �������� AS Expr1, ����_�������� AS Expr2
FROM     ������
WHERE  (�������� = N'ISsoft')
ORDER BY Expr2