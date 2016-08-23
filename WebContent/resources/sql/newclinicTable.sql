create table clinicBasicTable as

select distinct A.PMCID, T.TableOrder, T.TableCaption,T.TableFooter,
C.RowN, C.ColumnN, C.WholeHeader,C.WholeStub,C.WholeSuperRow,
C.Content,C.CellType
from 
((Cell as C left join ArtTable as T on T.idTable = C.Table_idTable)
left join Article as A on A.idArticle = T.Article_idArticle);

set session group_concat_max_len = 4096;

create table clinicTable as

select distinct PMCID, TableOrder, TableCaption,TableFooter,
RowN, ColumnN, WholeHeader,WholeStub,WholeSuperRow,
Content,CellType, RowContent, ColumnContent

from clinicBasicTable

natural join 

( select PMCID, TableOrder, RowN, group_concat(Content) as RowContent
from clinicBasicTable
group by PMCID, TableOrder, RowN) AS RowC

natural join 

(select PMCID, TableOrder, ColumnN, group_concat(Content) as ColumnContent
from clinicBasicTable
group by PMCID, TableOrder, ColumnN) as ColumC;
