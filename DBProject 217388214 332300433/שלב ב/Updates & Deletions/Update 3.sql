
SELECT * FROM drone_models;

BEGIN;

update drone_models
set max_flight_time = 0.9 * max_flight_time
where model_id IN (select d.model_id
                   from drones d
                   where d.purchase_date < '2023-06-01');


SELECT * FROM drone_models;

ROLLBACK;

SELECT * FROM drone_models;