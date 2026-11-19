-- Отчёт №6. Создание БД telemetry.sqlite3
-- Запуск на DB-01 в папке practice6:
--   mkdir -p data
--   sqlite3 data/telemetry.sqlite3 < create_db.sql
--   sqlite3 data/telemetry.sqlite3 ".tables"
--
-- ВАЖНО: порядок столбцов в таблицах может быть любой, но имена, типы,
-- NOT NULL, PRIMARY KEY и DEFAULT '{}' у labels проверяются программой
-- server.py при старте. Если что-то не совпадёт — контейнер не запустится.

CREATE TABLE measurements (
  id INTEGER PRIMARY KEY,
  source TEXT NOT NULL,
  device_id TEXT NOT NULL,
  metric TEXT NOT NULL,
  zone TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  received_at INTEGER NOT NULL,
  value REAL NOT NULL,
  unit TEXT NOT NULL,
  labels TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE actuator_events (
  id INTEGER PRIMARY KEY,
  source TEXT NOT NULL,
  device_id TEXT NOT NULL,
  zone TEXT NOT NULL,
  timestamp INTEGER NOT NULL,
  received_at INTEGER NOT NULL,
  state TEXT NOT NULL,
  mode TEXT NOT NULL
);
