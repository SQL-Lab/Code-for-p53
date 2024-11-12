select TL_p53_Mouse_ID.*
from TL_p53_Mouse_ID
where (block1 is not null or block2 is not null or block3 is not null or block4 is not null or block5 is not null or block6 is not null or block7 is not null or block8 is not null) and Block is not null
order by Mouse_id