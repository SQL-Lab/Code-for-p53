WITH ranked  AS (
     SELECT Mice.mouse_id, Mice.Colony,
	 ROW_NUMBER() OVER (PARTITION BY mouse_id  ORDER BY Colony) AS rn
	 FROM Mice
	 )

--CREATE TABLE new_table AS 
SELECT mouse_id,
    MAX(CASE WHEN rn = 1 THEN Colony END) AS Colony1,
    MAX(CASE WHEN rn = 2 THEN Colony END) AS Colony2  
FROM 
    ranked
GROUP BY 
    mouse_id
HAVING   MAX(CASE WHEN rn = 2 THEN Colony END) IS NOT NULL
ORDER BY
	 CASE 
        WHEN mouse_id IS NULL THEN 1 
        ELSE 0 
    END, 
	TRY_CAST(mouse_id AS INT);
