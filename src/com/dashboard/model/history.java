package com.dashboard.model;

/**
 * This class stores the history data model
 * @author Grace Tang
 *
 */
public class History {
	private String query;
	private String queryToUser;
	private String queryToUserCell;
	private String select;
	
	public void setQueryToUserCell(String queryToUserCell){
		this.queryToUserCell = queryToUserCell;
	}
	
	public String getQueryToUserCell(){
		return this.queryToUserCell;
	}
	
	public void setQuery(String query){
		this.query = query;
	}
	
	public String getQuery(){
		return query;
	}
	
	public void setQueryToUser(String queryToUser){
		this.queryToUser = queryToUser;
	}
	
	public String getQueryToUser(){
		return queryToUser;
	}
	
	public void setSelect(String select){
		this.select = select;
	}
	
	public String getSelect(){
		return select;
	}
}
