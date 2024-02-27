#include <iostream>
#include <iomanip> 
#include <tchar.h>
#include <time.h>
#include "combi.h"
#include "boat.h"
#include "auxil.h"
using namespace std;

#define N (sizeof(AA)/2)
#define M 3
#define NN 8
#define MM 5
#define SPACE(n) std::setw(n) << " "

int _tmain(int argc, _TCHAR* argv[]) {
    setlocale(LC_ALL, "rus");
    char AA[][2] = { "A", "B", "C", "D" };
    cout << endl << "*** Генератор множества всех подмножеств ***";
    cout << endl << "Исходное множество: ";
    cout << "{ ";
    for (int i = 0; i < sizeof(AA) / 2; i++)
        cout << AA[i] << ((i < sizeof(AA) / 2 - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "Генерация всех подмножеств ";
    combi::subset s1(sizeof(AA) / 2);       // создание генератора   
    int n = s1.getfirst();                  // первое (пустое) подмножество    
    while (n >= 0) {                        // пока есть подмножества
        cout << endl << "{ ";
        for (int i = 0; i < n; i++)
            cout << AA[s1.ntx(i)] << ((i < n - 1) ? ", " : " ");
        cout << "}";
        n = s1.getnext();                   // cледующее подмножество 
    };
    cout << endl << "всего: " << s1.count() << endl;

    //--------------------------------------------------------------------------

    char AA2[][2] = { "A", "B", "C", "D", "E" };
    cout << endl << "*** Генератор сочетаний: ***";
    cout << endl << "Исходное множество: ";
    cout << "{ ";
    for (int i = 0; i < sizeof(AA2) / 2; i++)
        cout << AA2[i] << ((i < sizeof(AA2) / 2 - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "Генерация сочетаний ";
    combi::xcombination xc(sizeof(AA2) / 2, 3);
    cout << "из " << xc.n << " по " << xc.m;
    n = xc.getfirst();
    while (n >= 0) {
        cout << endl << xc.nc << ": { ";
        for (int i = 0; i < n; i++)
            cout << AA2[xc.ntx(i)] << ((i < n - 1) ? ", " : " ");
        cout << "}";
        n = xc.getnext();
    };
    cout << endl << "всего: " << xc.count() << endl;

    //--------------------------------------------------------------------------

    char  AA3[][2] = { "A", "B", "C", "D" };
    cout << endl << "*** Генератор перестановок: ***";
    cout << endl << "Исходное множество: ";
    cout << "{ ";
    for (int i = 0; i < sizeof(AA3) / 2; i++)
        cout << AA3[i] << ((i < sizeof(AA3) / 2 - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "Генерация перестановок ";
    combi::permutation p(sizeof(AA3) / 2);
    __int64  n3 = p.getfirst();
    while (n3 >= 0) {
        cout << endl << setw(4) << p.np << ": { ";
        for (int i = 0; i < p.n; i++)
            cout << AA3[p.ntx(i)] << ((i < p.n - 1) ? ", " : " ");
        cout << "}";
        n3 = p.getnext();
    };
    cout << endl << "всего: " << p.count() << endl;

    //--------------------------------------------------------------------------

    char  AA4[][2] = { "A", "B", "C", "D" };
    cout << endl << "*** Генератор размещений: ***";
    cout << endl << "Исходное множество: ";
    cout << "{ ";
    for (int i = 0; i < N; i++)
        cout << AA4[i] << ((i < N - 1) ? ", " : " ");
    cout << "}";
    cout << endl << "Генерация размещений  из  " << N << " по " << M;
    combi::accomodation s(N, M);
    n = s.getfirst();
    while (n >= 0) {
        cout << endl << setw(2) << s.na << ": { ";
        for (int i = 0; i < 3; i++)
            cout << AA4[s.ntx(i)] << ((i < n - 1) ? ", " : " ");
        cout << "}";
        n = s.getnext();
    };
    cout << endl << "всего: " << s.count() << endl;

    //--------------------------------------------------------------------------

    // задача 5
    /*
        об оптимальной загрузке судна с условием центровки (веса контейнеров сгенерировать случайным образом:
        - количество мест на судне для контейнеров – 5,
        - количество контейнеров 8,
        - веса контейнеров 100 – 200 кг.,
        - доход от перевозки 10 – 100 у.е.;
        - минимальный вес контейнера для каждого места 50 – 120 кг,
        - максимальный вес контейнера для каждого места 150 – 850 кг);
    */
    int v2[NN];     // вес
    int c2[NN];     // доход 
    int minv2[NN];  // минимальный  вес 
    int maxv2[NN];  // максимальный вес
    short r2[MM];
    auxil::start();
    for (int i = 0; i < NN; i++) {
        v2[i] = auxil::iget(100, 200);
        c2[i] = auxil::iget(10, 100);
        minv2[i] = auxil::iget(50, 120);
        maxv2[i] = auxil::iget(150, 850);
    }
    int cc2 = boat_с(
        MM,         // [in]  количество мест для контейнеров
        minv2,      // [in]  максимальный вес контейнера на каждом  месте 
        maxv2,      // [in]  минимальный вес контейнера на каждом  месте  
        NN,         // [in]  всего контейнеров  
        v2,         // [in]  вес каждого контейнера  
        c2,         // [in]  доход от перевозки каждого контейнера   
        r2          // [out] номера  выбранных контейнеров
    );
    cout << endl << "*** Задача о размещении контейнеров на судне: ***";
    cout << endl << "- общее количество контейнеров     : " << NN;
    cout << endl << "- количество мест для контейнеров  : " << MM;
    cout << endl << "- минимальный вес контейнера       : ";
    for (int i = 0; i < MM; i++)
        cout << setw(3) << minv2[i] << " ";
    cout << endl << "- максимальный вес контейнера      : ";
    for (int i = 0; i < MM; i++)
        cout << setw(3) << maxv2[i] << " ";
    cout << endl << "- вес контейнеров                  : ";
    for (int i = 0; i < NN; i++)
        cout << setw(3) << v2[i] << " ";
    cout << endl << "- доход от перевозки               :";
    for (int i = 0; i < NN; i++)
        cout << setw(3) << c2[i] << " ";
    cout << endl << "- выбраны контейнеры (0,1,...,m-1) : ";
    for (int i = 0; i < MM; i++)
        cout << setw(3) << r2[i] + 1 << " ";
    cout << endl << "- с весом                          : ";
    for (int i = 0; i < MM; i++)
        cout << setw(3) << v2[r2[i]] << " ";
    cout << endl << "- с доходом                        : ";
    for (int i = 0; i < MM; i++)
        cout << setw(3) << c2[r2[i]] << " ";
    cout << endl << "- общий доход                      : " << cc2;
    cout << endl;

    // задача 6
    // об оптимальной загрузке судна с условием центровки (количество мест на судне для контейнеров 4 – 8);

    int v[NN + 1];      // вес
    int c[NN + 1];      // доход
    int minv[NN + 1];   // минимальный вес
    int maxv[NN + 1];   // максимальный вес
    short r[NN];
    auxil::start();
    for (int i = 0; i <= NN; i++) {
        v[i] = auxil::iget(100, 200);
        c[i] = auxil::iget(10, 100);
        minv[i] = auxil::iget(50, 120);
        maxv[i] = auxil::iget(150, 850);
    }
    cout << endl << "*** Задача о размещении контейнеров: ***";
    cout << endl << "-- всего контейнеров: " << NN;
    cout << endl << "-- количество ------ продолжительность -- ";
    cout << endl << "   мест              вычисления  ";
    clock_t t1, t2;
    for (int i = 4; i <= NN; i++) {
        t1 = clock();
        boat_с(
            i,          // [in]  количество мест для контейнеров
            minv,       // [in]  минимальный вес контейнера на каждом месте
            maxv,       // [in]  максимальный вес контейнера на каждом месте
            NN,         // [in]  всего контейнеров
            v,          // [in]  вес каждого контейнера
            c,          // [in]  доход от перевозки каждого контейнера
            r           // [out] номера  выбранных контейнеров
        );
        t2 = clock();
        cout << endl << SPACE(7) << setw(2) << i << SPACE(15) << setw(6) << (t2 - t1);
    }
    cout << endl;
    system("pause");
    return 0;
}