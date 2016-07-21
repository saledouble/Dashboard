package com.dashboard.controller;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.dashboard.model.QueryItem;

/**
 * This class is used to generate the query from the user options
 * @author Grace Tang
 *
 */
public class QueryGenerator {
	
	private QueryItem queryItem;
	
	private String query ="";
	private boolean correctInput = true;
	private String constraints ="";
	
	private String loop = "WHERE ";
	
	public QueryGenerator(QueryItem queryItem) {
		this.queryItem = queryItem;
		if (inputIsCorrect())
			generator();
		else this.correctInput = false;
	}
	
	public boolean getCorrectInput(){
		return this.correctInput;
	}
	
	/**
	 * whether the user input is correct
	 * if something is missing, the controller will know and
	 * give a response to jsp 
	 * @return
	 */
	/////这里多加几组测试数据
	public boolean inputIsCorrect(){
		if(queryItem.getSelect().equals("default") ) return false;
		
		// logic dropdown menu control whether next line exists
		// so the logic dropdown menu must be right
		// 但是我现在是用button控制的，所以在前台改了之后，这边才是正确的
		for(int i = 0; i < queryItem.getTableList().size();++i){
			if (queryItem.getTableList().get(i).getField().equals("default") ||
					queryItem.getTableList().get(i).getOperations().equals("default") ||
					queryItem.getTableList().get(i).getConstraintValue().isEmpty()) return false;
		}		
		
		if(!queryItem.getSelect().equals("Cell") && (
				queryItem.getCellList().get(0).getField().equals("default") &&
				queryItem.getCellList().get(0).getOperations().equals("default")) &&
				queryItem.getCellList().get(0).getConstraintValue().isEmpty() &&
				queryItem.getCellList().get(0).getLogic().equals("default"))return true;
		
		for(int i = 0 ;i< queryItem.getCellList().size() ;++i){
			if(queryItem.getCellList().get(i).getField().equals("default") ||
					queryItem.getCellList().get(i).getOperations().equals("default")||
					queryItem.getCellList().get(i).getConstraintValue().isEmpty()) return false;
		}	
		
		return true;
	}
	
	 
	private void processTableConstriants(){
		
		for(int i = 0; i < queryItem.getTableList().size();++i){
			
			switch(queryItem.getTableList().get(i).getField()){
				case "Cell": constraints = "Content";
					break;
				case "Caption":
					constraints = "TableCaption";
					break;
				case "Stub": 
					constraints = "WholeStub";
					break;
				case "Super-row": 
					constraints = "WholeSuperRow";
					break;
				case "Header": 
					constraints = "WholeHeader";
					break;
				case "Footer": 
					constraints = "TableFooter";
					break;
					
				//////这两处以后再做处理
				case "Row": constraints = "Content"; break;
				case "Column": constraints = "Content"; break;
			}
			
			switch(queryItem.getTableList().get(i).getOperations()){
				case "Contains": constraints = loop + constraints +" like " + "\"%" +
						queryItem.getTableList().get(i).getConstraintValue() + "%\" "; 
					break;
				case "Greater": 
						constraints = loop + constraints +" > " + 
								queryItem.getTableList().get(i).getConstraintValue()  + " ";
					break;
				case "Smaller": 
					constraints = loop + constraints + " < " + 
							queryItem.getTableList().get(i).getConstraintValue()  + " ";
					break;
				case "Range": 
					String str[] = queryItem.getTableList().get(i).getConstraintValue().split(" ", 2);
					constraints = loop + "(" + constraints + " > " + str[0] + " AND " +
						 constraints + " < " + str[1] + " ) ";
					break;
					
				///这个比较特殊，以后处理
				case "Type": 
					constraints = loop +  "CellType = " + "\"" +
							queryItem.getTableList().get(i).getConstraintValue() + "\" ";;
					break;
						
			}
			
			query += constraints;
			
			loop ="";
			
			switch(queryItem.getTableList().get(i).getLogic()){
				case "And": query += "And ";break;
				case "Or": query += "Or ";break;
					
			}
		}
	}
	
	////// cell query is different from the table query
	//// this part should be changed
	public void processCellConstriants(){
		///// process the cell constraints
		
		if(!queryItem.getSelect().equals("Cell") && (
				queryItem.getCellList().get(0).getField().equals("default") &&
				queryItem.getCellList().get(0).getOperations().equals("default")) &&
				queryItem.getCellList().get(0).getConstraintValue().isEmpty() &&
				queryItem.getCellList().get(0).getLogic().equals("default"))return;
		
		loop = "AND ";
		
		for( int i = 0; i < queryItem.getCellList().size();++i){
			
			switch(queryItem.getCellList().get(i).getField()){
				case "Cell": constraints = "Content";
					break;
				case "Caption":
					constraints = "TableCaption";
					break;
				case "Stub": 
					constraints = "WholeStub";
					break;
				case "Super-row": 
					constraints = "WholeSuperRow";
					break;
				case "Header": 
					constraints = "WholeHeader";
					break;
				case "Footer": 
					constraints = "TableFooter";
					break;
					
				//////这两处以后再做处理
				case "Row": constraints = "Content"; break;
				case "Column": constraints = "Content"; break;
			}
			
			switch(queryItem.getCellList().get(i).getOperations()){
				case "Contains": constraints =loop + constraints +" like " + "\"%" +
						queryItem.getCellList().get(i).getConstraintValue() + "%\" "; 
					break;
				case "Greater": 
						constraints = loop + constraints +" > " + 
								queryItem.getCellList().get(i).getConstraintValue()  + " ";
					break;
				case "Smaller": 
					constraints = loop + constraints + " < " + 
							queryItem.getCellList().get(i).getConstraintValue()  + " ";
					break;
				case "Range": 
					String str[] = queryItem.getCellList().get(i).getConstraintValue().split(" ", 2);
					constraints = loop+ "(" + constraints + " > " + str[0] + " AND " +
						 constraints + " < " + str[1] + " ) ";
					break;
					
				///这个比较特殊，以后处理
				case "Type": 
					constraints = loop + "CellType = " + "\"" +
							queryItem.getCellList().get(i).getConstraintValue() + "\" ";;
					break;
						
			}
			
			query += constraints;
			
			loop = "";
			
			switch(queryItem.getCellList().get(i).getLogic()){
				case "And": query += "And ";break;
				case "Or": query += "Or ";break;
					
			}
		}
		
	}
	
	public void generator(){
		switch(queryItem.getSelect()){
			case "Table": query += "SELECT distinct PMCID, TableOrder, TableCaption "; break;
			case "Cell": query += "SELECT distinct PMCID, TableOrder, RowN, ColumnN,"
				+ " WholeHeader, WholeStub, WholeSuperRow, Content " ; break;
			case "Number": query += "SELECT count(*) "; break;
			default: System.out.println("Error input"); break;
		}
		
		query += "FROM clinicTable ";
		
		processTableConstriants();
		processCellConstriants();
		
		query += ";";		
		
		
	}
		

		
	
	public String getQuery(){
		return this.query;
	}
	

}
