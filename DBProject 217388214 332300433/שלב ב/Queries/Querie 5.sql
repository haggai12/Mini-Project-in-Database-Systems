select o.first_name, o.last_name, STRING_AGG(dm.model_name, ', ') as expiring_models
from operator_certifications oc
JOIN drone_models dm ON oc.model_id = dm.model_id
JOIN operators o ON oc.operator_id = o.operator_id
WHERE oc.license_expiration_date BETWEEN current_date and current_date + interval '60 days'
group by oc.operator_id, o.first_name, o.last_name;