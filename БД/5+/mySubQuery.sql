use K_MyBase;

select distinct ��������.��������_��������, ������.����_�����������
	from ��������, ��������, ������
	where ��������.ID_�������� = ������.ID_��������
		and ��������.ID_�������� in (select ������.ID_�������� from ������ where ������.����_����������� like '%2024-02%')

select distinct ��������.��������_��������, ������.����_�����������
	from �������� inner join ������
	on ��������.ID_�������� = ������.ID_��������
	where ��������.ID_�������� in (select ������.ID_�������� from ������ where ������.����_����������� like '%2024-02%')

select distinct ��������.��������_��������, ������.����_�����������
	from �������� inner join ������
	on ��������.ID_�������� = ������.ID_��������
	inner join ��������
	on ������.ID_�������� = ��������.ID_��������
	where ������.����_����������� like '%2024-02%'

select ID_��������, �������, ����
	from �������� dr1
	where ������� = (select top(1) �������
		from �������� dr2
		where dr2.���� = dr1.����
		and ���� > 10
		order by ���� desc)

select ��������.������� from ��������
	where not exists (select * from ������ where ������.ID_�������� = ��������.ID_��������)

select top 1
	(select avg(�����_���������) from ������ where ����_����������� like '%2024-02%')[02.2024],
	(select avg(�����_���������) from ������ where ����_����������� like '%2023-12%')[12.2023]
from ������

select �������, ����
	from ��������
	where ������� >= all (select ������� from �������� where ���� like 12);

select �������, ����
	from ��������
	where ������� >= any (select ������� from �������� where ���� like 36);