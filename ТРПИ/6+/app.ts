type Person = {
    id: number;
    name: string;
    group: number;
}

const array: Person[] = [
    { id: 1, name: 'Vasya', group: 10 },
    { id: 2, name: 'Ivan', group: 11 },
    { id: 3, name: 'Masha', group: 12 },
    { id: 4, name: 'Petya', group: 10 },
    { id: 5, name: 'Kira', group: 11 },
];

// ====================================================================

type CarsType = {
    manufacturer?: string;
    model?: string;
}

let car: CarsType = {}; // объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';

// ====================================================================

type iCarsType = {
    manufacturer: string;
    model: string;
}

type ArrayCarsType = {
    cars: iCarsType[];
}

const car1: iCarsType = {
    manufacturer: "manufacturer",
    model: "model"
};

const car2: iCarsType = {
    manufacturer: "manufacturer",
    model: "model"
};

const arrayCars: Array<ArrayCarsType> = [{
    cars: [car1, car2]
}];

// ====================================================================

type MarkFilterType = number;
type DoneType = boolean;
type GroupFilterType = number;

type MarkType = {
    subject: string;
    mark: MarkFilterType;                                       // может принимать значения от 1 до 10
    done: DoneType;
};

type StudentType = {
    id: number;
    name: string;
    group: GroupFilterType;                                     // может принимать значения от 1 до 12
    marks: MarkType[];
};

type GroupType = {
    students: StudentType[];
    studentsFilter: (group: GroupFilterType) => StudentType[];  // фильтр по группе
    marksFilter: (mark: MarkFilterType) => StudentType[];       // фильтр по оценке
    deleteStudent: (id: number) => void;                        // удалить студента по id из исходного массива
    mark: MarkFilterType;
    group: GroupFilterType;
};

const group: GroupType = {
    students: [],
    studentsFilter: function (group: GroupFilterType): StudentType[] {
        return this.students.filter((student) => student.group === group);
    },
    marksFilter: function (mark: MarkFilterType): StudentType[] {
        return this.students.filter((student) =>
            student.marks.some((markObj) => markObj.mark === mark)
        );
    },
    deleteStudent: function (id: number): void {
        this.students = this.students.filter((student) => student.id !== id);
    },
    mark: 0,
    group: 0,
};

const student1: StudentType = {
    id: 1,
    name: "Alice",
    group: 1,
    marks: [
        { subject: "Math", mark: 7, done: true },
        { subject: "English", mark: 9, done: true }
    ]
}
const student2: StudentType = {
    id: 2,
    name: "Bob",
    group: 2,
    marks: [
        { subject: "Math", mark: 6, done: true },
        { subject: "English", mark: 7, done: true }
    ]
}

const student3: StudentType = {
    id: 3,
    name: "Mary",
    group: 1,
    marks: [
        { subject: "Math", mark: 8, done: true },
        { subject: "English", mark: 9, done: true }
    ]
}

group.students.push(student1, student2, student3);

for (let i = 1; i <= 12; i++) {
    let studentGroups = group.studentsFilter(i);
    console.log(studentGroups);
}
console.log()
for (let i = 1; i <= 12; i++) {
    let studentMarks = group.marksFilter(9);
    console.log(studentMarks);
}
console.log()
    group.deleteStudent(3);
    console.log(group.students);