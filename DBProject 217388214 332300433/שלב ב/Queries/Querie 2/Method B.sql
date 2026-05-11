-- 2025-08-30
-- Titan Mk.221


select o.first_name, o.last_name, o.operator_id
from operators o
where exists 
            (
              select 1
              from operator_certifications oc JOIN drone_models dm
              ON oc.model_id = dm.model_id
              where dm.model_name = 'Titan Mk.221'
              AND oc.license_expiration_date >= '2025-08-30'
              AND oc.operator_id = o.operator_id
            );
