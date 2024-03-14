use K_MyBase;

------------ 1-2

select ��������.��������_��������,
	max(������.ID_��������) as [������������ ID ��������],
	min(������.ID_��������) as [����������� ID ��������],
	avg(������.ID_��������) as [������� ID ��������],
	sum(������.ID_��������) as [����� ID ���������],
	count(*) as [���������� ���������]
from �������� inner join ������ on ������.ID_�������� = ��������.ID_��������
group by ��������.��������_��������

------------ 3

select * from ��������;

select * 
	from (select 
		case
			when ���� between 6 and 10 then '�� 6 �� 10'
			when ���� between 11 and 20 then '�� 11 �� 20'
			else '21 � �����'
		end [������� �����], count(*)[���������� ���������]
		from ��������
		group by
		case
			when ���� between 6 and 10 then '�� 6 �� 10'
			when ���� between 11 and 20 then '�� 11 �� 20'
			else '21 � �����'
		end) as T 
	order by 
		case [������� �����]
			when '�� 6 �� 10' then 3
			when '�� 11 �� 20' then 2
			when '21 � �����' then 1
			else 0
		end

------------ 4-5

select * from ��������;
select * from ��������;
select * from ������;

select ��������.��������_��������, round(avg(cast(��������.���� as float(4))), 2) [������� ����]
	from �������� inner join ������
	on ��������.ID_�������� = ������.ID_��������
	inner join ��������
	on ������.ID_�������� = ��������.ID_��������
	where ��������.��������_�������� like '%-��%' or ��������.��������_�������� like '%-�%'
	group by ��������.��������_��������
	order by [������� ����];

------------ 5-6

select ������.ID_��������, ��������.��������_��������, round(avg(cast(��������.���� as float(4))), 2) [������� ����]
	from �������� inner join ������
	on ��������.ID_�������� = ������.ID_��������
	inner join ��������
	on ������.ID_�������� = ��������.ID_��������
	group by ������.ID_��������, ��������.��������_��������;

------------ 7

select T.ID_��������, T.����������
	from (select
		case
			when ID_�������� between 1006 and 1010 then '�� 1006 �� 1010'
			else '1005 � �����'
		end [������� ID], COUNT(*)[����������], ID_��������
		from ������
		group by ������.ID_��������,
		case
			when ID_�������� between 1006 and 1010 then '�� 1006 �� 1010'
			else '1005 � �����'
		end) as T 
	group by T.ID_��������, T.[������� ID], T.����������
	having T.[������� ID] in ('�� 1006 �� 1010');