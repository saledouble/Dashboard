package com.dashboard.model;

public class QueryValue {
	
	private String select;
	String field;
	String operations;
	String constraintValue;
	String logic;
	
	public String getSelect(){
		return select;
	}
	
	public void setSelect(String select){
		this.select = select;
	}

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
