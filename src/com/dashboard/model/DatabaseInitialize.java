package com.dashboard.model;

public class DatabaseInitialize {
	
	// set the query string
	private String clinicTable = "create table clinicTable as "
			+ "select distinct A.PMCID, T.TableOrder, T.TableCaption,T.TableFooter, "
			+ "T.StructureType, T.PragmaticType, "
			+ "C.RowN, C.ColumnN, C.WholeHeader,C.WholeStub,C.WholeSuperRow, "
			+ "C.Content,C.CellType, A.idArticle "
			+ "from "
			+ "(Cell as C left join ArtTable as T on T.idTable = C.Table_idTable) "
			+ "left join Article as A on A.idArticle = T.Article_idArticle;";
	
	// set the query string to quert text result
	private String clinicTextTable = "create table clinicTextTable as "
			+ "SELECT A.PMCID, O.XML "
			+ "FROM article as A "
			+ "left join originalarticle as O "
			+ "on A.idArticle = O.Article_idArticle; ";	
	
	// drop tables clinicTable & clinicTextTable
	private String dropClinicTable = "drop table clinicTable; ";
	private String dropClinicTextTable = "drop table clinicTextTable;";
		
	public String getClinicTable(){
		return this.clinicTable;
	}
	
	public String getClinicTextTable(){
		return this.clinicTextTable;
	}
	
	public String getDropClinicTable(){
		return this.dropClinicTable;
	}
	
	public String getDropClinicTextTable(){
		return this.dropClinicTextTable;
	}
	

}
