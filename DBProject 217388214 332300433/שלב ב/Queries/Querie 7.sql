select
        m.mission_title,
        m.mission_date,
        d.serial_number,
        o.first_name || ' ' || o.last_name as operator,
        STRING_AGG(s.sensor_type, ' , ') as sensors
from drones d
JOIN mission_assignments ma ON d.drone_id = ma.drone_id
JOIN missions m ON ma.mission_id = m.mission_id
JOIN operators o ON ma.operator_id = o.operator_id
JOIN assignment_sensors ass ON ma.assignment_id = ass.assignment_id
JOIN sensors s ON s.sensor_id = ass.sensor_id
JOIN clients c ON c.client_id = m.client_id
where m.mission_date between current_date and current_date + interval '30 days'
AND c.client_name = 'Fanoodle'
group by ma.assignment_id ,m.mission_title, m.mission_date, o.first_name, o.last_name, d.serial_number;