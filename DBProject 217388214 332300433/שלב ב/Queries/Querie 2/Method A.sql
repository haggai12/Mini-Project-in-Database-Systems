-- 2025-08-30
-- Titan Mk.221

select o.first_name, o.last_name, o.operator_id
from drone_models dm JOIN operator_certifications oc ON dm.model_id = oc.model_id
JOIN operators o ON oc.operator_id = o.operator_id
where dm.model_name = 'Titan Mk.221' and '2025-08-30' <= oc.license_expiration_date;