package com.dashboard.model;

import java.util.LinkedList;
import java.util.List;

public class QueryItem {
	
	private List<QueryItemCell> cellList= new LinkedList<QueryItemCell>();
	private List<QueryItemTable> tableList= new LinkedList<QueryItemTable>();
	
	private String select;
	
	public QueryItem(){
		
	}
	
	public QueryItem(List<QueryItemTable> tableList,List<QueryItemCell> cellList) {
		this.tableList = tableList;
		this.cellList = cellList;
	}
	
	public List<QueryItemTable> getTableList(){
		return this.tableList;
	}
	
	public void setTableList(List<QueryItemTable> tableList){
		this.tableList = tableList;
	}
	
	public List<QueryItemCell> getCellList(){
		return cellList;
	}
	
	public void setCellList(List<QueryItemCell> cellList){
		this.cellList = cellList;
	}
	
	public String getSelect(){
		return select;
	}

	public void setSelect(String select){
		this.select = select;
	}
	
	
//	private String cellField;
//	private String cellOperations;
//	private String cellConstraintValue;
//	private String cellLogic;
//	
//	
//	/**
//	 * select table, cell or number?
//	 */
//	
//	/**
//	 * table constraints
//	 */
//	private String field;
//	private String operations;
//	private String constraintValue;
//	private String logic;	
//	
//	
//	public String getCellField(){
//		return this.cellField;
//	}
//	
//	public void setCellField(String cellField){
//		this.cellField = cellField;
//	}
//	
//	public String getCellOperations(){
//		return this.cellOperations;
//	}
//	
//	public void setCellOperations(String cellOperations){
//		this.cellOperations = cellOperations;
//	}
//	
//	public String getCellConstraintValue(){
//		return this.cellConstraintValue;
//	}
//	
//	public void setCellConstraintValue(String cellConstraintValue){
//		this.cellConstraintValue = cellConstraintValue;
//	}
//	
//	
//	public String getCellLogic(){
//		return this.cellLogic;
//	}
//	
//	public void setCellLogic(String cellLogic){
//		this.cellLogic = cellLogic;
//	}
//	
//	

//
//	
//	public String getField(){
//		return this.field;
//	}
//	
//	public void setField(String field){
//		this.field = field;
//	}
//	
//	public String getOperations(){
//		return this.operations;
//	}
//	
//	public void setOperations(String operations){
//		this.operations = operations;
//	}
//	
//	public String getConstraintValue(){
//		return this.constraintValue;
//	}
//	
//	public void setConstraintValue(String constraintValue){
//		this.constraintValue = constraintValue;
//	}
//	
//	
//	public String getLogic(){
//		return this.logic;
//	}
//	
//	public void setLogic(String logic){
//		this.logic = logic;
//	}
}
