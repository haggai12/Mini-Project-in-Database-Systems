
begin;

select * from flight_alerts;

delete from flight_alerts
where alert_id IN ( select fa.alert_id
                    from flight_alerts fa JOIN mission_assignments ma
                    ON fa.assignment_id = ma.assignment_id
                    JOIN missions m ON m.mission_id = ma.mission_id
                    where fa.severity_level <= 2
                    AND m.mission_date < current_date - interval '1 year');


select * from flight_alerts;

rollback;

select * from flight_alerts;