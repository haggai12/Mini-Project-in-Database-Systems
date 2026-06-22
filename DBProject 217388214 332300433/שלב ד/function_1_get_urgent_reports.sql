-- Function 1: Returns a Ref Cursor containing agricultural pest reports above a certain severity
CREATE OR REPLACE FUNCTION get_urgent_pest_reports(min_severity INT)
RETURNS refcursor AS $$
DECLARE
    report_cursor refcursor;
BEGIN
    -- Open the cursor for a query on the remote table
    OPEN report_cursor FOR
        SELECT report_id, field_id, pest_type, severity_level
        FROM pest_reports
        WHERE severity_level >= min_severity;
    
    -- Return the reference to the cursor
    RETURN report_cursor;
END;
$$ LANGUAGE plpgsql;