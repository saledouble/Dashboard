package com.dashboard.controller;

import com.dashboard.model.QueryItem;
import com.dashboard.model.QueryItemCell;
import com.dashboard.model.QueryItemTable;

/**
 * This class is used to generate the query from the user options
 * @author Grace Tang
 *
 */
public class QueryGenerator {
	
	private QueryItem queryItem;
	
	private String query ="";
	private boolean correctInput = true;
	
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
	public boolean inputIsCorrect(){
		
		/// those 3 statements are used to check whether the users accomplish the input

		if(queryItem.getSelect().equals("default")) return false;
		
		// check whether the input of table constraints is correct
		if (queryItem.getSelect().equals("Table") || queryItem.getSelect().equals("CountTable")){
			return inputTableIsCorrect();
		}
		
		if(queryItem.getSelect().equals("Cell") || queryItem.getSelect().equals("CountCell")){
			if( !inputTableIsCorrect()) return false;
			return inputCellIsCorrect();
		}	
		
		return validQuery();
	}
	
	/**
	 * check whether the user options are valid
	 * @return
	 */
	public boolean validQuery(){
		for(int i = 0; i < queryItem.getTableList().size();++i){
			if (queryItem.getTableList().get(i).getOperations().equals("Type") &&
					!queryItem.getTableList().get(i).getField().equals("Cell")){
				return false;
			}
		}
		
		for(int i = 0; i < queryItem.getCellList().size();++i){
			if(queryItem.getCellList().get(i).getOperations().equals("Type") &&
					!queryItem.getCellList().get(i).getField().equals("Cell"))
				return false;
		}
		
		return true;
	}
	
	/**
	 * check whether the users accomplish the input of cell constraints
	 * @return
	 */
	public boolean inputCellIsCorrect(){
		int i;
		if(queryItem.getCellList().size() == 0) return true;
		else{
			for(i = 0 ;i< queryItem.getCellList().size() -1 ;++i){
				if(queryItem.getCellList().get(i).getField().equals("default") ||
						queryItem.getCellList().get(i).getOperations().equals("default")||
						queryItem.getCellList().get(i).getConstraintValue().isEmpty() ||
						queryItem.getCellList().get(i).getLogic().equals("default") ) return false;
			}
			i = queryItem.getCellList().size() - 1;
			if (!queryItem.getCellList().get(i).getField().equals("default") &&
					!queryItem.getCellList().get(i).getOperations().equals("default") &&
					!queryItem.getCellList().get(i).getConstraintValue().isEmpty() &&
					queryItem.getCellList().get(i).getLogic().equals("default") ){
				return true;
			}
			
			return false;
			
		}
	}
	
	/**
	 * check whether the users accomplish the input of table constraints
	 * @return
	 */
	public boolean inputTableIsCorrect(){
		int i;
		if(queryItem.getTableList().size() == 0) return true;
		else{
			for(i = 0; i < queryItem.getTableList().size() -1;++i){
				if (queryItem.getTableList().get(i).getField().equals("default") ||
						queryItem.getTableList().get(i).getOperations().equals("default") ||
						queryItem.getTableList().get(i).getConstraintValue().isEmpty() ||
						queryItem.getTableList().get(i).getLogic().equals("default")) return false;
			}
			i = queryItem.getTableList().size() - 1;
			if( !queryItem.getTableList().get(i).getField().equals("default") &&
					!queryItem.getTableList().get(i).getOperations().equals("default") &&
					!queryItem.getTableList().get(i).getConstraintValue().isEmpty() &&
					queryItem.getTableList().get(i).getLogic().equals("default")){
				return true;
			}
			
			return false;

		}
	}
	
	/**
	 * process all user options of table constraints
	 * and generate the query
	 */
	private String processTableConstriants(){
		
		if (queryItem.getTableList().size() == 0) return "SELECT PMCID, TableCaption, TableOrder FROM clinicTable ";
		
		String tmpQuery = "";
		Boolean isAND = false;
		
		// if the logic is And:
		// the nested query will be generated
		// if the logic is or
		// just union the queries
		for(int i = 0; i < queryItem.getTableList().size();++i){
			
			if (!isAND)
			tmpQuery += "SELECT distinct PMCID, TableCaption, TableOrder FROM clinicTable ";
			
			tmpQuery += basicTableConstraints(
					basicTableConstraintsField(queryItem.getTableList().get(i)), 
					queryItem.getTableList().get(i));

			if(isAND) tmpQuery += " ) AS T" + i + " ";
			
			switch(queryItem.getTableList().get(i).getLogic()){
				case "And":
					
					tmpQuery = "SELECT distinct PMCID, TableCaption, TableOrder FROM ( " + 
							tmpQuery +
							" ) AS T" + 
							i +
							" NATURAL JOIN ( "+
							" SELECT distinct PMCID, TableCaption, TableOrder FROM clinicTable ";
					isAND = true;
			
					break;
				case "Or": 
					
					tmpQuery += " UNION ";					
					isAND = false;
					
					break;	
				default: isAND = false;
			}
			
		}
	
//		System.out.println(tmpQuery);
		return tmpQuery;
	}
	
	/**
	 * get the constraints of table
	 * @param field
	 * @param where
	 * @param queryItemTable
	 * @return
	 */
	private String basicTableConstraints(String field, QueryItemTable queryItemTable){
		String tableConstraints ="";
		
		switch(queryItemTable.getOperations()){
		
			case "Contains": tableConstraints = "WHERE " + field +" REGEXP \".*[^0-9.]" +
				queryItemTable.getConstraintValue() + "[^0-9.].*\" "; 
			break;
			case "Greater": 
				tableConstraints = "WHERE " + field +" > " + 
						queryItemTable.getConstraintValue()  + " ";
			break;
			case "Smaller": 
				tableConstraints = "WHERE " + field + " < " + 
					queryItemTable.getConstraintValue()  + " ";
			break;

			case "Type": 
				tableConstraints = "WHERE " +  "CellType = " + "\"" +
					queryItemTable.getConstraintValue() + "\" ";;
			break;
		}
		
		
		return tableConstraints;
	}
	
	/**
	 * get the field of the table constraints
	 * @param queryItemTable
	 * @return
	 */
	private String basicTableConstraintsField(QueryItemTable queryItemTable){
		String tableConstraints = "";
		switch(queryItemTable.getField()){
			case "Cell": tableConstraints = "Content";
				break;
			case "Caption":
				tableConstraints = "TableCaption";
				break;
				
			case "Stub": 
				tableConstraints = "WholeStub";
				break;
				
			case "Super-row": 
				tableConstraints = "WholeSuperRow";
				break;
				
			case "Header": 
				tableConstraints = "WholeHeader";
			break;
			
			case "Footer": 
				tableConstraints = "TableFooter";
			break;

		}
		
		return tableConstraints;
	}
	
	/**
	 * generate the query from the user options of cell constraints 
	 * 
	 * this query is simpler than the previous query (table query)
	 * get the result of table query and execute the cell query on it
	 * 
	 * when the logic is And,
	 * just add the constraints in where statement
	 * when the logic is Or
	 * just add the constraints in where statement
	 * 
	 */
	public String processCellConstriants(){
		
		String where = "WHERE ";
		String tmpQuery = processTableConstriants();
		
		tmpQuery = "SELECT distinct PMCID, TableOrder, RowN, ColumnN, WholeHeader, WholeStub, WholeSuperRow, Content  " +
					" FROM ( " +
						"SELECT * FROM ( " + tmpQuery ;
		tmpQuery +=  
										") AS T " +
						" NATURAL LEFT JOIN clinicTable " +
						") as T1 ";		
		
		if (queryItem.getCellList().size() == 0 ) return tmpQuery;
		
		String tmpConstraints ="";
		
		for( int i = 0; i < queryItem.getCellList().size();++i){
			
			tmpConstraints += basicCellConstraints(basicCellConstraintsField(queryItem.getCellList().get(i)), 
					queryItem.getCellList().get(i));
			
			// AND and OR have the same precedence
			if (i > 0){
				tmpConstraints += " ) ";
				where += " ( ";
			}
			
			switch(queryItem.getCellList().get(i).getLogic()){
				case "And": tmpConstraints += "AND ";break;
				case "Or": tmpConstraints += "OR ";break;
					
			}
		}
		tmpQuery += where + tmpConstraints;
		
		System.out.println("Cell queries: " +tmpQuery);
		
		return tmpQuery;
		
	}
	
	/**
	 * generate the one simple query of cell constraints
	 * @param field
	 * @param where
	 * @param queryItemCell
	 * @return
	 */
	private String basicCellConstraints(String field, QueryItemCell queryItemCell){
		String cellConstraints ="";
		switch(queryItemCell.getOperations()){
		
			case "Contains": cellConstraints = field + " REGEXP \".*[^0-9.]" +
				queryItemCell.getConstraintValue() + "[^0-9.].*\" "; 
			break;
			
			case "Greater": 
				cellConstraints =  field +" > " + 
				queryItemCell.getConstraintValue()  + " ";
			break;
			
			case "Smaller": 
				cellConstraints =  field + " < " + 
				queryItemCell.getConstraintValue()  + " ";
			break;

			case "Type": 
				cellConstraints =  "CellType = " + "\"" +
				queryItemCell.getConstraintValue() + "\" ";;
			break;
				
		}
		return cellConstraints;
	}
	
	private String basicCellConstraintsField(QueryItemCell queryItemCell){
		String cellConstraints = "";
		switch(queryItemCell.getField()){
			case "Cell": cellConstraints = "Content";
				break;
			case "Caption":
				cellConstraints = "TableCaption";
			break;
			case "Stub": 
				cellConstraints  = "WholeStub";
			break;
			case "Super-row": 
				cellConstraints  = "WholeSuperRow";
			break;
			case "Header": 
				cellConstraints = "WholeHeader";
			break;
			case "Footer": 
				cellConstraints = "TableFooter";
			break;
			
			case "Row": cellConstraints = "RowContent"; break;
			case "Column": cellConstraints = "ColumnContent"; break;
		}
		return cellConstraints;
	}
	
	public void generator(){

		switch(queryItem.getSelect()){
			case "Table": 
				query = processTableConstriants();
		
				break;
				
			case "Cell": 
				query = processCellConstriants();

				break;
				
			case "CountTable": 

				query += "SELECT count(*)  FROM ( " +
						processTableConstriants()+
						") AS T";
				
				break;
			case "CountCell":
				query += "SELECT count(*)  FROM ( " +
						processCellConstriants()+
						") AS T";
				
				break;
			default: System.out.println("Error input"); break;
		}	
		query += ";";
		
		
	}	
	
	public String getQuery(){
		return this.query;
	}
	

}
