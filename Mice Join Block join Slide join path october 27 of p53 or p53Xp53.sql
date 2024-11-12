SELECT
Mice.mouse_id AS 'Mouse ID', 
Blocks.block AS 'Block Number',
Blocks.Organ [Block Organ] ,
[Scanned Files].Organ [Scan Organ],
[Scanned Files].Number AS 'Slide Number',
[Scanned Files].File_Path as Pathway,
Mice.Colony ,
Mice.strain AS Strain ,
Mice.Line ,
Mice.birth_date AS 'Birth Day' ,
Mice.Death_date AS 'Death Day' ,
Mice.gender AS Gender,
Mice.p53_genotype AS Genotype
FROM Mice
FULL JOIN Blocks ON Blocks.Mouse_ID = Mice.mouse_id 
FULL JOIN [Scanned Files] ON [Scanned Files].Mouse_ID = Mice.mouse_id AND [Scanned Files].Organ = Blocks.Organ AND [Scanned Files].Block = Blocks.block
where Mice.Colony IN ('p53' , 'p53 X p53') 
GROUP BY 
Blocks.block,Mice.Colony,Blocks.Organ ,
[Scanned Files].Organ,[Scanned Files].Number,[Scanned Files].File_Path,
Mice.mouse_id, Mice.strain, Mice.Line, Mice.birth_date, Mice.Death_date, Mice.gender,Mice.p53_genotype 
ORDER BY
     CASE 
        WHEN Blocks.block IS NULL THEN 1 
        ELSE 0 
    END, 
	TRY_CAST(RIGHT(Blocks.block,3) AS INT)
