-- Query 1 for Agriculture Perspective: Find large fields with pest issues
SELECT * FROM agriculture_perspective_view 
WHERE area_size_hectares > 10.0;