select
      dm.model_name,
      dm.max_payload_weight,
      count(*) as total_compatible_sensors,
      STRING_AGG(s.sensor_type || ' (' || s.weight_kg || ')', ', ') as compatible_sensors_list
from drone_models dm
JOIN sensors s ON s.weight_kg <= dm.max_payload_weight
group by dm.model_id, dm.model_name, dm.max_payload_weight;



