select distinct dm.model_name, dm.manufacturer, dm.max_flight_time , dm.max_payload_weight 
from drone_models dm join drones d
on dm.model_id = d.model_id
where not exists
	(
	select 1
	from missions m JOIN mission_assignments ma
	on m.mission_id = ma.mission_id
	where ma.drone_id = d.drone_id and m.mission_date = '2025-08-30'
	);