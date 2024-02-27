#include "fibonacci.h"
#include <iostream>
long double fibonacci(int n) { // Посчитать N-ое число Фибоначчи
	if (n == 1 || n == 2)
		return (n - 1);
	return fibonacci(n - 1) + fibonacci(n - 2);
}