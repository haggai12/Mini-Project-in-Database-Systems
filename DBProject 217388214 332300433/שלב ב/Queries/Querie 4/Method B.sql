with num_alerts_per_mission as
    (select ma.mission_id, count(*) as num_of_alerts
    from flight_alerts fa JOIN mission_assignments ma
    ON fa.assignment_id = ma.assignment_id
    where fa.severity_level = 5
    group by ma.mission_id)
select m.mission_title, m.mission_date, napm.num_of_alerts
from num_alerts_per_mission napm JOIN missions m
ON napm.mission_id = m.mission_id;