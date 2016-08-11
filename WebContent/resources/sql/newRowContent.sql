select PMCID, TableOrder, RowN, group_concat(Content) as RowContent
from clinicTable
group by PMCID, TableOrder, RowN;