package com.dashboard.model;

public class history {
	private String query;
	private String queryToUser;
	private String select;
	
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
