--files found in both tables
SELECT  
	[Scanned Files].Mouse_ID ,
	[Scanned Files].Organ ,
	[Scanned Files].Slide ,
	[Scanned Files].Status,
	[Nizan_Slide Scanner].File_Name AS [Nizan File Name],
	[Nizan_Slide Scanner].File_Path AS [Nizan File Path],
	[Scanned Files].File_Name AS [Hagar File Name],
	[Scanned Files].File_Path AS [Hagar File Path],
	[Nizan_Slide Scanner].Doplicats
	
FROM [Scanned Files]
FULL JOIN [Nizan_Slide Scanner] ON [Nizan_Slide Scanner].Mouse_ID = [Scanned Files].Mouse_ID
AND [Nizan_Slide Scanner].Number = [Scanned Files].Slide
AND [Nizan_Slide Scanner].Organ = [Scanned Files].Organ
WHERE [Nizan_Slide Scanner].Mouse_ID IS NOT NULL AND [Scanned Files].Mouse_ID IS NOT NULL 
 ;

--files found only in Nizan
SELECT  
    [Nizan_Slide Scanner].Mouse_ID ,
    [Nizan_Slide Scanner].Organ ,
    [Nizan_Slide Scanner].Number ,
	[Nizan_Slide Scanner].Doplicats,
    [Nizan_Slide Scanner].File_Name AS [Nizan File Name],
    [Nizan_Slide Scanner].File_Path AS [Nizan File Path]
FROM [Nizan_Slide Scanner]
LEFT JOIN [Scanned Files] ON [Nizan_Slide Scanner].Mouse_ID = [Scanned Files].Mouse_ID
    AND [Nizan_Slide Scanner].Number = [Scanned Files].Slide
    AND [Nizan_Slide Scanner].Organ = [Scanned Files].Organ
WHERE [Scanned Files].Mouse_ID IS NULL  
ORDER BY 
     CASE 
        WHEN [Nizan_Slide Scanner].Mouse_ID IS NULL THEN 1 
        ELSE 0 
    END,
	 [Nizan_Slide Scanner].Mouse_ID; 

--files found only in Hagar
SELECT  
    [Scanned Files].Mouse_ID ,
    [Scanned Files].Organ ,
    [Scanned Files].Slide ,
    [Scanned Files].File_Name ,
	[Scanned Files].Status ,
    [Scanned Files].File_Path
FROM [Scanned Files]
LEFT JOIN [Nizan_Slide Scanner] ON [Scanned Files].Mouse_ID = [Nizan_Slide Scanner].Mouse_ID
    AND [Scanned Files].Slide = [Nizan_Slide Scanner].Number
    AND [Scanned Files].Organ = [Nizan_Slide Scanner].Organ
WHERE  [Nizan_Slide Scanner].Mouse_ID IS NULL ;
;

 

