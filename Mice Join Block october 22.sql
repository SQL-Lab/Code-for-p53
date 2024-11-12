SELECT
Mice.mouse_id AS 'Mouse ID', 
Blocks.block AS 'Block Number',
Mice.strain AS Strain ,
Mice.Line ,
Mice.birth_date AS 'Birth Day' ,
Mice.Death_date AS 'Death Day' ,
Mice.gender AS Gender,
Mice.p53_genotype AS Genotype
FROM Mice
FULL JOIN Blocks ON Blocks.Mouse_ID = Mice.mouse_id
--WHERE Mice.mouse_id IS NULL
GROUP BY Mice.mouse_id,Blocks.block,
Mice.strain, Mice.Line, Mice.birth_date, Mice.Death_date, Mice.gender,
Mice.p53_genotype 
ORDER BY
     CASE 
        WHEN Blocks.block IS NULL THEN 1 
        ELSE 0 
    END, 
	TRY_CAST(RIGHT(Blocks.block,3) AS INT)
