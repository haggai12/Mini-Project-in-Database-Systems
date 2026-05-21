-- Delete 3: Remove certifications for operators who haven't renewed in 3 years AND haven't flown in 2 years

BEGIN;

SELECT * FROM operator_certifications;

delete from operator_certifications
where operator_id NOT IN (select oc.operator_id 
                          from operator_certifications oc 
                          where oc.license_expiration_date >= current_date - interval '3 year')
AND operator_id NOT IN (select ma.operator_id
                        from mission_assignments ma JOIN missions m ON ma.mission_id = m.mission_id
                        where m.mission_date >= current_date - interval '2 year');

SELECT * FROM operator_certifications;

ROLLBACK;

SELECT * FROM operator_certifications;