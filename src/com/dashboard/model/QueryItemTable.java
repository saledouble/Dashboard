package com.dashboard.model;

/**
 * This class stores the users' options about table constraints
 * @author Grace Tang
 *
 */
public class QueryItemTable {
	
	/**
	 * table constraints
	 */
	private String field;
	private String operations;
	private String constraintValue;
	private String logic;
	
	public QueryItemTable(){
		
	}
	
	public QueryItemTable(String field, String operations, 
			String constraintValue, String logic) {
		this.field = field;
		this.operations = operations;
		this.constraintValue = constraintValue;
		this.logic = logic;
	}
	
//	public String getSelect(){
//		return select;
//	}
//	
//	public void setSelect(String select){
//		this.select = select;
//	}

	public String getField(){
		return this.field;
	}
	
	public void setField(String field){
		this.field = field;
	}
	
	public String getOperations(){
		return this.operations;
	}
	
	public void setOperations(String operations){
		this.operations = operations;
	}
	
	public String getConstraintValue(){
		return this.constraintValue;
	}
	
	public void setConstraintValue(String constraintValue){
		this.constraintValue = constraintValue;
	}
	
	
	public String getLogic(){
		return this.logic;
	}
	
	public void setLogic(String logic){
		this.logic = logic;
	}

}
