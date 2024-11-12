select [Mice ].Mice_ID , [Mice ].Project_Name, [Follow Up ].Date_of_Follow_Up , [Follow Up ].Wieght , [Follow Up ].Viablity ,[Follow Up ].Cancer_Development, [Follow Up ].Tumor_Size_Primary
, [Follow Up ].Cancer_Location_Primary, [Follow Up ].Metastasis , [Follow Up ].Description
into Followup
from [Follow Up ]
join [Mice ] on [Mice ].Mice_ID = [Follow Up ].Mice_ID
order by Mice_ID