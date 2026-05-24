EXPLAIN analyze
select * from flight_alerts 
where alert_timestamp >= '2026-03-26 00:00:00'
AND   alert_timestamp < '2026-03-27 00:00:00';