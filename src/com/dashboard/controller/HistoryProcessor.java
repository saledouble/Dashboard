package com.dashboard.controller;

import com.dashboard.model.QueryItem;

public class HistoryProcessor {

	private String queryForUser = "";
	private String query;
	private String select;
	
	public HistoryProcessor(QueryItem queryItem, String query) {
		generateQueryForUser(queryItem);	
		
		this.query = query;
		this.select = queryItem.getSelect();
		
	}

	
	public String generateInsertQuery(){
		
		String insertQuery ="INSERT INTO History VALUES ( \""+
				this.select+"\", '" + this.queryForUser + "', '" +this.query +"');";
		
		return insertQuery;
		
	}
	
	public void generateQueryForUser(QueryItem queryItem){
		queryForUser += "<p class = \"color_4\">Table Constraints:</p>";
		for(int i= 0 ;i < queryItem.getTableList().size(); ++i){
			
			queryForUser += queryItem.getTableList().get(i).getField() +
					" "+
					queryItem.getTableList().get(i).getOperations()+
					" "+
					queryItem.getTableList().get(i).getConstraintValue()+
					" "
					+queryItem.getTableList().get(i).getLogic()+
					"<br/>";				
		}
		queryForUser += "<br/>";
		queryForUser += "<p class = \"color_4\">Cell Constraints:</p> ";
		for(int i = 0; i< queryItem.getCellList().size();++i){
			
			queryForUser +=  queryItem.getCellList().get(i).getField() +
					" "+
					queryItem.getCellList().get(i).getOperations()+
					" "+
					queryItem.getCellList().get(i).getConstraintValue() +
					" "+
					queryItem.getCellList().get(i).getLogic();
					
		}
		
		deleteDefault();
		
	}
	
	private void deleteDefault(){
		queryForUser = queryForUser.replace("default", " ");
//		System.out.println("afterReplace: "+queryForUser);
	}
	
}
