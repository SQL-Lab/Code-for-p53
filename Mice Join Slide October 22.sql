SELECT
Mice.mouse_id AS 'Mouse ID', 
[Scanned Files].Number AS 'Slide Number',
Mice.strain AS Strain ,
Mice.Line ,
Mice.birth_date AS 'Birth Day' ,
Mice.Death_date AS 'Death Day' ,
Mice.gender AS Gender,
Mice.p53_genotype AS Genotype
FROM Mice
FULL JOIN [Scanned Files] ON [Scanned Files].Mouse_ID = Mice.mouse_id
--WHERE Mice.mouse_id IS NULL
GROUP BY Mice.mouse_id,[Scanned Files].Number,
Mice.strain, Mice.Line, Mice.birth_date, Mice.Death_date, Mice.gender,
Mice.p53_genotype 
ORDER BY
     CASE 
        WHEN [Scanned Files].Number IS NULL THEN 1 
        ELSE 0 
    END, 
	TRY_CAST([Scanned Files].Number AS INT)