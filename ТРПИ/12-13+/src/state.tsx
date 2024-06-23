export interface MovieTypeSt {
    imagesrc: string;
    title: string;
    year: string;
    type: string;
}

export const MOVIES: MovieTypeSt[] = [
    { imagesrc: '/images/homealone.jpeg', title: 'Один дома', year: '1990', type: 'movie' },
    { imagesrc: '/images/aladdin.jpg', title: 'Аладдин', year: '2019', type: 'movie' },
    { imagesrc: '/images/sinister.jpg', title: 'Синистер', year: '2012', type: 'movie' },
    { imagesrc: '/images/titanic.jpg', title: 'Титаник', year: '1997', type: 'movie' },
    { imagesrc: '/images/themeg.jpg', title: 'Мег', year: '1994', type: 'movie' },
    { imagesrc: '/images/life.jpg', title: 'Живое', year: '2017', type: 'movie' },

    { imagesrc: '/images/interns.jpg', title: 'Интерны', year: '2010', type: 'serial' },
    { imagesrc: '/images/supernatural.jpg', title: 'Сверхъестественное', year: '2005', type: 'serial' },
    { imagesrc: '/images/drhouse.jpg', title: 'Доктор Хаус', year: '2004', type: 'serial' },
    { imagesrc: '/images/sherlock.jpg', title: 'Шерлок', year: '2010', type: 'serial' },
    { imagesrc: '/images/frommetoyou.jpg', title: 'Достучаться до тебя', year: '2023', type: 'serial' },
    { imagesrc: '/images/wednesday.jpg', title: 'Уэнсдэй', year: '2022', type: 'serial' },

    { imagesrc: '/images/shrek.jpg', title: 'Шрек', year: '2001', type: 'cartoon' },
    { imagesrc: '/images/kikorikidejavu.jpg', title: 'Смешарики: Дежавю', year: '2018', type: 'cartoon' },
    { imagesrc: '/images/encanto.png', title: 'Энканто', year: '2021', type: 'cartoon' },
    { imagesrc: '/images/sakura.jpg', title: 'Сакура — ловец карт', year: '1998', type: 'cartoon' },
    { imagesrc: '/images/tomnjerry.jpg', title: 'Том и Джерри', year: '2021', type: 'cartoon' },
    { imagesrc: '/images/insideout.jpg', title: 'Головоломка', year: '2015', type: 'cartoon' },
]