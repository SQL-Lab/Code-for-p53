-- IN MICE THERE IS NO 3036 MICE ID THAT EXIST IN Blocks
with mouseData1 as(
   select DISTINCT  Blocks.block as Block , Mice.mouse_id , ROW_NUMBER() over (partition by Blocks.block order by Mice.mouse_id) as ID_number
   from Blocks
   full join Mice on Mice.mouse_id = Blocks.Mouse_ID
   where Mice.mouse_id is not null
   group by Mice.mouse_id , Blocks.block
   ),
mouseData2 as (
   select DISTINCT  Blocks.block as Block, DIRECTORY.File_Name , ROW_NUMBER() over (partition by Blocks.block order by DIRECTORY.File_Name) as File_number
   from Blocks
   left join DIRECTORY on DIRECTORY.MOUSE_ID = Blocks.Mouse_ID
   WHERE   TRY_CAST(Blocks.Mouse_ID AS INT) IS NOT NULL
   group by  DIRECTORY.File_Name,Blocks.block 
   )
select mouseData1.Block, 
       MAX(CASE WHEN ID_number = 1 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_1,
       MAX(CASE WHEN ID_number = 2 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_2,
       MAX(CASE WHEN ID_number = 3 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_3,
       MAX(CASE WHEN ID_number = 4 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_4,
       MAX(CASE WHEN ID_number = 5 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_5,
	   MAX(CASE WHEN ID_number = 6 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_6,
	   MAX(CASE WHEN ID_number = 7 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_7,
	   MAX(CASE WHEN ID_number = 8 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_8,
	   MAX(CASE WHEN ID_number = 9 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_9,
	   MAX(CASE WHEN ID_number = 10 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_10,
	   MAX(CASE WHEN ID_number = 11 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_11,
  	   MAX(CASE WHEN ID_number = 12 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_12,
	   MAX(CASE WHEN ID_number = 13 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_13,
	   MAX(CASE WHEN ID_number = 14 THEN mouseData1.mouse_id ELSE NULL END) AS Mouse_id_14,
	   MAX(CASE WHEN File_number = 1 THEN mouseData2.File_Name ELSE NULL END) AS File_number_1,
       MAX(CASE WHEN File_number = 2 THEN mouseData2.File_Name ELSE NULL END) AS File_number_2,
       MAX(CASE WHEN File_number = 3 THEN mouseData2.File_Name ELSE NULL END) AS File_number_3,
       MAX(CASE WHEN File_number = 4 THEN mouseData2.File_Name ELSE NULL END) AS File_number_4,
       MAX(CASE WHEN File_number = 5 THEN mouseData2.File_Name ELSE NULL END) AS File_number_5,
	   MAX(CASE WHEN File_number = 6 THEN mouseData2.File_Name ELSE NULL END) AS File_number_6,
	   MAX(CASE WHEN File_number = 7 THEN mouseData2.File_Name ELSE NULL END) AS File_number_7,
	   MAX(CASE WHEN File_number = 8 THEN mouseData2.File_Name ELSE NULL END) AS File_number_8,
	   MAX(CASE WHEN File_number = 9 THEN mouseData2.File_Name ELSE NULL END) AS File_number_9,
	   MAX(CASE WHEN File_number = 10 THEN mouseData2.File_Name ELSE NULL END) AS File_number_10,
	   MAX(CASE WHEN File_number = 11 THEN mouseData2.File_Name ELSE NULL END) AS File_number_11,
  	   MAX(CASE WHEN File_number = 12 THEN mouseData2.File_Name ELSE NULL END) AS File_number_12,
	   MAX(CASE WHEN File_number = 13 THEN mouseData2.File_Name ELSE NULL END) AS File_number_13,
	   MAX(CASE WHEN File_number = 14 THEN mouseData2.File_Name ELSE NULL END) AS File_number_14
FROM    mouseData1
join mouseData2 on mouseData2.Block = mouseData1.Block
GROUP BY    mouseData1.block;


