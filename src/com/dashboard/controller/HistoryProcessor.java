package com.dashboard.controller;

import com.dashboard.model.QueryItem;

public class HistoryProcessor {

	private String queryForUser = "";
	private String query;
	private String select;
	private String queryForUserCell = "";
	
	public HistoryProcessor(QueryItem queryItem, String query) {
		generateQueryForUser(queryItem);	
		
		this.query = query;
		this.select = queryItem.getSelect();
		
	}

	/**
	 * generate the insert statement
	 * @return
	 */
	public String generateInsertQuery(){
		
		String insertQuery ="INSERT INTO History VALUES ( \""+
				this.select+"\", '" + this.queryForUser +
				"', '" + this.queryForUserCell+ "', '" +this.query +"');";
		
		return insertQuery;
		
	}
	
	/**
	 * generate the constraints and show those constraints in the history table
	 * @param queryItem
	 */
	public void generateQueryForUser(QueryItem queryItem){
		
		generateQueryForUserTable(queryItem);
		generateQueryForUserCell(queryItem);
		
		deleteDefault();
		
	}
	
	/**
	 * generate the string about cell constraints and
	 * show those constraints in the history table
	 * @param queryItem
	 */
	private void generateQueryForUserCell(QueryItem queryItem){
		
		for(int i = 0; i< queryItem.getCellList().size();++i){
			
			this.queryForUserCell +=  queryItem.getCellList().get(i).getField() +
					" "+
					queryItem.getCellList().get(i).getOperations()+
					" "+
					queryItem.getCellList().get(i).getConstraintValue() +
					" "+
					queryItem.getCellList().get(i).getLogic();
					
		}
	}
	
	
	/**
	 * generate the string about table constraints and 
	 * show those constraints in the history table
	 * @param queryItem
	 */
	private void generateQueryForUserTable(QueryItem queryItem){
		
		for(int i= 0 ;i < queryItem.getTableList().size(); ++i){
			
			this.queryForUser += queryItem.getTableList().get(i).getField() +
					" "+
					queryItem.getTableList().get(i).getOperations()+
					" "+
					queryItem.getTableList().get(i).getConstraintValue()+
					" "
					+queryItem.getTableList().get(i).getLogic();				
		}
	}
	
	/**
	 * the default value is ignored when history is showed in the view
	 */
	private void deleteDefault(){
		
		this.queryForUser = queryForUser.replace("default", " ");
		this.queryForUserCell = this.queryForUserCell.replace("default", " ");
		
	}
	
}
