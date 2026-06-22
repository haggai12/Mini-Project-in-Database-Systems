-- View 1: Perspective of the original department (Drone Management)
CREATE OR REPLACE VIEW drone_perspective_view AS
SELECT 
    m.Mission_ID,
    m.Mission_Title,
    m.Mission_Date,
    p.pest_type,
    p.severity_level
FROM 
    MISSIONS m
JOIN 
    pest_reports p ON m.Mission_ID = p.report_id;