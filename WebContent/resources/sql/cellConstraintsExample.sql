


SELECT distinct PMCID, TableOrder, RowN, ColumnN, WholeHeader, WholeStub, WholeSuperRow, Content 

From 
 ( 
	SELECT * FROM 
		
        (SELECT PMCID, TableCaption, TableOrder 
		FROM clinicTable WHERE Content like "%12%"  
        UNION 
        SELECT PMCID, TableCaption, TableOrder
        FROM clinicTable 
        WHERE Content like "%12%"  ) as T
        NATURAL LEFT JOIN clinicTable 
) as T1
    
WHERE Content like "%2%"  ;