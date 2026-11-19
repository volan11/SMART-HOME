# Протокол функциональных испытаний (19.11.2026)

| № | Проверка | Исходные данные | Ожидаемый результат | Фактический результат | Подтверждение |
|---|----------|-----------------|---------------------|-----------------------|---------------|
| 1 | Поступление TEMP-01 и HUM-01 | поток Node-RED активен | новые показания каждые 5 с | интервал 5 с, в БД более 1100 строк | `practice4/receiver-log.txt`, `practice6/inspect-output.txt` |
| 2 | FAN при температуре выше порога | TEMP = 31 | FAN-01 ON | `state=ON` | `practice5/fan-test.log` |
| 3 | FAN ниже порога | TEMP = 25 | FAN-01 OFF | `state=OFF` | `practice5/fan-test.log` |
| 4 | FAN на границе | TEMP = 30 | FAN-01 OFF | `state=OFF` | `practice5/fan-test.log` |
| 5 | Запись в SQLite | 3 сообщения отправлены | новые строки в таблицах | rows растут: measurements 1109, actuator_events 550 | `practice6/sql-check.txt` |
| 6 | Отображение в Grafana | панель открыта | значения и графики обновляются | TEMP 32.1 °C, HUM 62.8 %, FAN, режим AUTO | `practice7/screens/w7_grafana_dashboard.png` |
| 7 | Цель Prometheus | job office-controller | UP | UP | `practice7/screens/w7_prom_targets.png` |
| 8 | Оповещение TEMP-01 | остановлена отправка TEMP | Alerting + письмо | firing, возраст 56 с; письмо [FIRING] 14:52 | `practice7/screens/w7_alert_temp.png`, `practice7/mail-evidence.txt` |
| 9 | Оповещение HUM-01 | остановлена отправка HUM | Alerting + письмо | firing, возраст 54 с; письмо [FIRING] 14:54 | `practice7/screens/w7_alert_hum.png`, `practice7/mail-evidence.txt` |
| 10 | Оповещение CTRL-01 | остановлен приёмник | Alerting, датчики — No data | firing, up=0 | `practice7/screens/w7_alert_ctrl.png` |
| 11 | Восстановление | отправка и приёмник запущены | Normal + письмо [RESOLVED] | правила вернулись в Normal; письма [RESOLVED] 14:53 и 14:56 | `practice7/mail-evidence.txt` |
| 12 | Доставка письма | SMTP Яндекса | письмо в ящике | получены [FIRING] и [RESOLVED] по TEMP-01 (14:52, 14:53) и HUM-01 (14:54, 14:56) | `practice7/mail-evidence.txt` |
