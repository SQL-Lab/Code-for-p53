SELECT DISTINCT
	[Scanned Files].Mouse_ID,
	[Scanned Files].Organ , 
	[Scanned Files].Status,
	[Scanned Files].File_Name AS 'Hagar File Name' ,
	[Scanned Files].File_Path AS 'Hagar Path' ,
	[Nizan_Slide Scanner].File_Name AS 'Nitzan File Name',
	[Nizan_Slide Scanner].File_Path AS 'Nitzan Path'
FROM [Scanned Files]
LEFT JOIN [Nizan_Slide Scanner] ON [Nizan_Slide Scanner].Mouse_ID = [Scanned Files].Mouse_ID 
AND [Nizan_Slide Scanner].Organ = [Scanned Files].Organ
AND [Nizan_Slide Scanner].Number = [Scanned Files].Slide
ORDER BY [Scanned Files].Mouse_ID

