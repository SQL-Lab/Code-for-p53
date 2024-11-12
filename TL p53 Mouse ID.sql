WITH Blocked1 AS (
    SELECT DISTINCT 
        CAST(Mice.mouse_id AS INT) AS Mouse_id, 
        Blocks.block AS block,
        ROW_NUMBER() OVER (PARTITION BY Mice.mouse_id ORDER BY Blocks.block) AS block_number
    FROM 
        Mice
    full JOIN 
        Blocks ON Blocks.mouse_id = Mice.mouse_id
		group by Mice.mouse_id , Blocks.block
),
Blocked2 AS (
    SELECT DISTINCT 
        CAST(Mice.mouse_id AS INT) AS Mouse_id, 
        DIRECTORY.File_Name ,
        ROW_NUMBER() OVER (PARTITION BY Mice.mouse_id ORDER BY DIRECTORY.File_Name) AS File_number
    FROM 
        Mice
   full JOIN 
        DIRECTORY ON DIRECTORY.MOUSE_ID = Mice.mouse_id
		group by Mice.mouse_id , DIRECTORY.File_Name
)
SELECT 
    Blocked1.Mouse_id,
	Mice.Block,
    MAX(CASE WHEN block_number = 1 THEN Blocked1.block ELSE NULL END) AS block1,
    MAX(CASE WHEN block_number = 2 THEN Blocked1.block ELSE NULL END) AS block2,
    MAX(CASE WHEN block_number = 3 THEN Blocked1.block ELSE NULL END) AS block3,
    MAX(CASE WHEN block_number = 4 THEN Blocked1.block ELSE NULL END) AS block4,
    MAX(CASE WHEN block_number = 5 THEN Blocked1.block ELSE NULL END) AS block5,
	MAX(CASE WHEN block_number = 6 THEN Blocked1.block ELSE NULL END) AS block6,
	MAX(CASE WHEN block_number = 7 THEN Blocked1.block ELSE NULL END) AS block7,
	MAX(CASE WHEN block_number = 8 THEN Blocked1.block ELSE NULL END) AS block8,
	Mice.strain,
    Mice.Line,
    Mice.birth_date,
    Mice.Death_date,
    Mice.p53_genotype,
    Mice.Colony,
    MAX(CASE WHEN File_number = 1 THEN Blocked2.File_Name ELSE NULL END) AS file1,
    MAX(CASE WHEN File_number = 2 THEN Blocked2.File_Name ELSE NULL END) AS file2,
    MAX(CASE WHEN File_number = 3 THEN Blocked2.File_Name ELSE NULL END) AS file3,
	MAX(CASE WHEN File_number = 4 THEN Blocked2.File_Name ELSE NULL END) AS file4,
	MAX(CASE WHEN File_number = 5 THEN Blocked2.File_Name ELSE NULL END) AS file5,
	MAX(CASE WHEN File_number = 6 THEN Blocked2.File_Name ELSE NULL END) AS file6,
	MAX(CASE WHEN File_number = 7 THEN Blocked2.File_Name ELSE NULL END) AS file7,
	MAX(CASE WHEN File_number = 8 THEN Blocked2.File_Name ELSE NULL END) AS file8,
	MAX(CASE WHEN File_number = 9 THEN Blocked2.File_Name ELSE NULL END) AS file9,
	MAX(CASE WHEN File_number = 10 THEN Blocked2.File_Name ELSE NULL END) AS file10,
	MAX(CASE WHEN File_number = 11 THEN Blocked2.File_Name ELSE NULL END) AS file11,
	MAX(CASE WHEN File_number = 12 THEN Blocked2.File_Name ELSE NULL END) AS file12,
	MAX(CASE WHEN File_number = 13 THEN Blocked2.File_Name ELSE NULL END) AS file13,
	MAX(CASE WHEN File_number = 14 THEN Blocked2.File_Name ELSE NULL END) AS file14,
	MAX(CASE WHEN File_number = 15 THEN Blocked2.File_Name ELSE NULL END) AS file15,
	MAX(CASE WHEN File_number = 16 THEN Blocked2.File_Name ELSE NULL END) AS file16,
	MAX(CASE WHEN File_number = 17 THEN Blocked2.File_Name ELSE NULL END) AS file17,
	MAX(CASE WHEN File_number = 18 THEN Blocked2.File_Name ELSE NULL END) AS file18,
	MAX(CASE WHEN File_number = 19 THEN Blocked2.File_Name ELSE NULL END) AS file19,
	MAX(CASE WHEN File_number = 20 THEN Blocked2.File_Name ELSE NULL END) AS file20	
--into TL_p53_Mouse_ID
FROM  Blocked1
JOIN  Mice ON Mice.mouse_id = Blocked1.Mouse_id
JOIN  Blocked2 ON Blocked2.Mouse_id = Blocked1.Mouse_id
GROUP BY 
    Blocked1.Mouse_id,
	Mice.Block,
    Mice.strain,
    Mice.Line,
    Mice.birth_date,
    Mice.Death_date,
    Mice.p53_genotype,
    Mice.Colony
ORDER BY 
    Blocked1.Mouse_id;
