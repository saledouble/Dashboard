select PMCID, TableOrder, ColumnN, group_concat(Content) as ColumnContent
from clinicTable
group by PMCID, TableOrder, ColumnN;