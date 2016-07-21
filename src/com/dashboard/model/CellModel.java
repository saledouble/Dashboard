package com.dashboard.model;

public class CellModel {
	
	private String pmcid;
	private String tableOrder;
	private String rowN;
	private String columnN;
	private String wholeHeader;
	private String wholeStub;
	private String wholeSuperRow;
	private String content;
	
	public void setPmcid(String pmcid){
		this.pmcid = pmcid;
	}
	
	public String getPmcid(){
		return pmcid;
	}
	
	public void setTableOrder(String tableOrder){
		this.tableOrder = tableOrder;
	}
	
	public String getTableOrder(){
		return this.tableOrder;
	}
	
	public void setRowN(String rowN){
		this.rowN = rowN;
	}
	
	public String getRowN(){
		return this.rowN;
	}
	
	public void setColumnN(String columnN){
		this.columnN = columnN;
	}
	
	public String getColumnN(){
		return this.columnN;
	}
	
	public void setWholeHeader(String wholeHeader){
		this.wholeHeader = wholeHeader;
	}
	
	public String getWholeHeader(){
		return this.wholeHeader;
	}
	
	public String getWholeStub(){
		return this.wholeStub;
	}
	
	public void setWholeStub(String wholeStub){
		this.wholeStub = wholeStub;
	}
	
	public String getWholeSuperRow(){
		return this.wholeSuperRow;
	}
	
	public void setWholeSuperRow(String wholeSuperRow){
		this.wholeSuperRow = wholeSuperRow;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content){
		this.content = content;
	}

}
