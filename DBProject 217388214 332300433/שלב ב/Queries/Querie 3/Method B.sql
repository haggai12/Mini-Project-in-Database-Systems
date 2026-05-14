
select d.drone_id, d.serial_number, T.maintenance_date, T.work_description, T.cost
from (
    select ml.drone_id, ml.maintenance_date, ml.work_description, ml.cost,
    ROW_NUMBER() over (partition by ml.drone_id order by ml.maintenance_date desc) as num_maintenance
    from maintenance_logs ml
    ) T JOIN drones d
    ON T.drone_id = d.drone_id
where T.num_maintenance = 1;