# Протокол функциональных испытаний (19.11.2026)

| № | Проверка | Исходные данные | Ожидаемый результат | Фактический результат | Подтверждение |
|---|----------|-----------------|---------------------|-----------------------|---------------|
| 1 | Поступление TEMP-01 и HUM-01 | поток Node-RED активен | новые показания каждые 5 с | интервал 5 с, в БД 748+ строк | `practice4/receiver-log.txt`, `practice6/inspect-output.txt` |
| 2 | FAN при температуре выше порога | TEMP = 31 | FAN-01 ON | `state=ON` | `practice5/fan-test.log` |
| 3 | FAN ниже порога | TEMP = 25 | FAN-01 OFF | `state=OFF` | `practice5/fan-test.log` |
| 4 | FAN на границе | TEMP = 30 | FAN-01 OFF | `state=OFF` | `practice5/fan-test.log` |
| 5 | Запись в SQLite | 3 сообщения отправлены | новые строки в таблицах | rows растут: measurements 748, actuator_events 369 | `practice6/sql-check.txt` |
| 6 | Отображение в Grafana | панель открыта | значения и графики обновляются | TEMP 32.1 °C, HUM 62.8 %, FAN, режим AUTO | `practice7/screens/w7_grafana_dashboard.png` |
| 7 | Цель Prometheus | job office-controller | UP | UP | `practice7/screens/w7_prom_targets.png` |
| 8 | Оповещение TEMP-01 | остановлена отправка TEMP | Alerting | firing, возраст 56 с | `practice7/screens/w7_alert_temp.png` |
| 9 | Оповещение HUM-01 | остановлена отправка HUM | Alerting | firing, возраст 54 с | `practice7/screens/w7_alert_hum.png` |
| 10 | Оповещение CTRL-01 | остановлен приёмник | Alerting, датчики — No data | firing, up=0 | `practice7/screens/w7_alert_ctrl.png` |
| 11 | Восстановление | отправка и приёмник запущены | Normal | правила вернулись в Normal | состояние правил в Grafana |
| 12 | Доставка письма | SMTP Яндекса | письмо в ящике | ошибка 535, письмо не доставлено | журнал Grafana, отчёт |
