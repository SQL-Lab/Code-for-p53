--ID ONLY AT Hagar
SELECT DISTINCT  [Scanned Files].Mouse_ID 
FROM [Nizan_Slide Scanner]
FULL JOIN [Scanned Files] ON [Scanned Files].Mouse_ID = [Nizan_Slide Scanner].Mouse_ID
WHERE [Nizan_Slide Scanner].Mouse_ID IS NULL;

--ID ONLY AT Nizan
SELECT DISTINCT [Nizan_Slide Scanner].Mouse_ID  
FROM [Nizan_Slide Scanner]
FULL JOIN [Scanned Files] ON [Scanned Files].Mouse_ID = [Nizan_Slide Scanner].Mouse_ID
WHERE [Scanned Files].Mouse_ID IS NULL;

--ID in bouth tables
SELECT DISTINCT [Scanned Files].Mouse_ID  
FROM [Scanned Files]
JOIN [Nizan_Slide Scanner] ON [Nizan_Slide Scanner].Mouse_ID = [Scanned Files].Mouse_ID;
 
