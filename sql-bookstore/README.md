# SQL Database Projects Collection

Репозиторий содержит набор проектов по работе с базами данных, включая схемы БД, запросы и аналитику для различных предметных областей.

## 📂 Структура репозитория

### 1. HR Analytics Database
**Файл:** `hr_analytics_queries.sql`  
**Описание:**  
- Аналитические запросы по кадровым данным (зарплаты, возраст, департаменты)
- Использует: агрегатные функции, JOIN, подзапросы, CTE (WITH), ROLLUP
- Таблицы: employees, departments, jobs

**Ключевые запросы:**
- Средняя зарплата по возрастам
- Годовая зарплата по отделам с итогами
- Анализ возраста сотрудников
- Распределение по должностям

### 2. University Database Schema
**Файл:** `university_database_schema.sql`  
**Описание:**  
- Полная схема базы данных учебного заведения
- Сущности: студенты, преподаватели, курсы, задания
- Реляционные связи с внешними ключами
- Примеры наполнения данных

**Основные таблицы:**
- `Человек` (базовая сущность)
- `Преподаватель` (наследование)
- `Студент`
- `Курс` и `Зачисление`

### 3. Social Network Implementation
**Файл:** `social_network_db_schema.sql`  
**Описание:**  
- Реализация социальной сети с пользователями, сообщениями и друзьями
- Примеры сложных запросов для анализа соцграфа

**Особенности:**
- Таблица `friend_requests` с ENUM статусами
- Система личных сообщений
- Сообщества пользователей
- Оптимизированные внешние ключи (ON UPDATE/DELETE CASCADE)

**Аналитические запросы:**
- Поиск друзей пользователя
- Поиск участников сообществ
- Анализ переписки

## 🛠 Технологии
- PostgreSQL (основная СУБД)
- Стандарты SQL:2016
- Расширения: ENUM, SERIAL, ARRAY_AGG

## 🚀 Как использовать
1. Клонировать репозиторий
2. Запустить файлы в PSQL или pgAdmin:
```bash
psql -U your_user -d your_db -f filename.sql
