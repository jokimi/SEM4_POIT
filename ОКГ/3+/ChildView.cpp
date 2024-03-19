// ChildView.cpp: реализация класса CChildView

#include "pch.h"
#include "framework.h"
#include "lab3.h"
#include "ChildView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif
#define pi 3.14159265358979323846;

CChildView::CChildView() { }
CChildView::~CChildView() { }

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	// сообщения меню выбора
	ON_COMMAND(ID_TESTS_TEST, &CChildView::OnTestsF1)
	ON_COMMAND(ID_TESTS_F2, &CChildView::OnTestsF2)
	ON_COMMAND(ID_TESTS_F3, &CChildView::OnTestsF3)
END_MESSAGE_MAP()

// Обработчики сообщений CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) {
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;
	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(nullptr, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), nullptr);
	return TRUE;
}

void CChildView::OnPaint() {
	CPaintDC dc(this);			// контекст устройства для рисования
	if (Index == 1)	{			// режим отображения MM_TEXT
		Graph.Draw(dc, 1, 1);
	}
}

double CChildView::MyF1(double x) {
	double y = sin(x) / x;
	return y;
}

double CChildView::MyF2(double x) {
	double y = sqrt(x) * sin(x);
	return y;
}

void CChildView::OnTestsF1() {	// MM_TEXT
	double Xl = -3 * pi;		// Координата Х левого угла области
	double Xh = -Xl;			// Координата Х правого угла области
	double dX = 3.14159265358979323846 / 36;		// Шаг графика функции
	int N = (Xh - Xl) / dX;		// Количество точек графика
	X.RedimMatrix(N + 1);		// Создаем вектор с N+1 строками для хранения координат точек по Х
	Y.RedimMatrix(N + 1);		// Создаем вектор с N+1 строками для хранения координат точек по Y
	for (int i = 0; i <= N; i++) {
		X(i) = Xl + i * dX;		// Заполняем массивы/векторы значениями
		Y(i) = MyF1(X(i));
	}
	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));	// Устанавливаем параметры пера для линий (сплошная линия, толщина 1, цвет красный)
	PenAxis.Set(PS_SOLID, 2, RGB(0, 0, 255));	// Устанавливаем параметры пера для осей (сплошная линия, толщина 2, цвет синий)
	RW.SetRect(100, 100, 500, 500);				// Установка параметров прямоугольной области для отображения графика в окне
	Graph.SetParams(X, Y, RW);					// Передаем векторы с координатами точек и область в окне
	Graph.SetPenLine(PenLine);					// Установка параметров пера для линии графика
	Graph.SetPenAxis(PenAxis);					// Установка параметров пера для линий осей 
	Index = 1;									// Помечаем для режима отображения MM_TEXT
	this->Invalidate();
}

void CChildView::OnTestsF2() {
	double Xl = 0;
	double Xh = 6 * pi;
	double dX = 3.14159265358979323846 / 36;
	int N = (Xh - Xl) / dX;
	X.RedimMatrix(N + 1);
	Y.RedimMatrix(N + 1);
	for (int i = 0; i <= N; i++) {
		X(i) = Xl + i * dX;
		Y(i) = MyF2(X(i));
	}
	PenLine.Set(PS_DASHDOT, 1, RGB(255, 0, 0));
	PenAxis.Set(PS_SOLID, 2, RGB(0, 0, 0));
	RW.SetRect(100, 100, 500, 500);
	Graph.SetParams(X, Y, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
	Index = 1;
	this->Invalidate();
}

void CChildView::OnTestsF3() {
	Invalidate();
	CPaintDC dc(this);

	// Установка параметров пера для отображения фигуры
	CPen penFigure(PS_SOLID, 3, RGB(255, 0, 0));
	dc.SelectObject(&penFigure);

	// Установка параметров пера для отображения окружности
	CPen penCircle(PS_SOLID, 2, RGB(0, 0, 255));

	// Расчет размеров квадрата
	CRect rect;
	GetClientRect(&rect);
	const int squareSize = min(rect.Width(), rect.Height());

	// Расчет координат точек восьмиугольника
	const double radius = squareSize / 2.0;
	const double angle = 45.0; // Угол между двумя соседними сторонами восьмиугольника
	const double centerX = rect.left + squareSize / 2.0; // Координаты центра квадрата
	const double centerY = rect.top + squareSize / 2.0;
	const double circleRadius = radius; // Радиус окружности, в которую вписан восьмиугольник
	const double circleLeft = centerX - circleRadius;
	const double circleTop = centerY - circleRadius;
	const double circleRight = centerX + circleRadius;
	const double circleBottom = centerY + circleRadius;

	// Отображение окружности
	dc.SelectObject(&penCircle);
	dc.Ellipse(circleLeft, circleTop, circleRight, circleBottom);

	// Отображение восьмиугольника
	const int sides = 8;
	const double angleRadians = angle * 3.14159 / 180.0;
	const double startX = centerX + radius;
	const double startY = centerY;
	double currentX = startX;
	double currentY = startY;

	for (int i = 0; i < sides; i++) {
		double nextX = centerX + radius * cos(angleRadians * i);
		double nextY = centerY - radius * sin(angleRadians * i);

		// Установка стиля линии для каждой стороны восьмиугольника
		if (i % 2 == 0)
			dc.SelectObject(&penFigure);
		else
			dc.SelectObject(&penFigure);
		dc.MoveTo((int)currentX, (int)currentY);
		dc.LineTo((int)nextX, (int)nextY);
		currentX = nextX;
		currentY = nextY;
	}

	// Отображение последней стороны восьмиугольника
	dc.SelectObject(&penFigure);
	dc.MoveTo((int)currentX, (int)currentY);
	dc.LineTo((int)startX, (int)startY);

	const int pointX1 = 100;
	const int pointY1 = 50;
	const int pointSize1 = 3;
	CPen penPoint1(PS_SOLID, 1, RGB(255, 0, 0)); // Красный цвет
	dc.SelectObject(&penPoint1);
	dc.SelectStockObject(NULL_BRUSH);
	dc.Ellipse(pointX1, pointY1, pointX1 + pointSize1, pointY1 + pointSize1);

	const int pointX2 = 550;
	const int pointY2 = 50;
	const int pointSize2 = 3;
	CPen penPoint2(PS_SOLID, 1, RGB(0, 255, 0)); // Красный цвет
	dc.SelectObject(&penPoint2);
	dc.SelectStockObject(NULL_BRUSH);
	dc.Ellipse(pointX2, pointY2, pointX2 + pointSize2, pointY2 + pointSize2);
}