#include "stdafx.h"
#define _rand(min, max) ( rand() % ((max) - (min) + 1) + (min) )

int _tmain(int argc, _TCHAR* argv[]) {
	setlocale(LC_ALL, "rus");
	srand(time(NULL));
	char abc[25]; // наш алфавит
	char s1[300];
	char s2[250];
	for (int i = 97, n = 0; i <= 122; ++i, ++n)		// заполняем массив
		abc[n] = (char)i;
	cout << "S1 = ";
	for (int i = 0; i < 300; i++) {
		s1[i] = abc[_rand(0, 26)];
		if (i % 50 == 0)
			cout << endl;
		cout << s1[i];
	}
	cout << endl << endl << "S2 =";
	for (int i = 0; i < 200; i++) {
		s2[i] = abc[_rand(0, 25)];
		if (i % 50 == 0)
			cout << std::endl;
		cout << s2[i];
	}
	clock_t t1 = 0;
	clock_t t2 = 0;
	clock_t	t3 = 0;
	clock_t t4 = 0;
	int  lx = sizeof(s1);
	int ly = sizeof(s2);
	int S1_size[]{ 12, 15, 20, 30, 60, 150, 300 };
	int S2_size[]{ 10, 13, 17, 25, 50, 125, 250 };
	cout << endl;
	cout << endl << "-- расстояние Левенштейна -----" << endl;
	cout << endl << "-- длина --- рекурсия -- дин.програм. ---" << endl;
	for (int i = 0; i < min(lx, ly); i++) {
		t1 = clock();
		loewenstein_r(S1_size[i], s1, S2_size[i], s2);
		t2 = clock();
		t3 = clock();
		loewenstein(S1_size[i], s1, S2_size[i], s2);
		t4 = clock();
		cout << right << setw(5) << S1_size[i] << "/" << setw(2) << S2_size[i]
			<< "       " << left << setw(10) << (t2 - t1)
			<< "     " << setw(10) << (t4 - t3) << endl;
	}
	system("pause");
	return 0;
}