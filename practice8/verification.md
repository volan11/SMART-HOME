# Снимок состояния стенда (финальная проверка)

Снимок состояния стенда SMART-HOME
Дата: 19.11.2026 14:31:48 MSK

== CTRL-01

{"status":"ok","version":3,"endpoints":["/api/readings","/api/actuators","/metrics"]}
ctrl-receiver-1=Up 16 minutes
office_temperature_celsius{sensor_id="TEMP-01",zone="server_room"} 26.7
office_humidity_percent{sensor_id="HUM-01",zone="work_area"} 51.9
office_fan_on{actuator_id="FAN-01",zone="server_room"} 0
office_sensor_age_seconds{sensor_id="TEMP-01"} 3.7060000896453857
office_sensor_age_seconds{sensor_id="HUM-01"} 2.6529998779296875

== IOT-01

node-red=Up 54 minutes (healthy)
nodered_http=200

== DB-01

{"status": "ok", "storage": "sqlite", "version": 2}
practice6-storage-1=Up 48 minutes (healthy)
measurements 1109
actuator_events 550

== MON-01

active active 
prom_up 1
rule TEMP-01 no readings inactive
rule HUM-01 no readings inactive
rule CTRL-01 receiver is down inactive


## Выводы проверки

- Приёмник на CTRL-01 отвечает, версия 3, метрики отдаются, возраст показаний менее 5 секунд.
- Node-RED на IOT-01 работает (HTTP 200), поток активен.
- Сервис хранения на DB-01 здоров, база пополняется (на момент снимка 1109 измерений и 550 событий).
- Prometheus и Grafana активны, цель office-controller UP, правила оповещения в состоянии Normal.
- SMTP Яндекса работает: письма [FIRING] и [RESOLVED] по TEMP-01 и HUM-01 доставлены в почтовый ящик
  (подтверждение — practice7/mail-evidence.txt).
