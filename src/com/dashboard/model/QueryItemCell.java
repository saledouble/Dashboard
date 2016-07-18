package com.dashboard.model;

/**
 * This class stores the user's options about cell constraints
 * @author Grace Tang
 *
 */
public class QueryItemCell {
	
	private String field;
	private String operations;
	private String constraintValue;
	private String logic;
	
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
