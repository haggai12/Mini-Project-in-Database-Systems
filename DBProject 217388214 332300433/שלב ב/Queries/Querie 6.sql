select dm.model_id, dm.model_name, sum(ml.cost) as total_cost_for_2025
from 
maintenance_logs ml JOIN drones d
  ON ml.drone_id = d.drone_id
  JOIN drone_models dm
  ON d.model_id = dm.model_id
where ml.maintenance_date >= '2025-01-01' and ml.maintenance_date < '2026-01-01'
group by dm.model_id, dm.model_name
having sum(ml.cost) >= 5000 -- optional
;