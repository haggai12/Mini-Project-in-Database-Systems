-- Query 1 for Drone Perspective: Filter missions dealing with severe pests
SELECT * FROM drone_perspective_view 
WHERE severity_level >= 4;