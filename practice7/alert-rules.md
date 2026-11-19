# Правила оповещения Grafana (отчёт №7)

Группа: office-sensors. Evaluation interval: 10s. Pending period: 0s.
Контакт: Email.

## 1. TEMP-01: нет показаний
expr: office_sensor_age_seconds{sensor_id="TEMP-01"} and on(job,instance) (up{job="office-controller"} == 1)
Условие: Reduce Last > 20
Смысл: датчик молчит дольше 20 секунд при доступном CTRL-01.

## 2. HUM-01: нет показаний
expr: office_sensor_age_seconds{sensor_id="HUM-01"} and on(job,instance) (up{job="office-controller"} == 1)
Условие: Reduce Last > 20

## 3. CTRL-01 недоступен
expr: up{job="office-controller"}
Условие: Reduce Last < 1
Смысл: упало приложение-приёмник. Правила датчиков молчат, потому что в них
есть up == 1, — так отличаем пропажу датчика от пропажи CTRL.

## Проверки
1. Остановлена периодическая отправка TEMP-01: цель UP, возраст TEMP растёт,
   HUM обновляется, правило TEMP -> Alerting.
2. Остановлен приёмник: цель DOWN, срабатывает правило по up, панель не
   показывает последние значения как текущие.
3. То же для HUM-01.
