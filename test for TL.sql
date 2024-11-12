SELECT 
    count(file1)+count(file2)+count(file3)+count(file4)+count(file5)+count(file6)+count(file7)+count(file8)+count(file9)+
	count(file10)+count(file11)+count(file12)+count(file13)+count(file14)+count(file15)+count(file16)+count(file17)+
	count(file18)+count(file19)+count(file20)
FROM 
    TL_p53_Mouse_ID;

select count(block1)+count(block2)+count(block3)+count(block4)+count(block5)+count(block6)+count(block7)+count(block8) 
from TL_p53_Mouse_ID;

select Mice.mouse_id,DIRECTORY.File_Name
from Mice
join DIRECTORY on DIRECTORY.MOUSE_ID = Mice.mouse_id;
