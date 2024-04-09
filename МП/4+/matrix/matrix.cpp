#include "stdafx.h"
#include "multimatrix.h"   // умножение матриц 

#define N 6
int main() {
	clock_t tstart, tend, timeR, timeD;
	int Mc[N + 1] = { 10, 15, 80, 23, 50, 40, 71 }, Ms[N][N], r = 0, rd = 0;
	memset(Ms, 0, sizeof(int) * N * N);
	tstart = clock();
	r = OptimalM(1, N, N, Mc, OPTIMALM_PARM(Ms));
	tend = clock();
	timeR = tend - tstart;
	setlocale(LC_ALL, "rus");
	cout << endl << "-- расстановка скобок (рекурсивное решение) " << endl;
	cout << endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++) std::cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	cout << endl << "минимальное количество операций умножения: " << r;
	cout << endl << endl << "матрица S" << endl;
	for (int i = 0; i < N; i++) {
		cout << endl;
		for (int j = 0; j < N; j++)
			cout << Ms[i][j] << "  ";
	}
	cout << endl;
	memset(Ms, 0, sizeof(int) * N * N);
	tstart = clock();
	rd = OptimalMD(N, Mc, OPTIMALM_PARM(Ms));
	tend = clock();
	timeD = tend - tstart;
	cout << endl << "-- расстановка скобок (динамическое программирование) " << endl << endl << "размерности матриц: ";
	for (int i = 1; i <= N; i++)
		cout << "(" << Mc[i - 1] << "," << Mc[i] << ") ";
	cout << endl << "минимальное количество операций умножения: " << rd;
	cout << endl << endl << "матрица S" << endl;
	for (int i = 0; i < N; i++) {
		cout << endl;
		for (int j = 0; j < N; j++)
			cout << Ms[i][j] << "  ";
	}
	cout << endl << endl;
	cout << "Время затраченное на рекурсию: " << timeR << endl
		<< "Время затраченное дин. программированием: " << timeD << "\n\n";
	system("pause");
	return 0;
}