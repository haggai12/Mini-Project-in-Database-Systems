select m.mission_title, m.mission_date, count(*)as num_of_alerts
from missions m JOIN mission_assignments ma
ON m.mission_id = ma.mission_id
JOIN flight_alerts fa
ON fa.assignment_id = ma.assignment_id
where fa.severity_level = 5
group by m.mission_id, m.mission_title, m.mission_date;