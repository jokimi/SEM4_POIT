#include "stdafx.h"
#define CYCLE 1000000
int main() {
	setlocale(LC_ALL, "rus");
	double  av1 = 0, av2 = 0;
	clock_t  t1 = 0, t2 = 0;
	auxil::start();                          // старт генерации 
	t1 = clock();                            // фиксация времени 
	for (int i = 0; i < CYCLE; i++)
	{
		av1 += (double)auxil::iget(-100, 100); // сумма случайных чисел 
		av2 += auxil::dget(-100, 100);         // сумма случайных чисел 
	}
	t2 = clock();                            // фиксация времени 


	std::cout << std::endl << "количество циклов:         " << CYCLE;
	std::cout << std::endl << "среднее значение (int):    " << av1 / CYCLE;
	std::cout << std::endl << "среднее значение (double): " << av2 / CYCLE;
	std::cout << std::endl << "продолжительность (у.е.):  " << (t2 - t1);
	std::cout << std::endl << "                   (сек):  "
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC);
	std::cout << std::endl;
	system("pause");

	int num;
	cout << endl << "Введите число: ";
	cin >> num;
	t1 = clock();
	int result = fibonacci(num + 1);
	cout << endl << num << " число Фибоначчи - " << result << endl;
	t2 = clock();
	std::cout << std::endl << "продолжительность (у.е.):   " << (t2 - t1);
	std::cout << std::endl << "продолжительность (сек):   "
		<< ((double)(t2 - t1)) / ((double)CLOCKS_PER_SEC) << "\n\n";
	return 0;
}