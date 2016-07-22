package com.dashboard.model;

import java.util.LinkedList;
import java.util.List;


public class QueryItem {	

	private List<QueryItemCell> cellList= new LinkedList<QueryItemCell>();

	private List<QueryItemTable> tableList= new LinkedList<QueryItemTable>();
	
	private String select = "default";
	
	public QueryItem(){
		
	}
	
	public QueryItem(List<QueryItemTable> tableList,List<QueryItemCell> cellList) {
		this.tableList = tableList;
		this.cellList = cellList;
	}
	
	public List<QueryItemTable> getTableList(){
		return this.tableList;
	}
	
	public void setTableList(List<QueryItemTable> tableList){
		this.tableList = tableList;
	}
	
	public List<QueryItemCell> getCellList(){
		return cellList;
	}
	
	public void setCellList(List<QueryItemCell> cellList){
		this.cellList = cellList;
	}
	
	public String getSelect(){
		return select;
	}

	public void setSelect(String select){
		this.select = select;
	}


}
