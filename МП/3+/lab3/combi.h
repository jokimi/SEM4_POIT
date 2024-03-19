#pragma once 
namespace combi {
	struct permutation {				// генератор перестановок     
		const static bool L = true;		// левая стрелка 
		const static bool R = false;	// правая стрелка   
		short  n,						// кол-во элементов исх. мн-ва 
			* sset;						// массив индексов текущей перестановки
		bool* dart;						// массив  стрелок (левых-L и правых-R) 
		permutation(short n = 1);		// конструктор (кол-во элементов исх. мн-ва) 
		void reset();					// сбросить генератор, начать сначала 
		__int64 getfirst();				// сформировать первый массив индексов    
		__int64 getnext();				// сформировать случайный массив индексов  
		short ntx(short i);				// получить i-й элемент масива индексов 
		unsigned __int64 np;			// номер перестановки 0,... count()-1 
		unsigned __int64 count() const; // вычислить общее кол. перестановок    
	};
};