-- View 2: Perspective of the received department (Agriculture)
CREATE OR REPLACE VIEW agriculture_perspective_view AS
SELECT 
    f.field_name,
    f.area_size_hectares,
    pr.pest_type,
    pr.severity_level,
    pr.report_date
FROM 
    fields f
JOIN 
    pest_reports pr ON f.field_id = pr.field_id;