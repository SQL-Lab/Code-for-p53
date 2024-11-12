--
select cast(Mice.mouse_id as int), Blocks.block
from Blocks
join Mice on Mice.mouse_id = Blocks.Mouse_ID
order by cast(Mice.mouse_id as int);

--NUMER OF BLOCKS THAT HAVE NULL OR IS NOT INT AT MOUSE ID
SELECT block, Mouse_ID  
FROM Blocks
WHERE (NOT ISNUMERIC(Mouse_ID)=1) OR Mouse_ID IS NULL;

select DISTINCT CAST(Mouse_ID AS INT), block
from Blocks
WHERE  ISNUMERIC(Mouse_ID)=1
ORDER BY block;

