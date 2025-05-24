-- Создание таблицы Человек
CREATE TABLE Человек (
    id SERIAL PRIMARY KEY,
    ФИО VARCHAR(255),
    Дата_рождения DATE,
    Номер_телефона VARCHAR(15)
);

-- Создание таблицы Кафедра
CREATE TABLE Кафедра (
    id SERIAL PRIMARY KEY,
    Название_кафедры VARCHAR(255),
    Устав TEXT
);

-- Создание таблицы Преподаватель
CREATE TABLE Преподаватель (
    id INT PRIMARY KEY REFERENCES Человек(id),
    Диплом VARCHAR(255),
    Дата_начала_трудовой_деятельности DATE,
    Адрес_проживания VARCHAR(255),
    Кафедра_id INT REFERENCES Кафедра(id)
);

-- Создание таблицы Студент
CREATE TABLE Студент (
    id INT PRIMARY KEY REFERENCES Человек(id)
);

-- Создание таблицы Курс
CREATE TABLE Курс (
    id SERIAL PRIMARY KEY,
    Название_курса VARCHAR(255),
    Продолжительность INT,
    Преподаватель_id INT REFERENCES Преподаватель(id)
);

-- Создание таблицы Зачисление
CREATE TABLE Зачисление (
    id SERIAL PRIMARY KEY,
    Студент_id INT REFERENCES Студент(id),
    Курс_id INT REFERENCES Курс(id),
    Дата_зачисления DATE
);

-- Создание таблицы Домашнее задание
CREATE TABLE Домашнее_задание (
    id SERIAL PRIMARY KEY,
    Название_задания VARCHAR(255),
    Описание TEXT
);

-- Создание таблицы Назначение задания
CREATE TABLE Назначение_задания (
    id SERIAL PRIMARY KEY,
    Студент_id INT REFERENCES Студент(id),
    Задание_id INT REFERENCES Домашнее_задание(id)
);
это как назвать ?
