SELECT *
FROM [Scanned Files]
WHERE Mouse_ID != Mouse_ID2;

SELECT DISTINCT Mice.mouse_id AS [ID FROM DATA],[Scanned Files].Mouse_ID AS [ID FROM SCAN]
FROM Mice
FULL JOIN [Scanned Files] ON [Scanned Files].Mouse_ID = Mice.mouse_id
WHERE  Mice.mouse_id IS NULL AND [Scanned Files].Mouse_ID IS NOT NULL;

SELECT DISTINCT	Mice.mouse_id  , Blocks.Mouse_ID AS [BLOCKS ID]
FROM Mice
FULL JOIN Blocks ON Blocks.Mouse_ID = Mice.mouse_id
WHERE Mice.mouse_id IS NULL AND Blocks.Mouse_ID IS NOT NULL;

SELECT DISTINCT	[Scanned Files].Mouse_ID AS [ID FROM SCAN]  , Blocks.Mouse_ID AS [BLOCKS ID]
FROM [Scanned Files]
FULL JOIN Blocks ON Blocks.Mouse_ID =[Scanned Files].Mouse_ID
WHERE [Scanned Files].Mouse_ID IS NOT NULL AND Blocks.Mouse_ID IS  NULL;