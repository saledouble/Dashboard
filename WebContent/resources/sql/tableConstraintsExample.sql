SELECT PMCID, TableCaption, TableOrder 
FROM clinicTable WHERE Content like "%12%"  

UNION 

SELECT PMCID, TableCaption, TableOrder 
FROM clinicTable 
WHERE Content like "%12%" 
        