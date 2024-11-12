WITH Datatable AS (
    SELECT DISTINCT 
        Blocks.block AS block,
        DIRECTORY.File_Name,
        CAST(Mice.mouse_id AS INT) AS MOUSE_ID,
        ROW_NUMBER() OVER (PARTITION BY Blocks.block ORDER BY DIRECTORY.File_Name) AS File_number
    FROM 
        Blocks
    FULL JOIN 
        DIRECTORY ON Blocks.mouse_id = DIRECTORY.MOUSE_ID
    LEFT JOIN 
        Mice ON Mice.mouse_id = Blocks.mouse_id
    GROUP BY 
        Blocks.block, 
        DIRECTORY.File_Name, 
        Mice.mouse_id
)

SELECT 
    Datatable.block,  
    MAX(CASE WHEN File_number = 1 THEN Datatable.File_Name ELSE NULL END) AS file1,
    MAX(CASE WHEN File_number = 2 THEN Datatable.File_Name ELSE NULL END) AS file2,
    MAX(CASE WHEN File_number = 3 THEN Datatable.File_Name ELSE NULL END) AS file3,
    MAX(CASE WHEN File_number = 4 THEN Datatable.File_Name ELSE NULL END) AS file4,
    MAX(CASE WHEN File_number = 5 THEN Datatable.File_Name ELSE NULL END) AS file5,
    MAX(CASE WHEN File_number = 6 THEN Datatable.File_Name ELSE NULL END) AS file6,
    MAX(CASE WHEN File_number = 7 THEN Datatable.File_Name ELSE NULL END) AS file7,
    MAX(CASE WHEN File_number = 8 THEN Datatable.File_Name ELSE NULL END) AS file8,
    MAX(CASE WHEN File_number = 9 THEN Datatable.File_Name ELSE NULL END) AS file9,
    MAX(CASE WHEN File_number = 10 THEN Datatable.File_Name ELSE NULL END) AS file10,
    MAX(CASE WHEN File_number = 11 THEN Datatable.File_Name ELSE NULL END) AS file11,
    MAX(CASE WHEN File_number = 12 THEN Datatable.File_Name ELSE NULL END) AS file12,
    MAX(CASE WHEN File_number = 13 THEN Datatable.File_Name ELSE NULL END) AS file13,
    MAX(CASE WHEN File_number = 14 THEN Datatable.File_Name ELSE NULL END) AS file14,
    MAX(CASE WHEN File_number = 15 THEN Datatable.File_Name ELSE NULL END) AS file15,
    MAX(CASE WHEN File_number = 16 THEN Datatable.File_Name ELSE NULL END) AS file16,
    MAX(CASE WHEN File_number = 17 THEN Datatable.File_Name ELSE NULL END) AS file17,
    MAX(CASE WHEN File_number = 18 THEN Datatable.File_Name ELSE NULL END) AS file18,
    MAX(CASE WHEN File_number = 19 THEN Datatable.File_Name ELSE NULL END) AS file19,
    MAX(CASE WHEN File_number = 20 THEN Datatable.File_Name ELSE NULL END) AS file20,
    Mice.strain,
    Mice.Line,
    Mice.birth_date,
    Mice.Death_date,
    Mice.p53_genotype,
    Mice.Colony
FROM Datatable
LEFT JOIN Mice ON Mice.mouse_id = Datatable.mouse_id
GROUP BY 
    Datatable.block,
    Mice.strain,
    Mice.Line,
    Mice.birth_date,
    Mice.Death_date,
    Mice.p53_genotype,
    Mice.Colony
ORDER BY 
    Datatable.block;
