update maintenance_logs
set cost = 1.15 * cost
where drone_id IN (select d.drone_id
                      from drones d
                      where d.purchase_date < '2024-01-01');