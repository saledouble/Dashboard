package com.dashboard.model;

/**
 * This class saves the model of table
 * @author Grace Tang
 *
 */
public class TableModel {
	// When the users select table option
	// the SELECT statement in the query should be like this:
	//SELECT distinct PMCID, TableOrder, TableCaption 
	
	private String pmcid;
	private String tableOrder;
	private String tableCaption;
	
	public String getPmcid(){
		return this.pmcid;
	}
	
	public void setPmcid(String pmcid){
		this.pmcid = pmcid;
	}
	
	public String getTableOrder(){
		return this.tableOrder;
	}
	
	public void setTableOrder(String tableOrder){
		this.tableOrder = tableOrder;
	}
	
	public String getTableCaption(){
		return this.tableCaption;
	}
	
	public void setTableCaption(String tableCaption){
		this.tableCaption = tableCaption;
	}
	

}
