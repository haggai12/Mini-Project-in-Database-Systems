select d.drone_id, d.serial_number, T1.latest_maintenance, ml.work_description, ml.cost

from
(select ml.drone_id, max(ml.maintenance_date) as latest_maintenance
from maintenance_logs ml
group by ml.drone_id) T1

JOIN

maintenance_logs ml

ON T1.drone_id = ml.drone_id and T1.latest_maintenance = ml.maintenance_date

JOIN

drones d

ON T1.drone_id = d.drone_id;