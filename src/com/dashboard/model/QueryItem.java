package com.dashboard.model;

import java.util.LinkedList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class QueryItem {
	
    @XmlElementWrapper(name="cell-list")
    @XmlElement(name="cell")
	private List<QueryItemCell> cellList= new LinkedList<QueryItemCell>();
    
    
    @XmlElementWrapper(name="table-list")
    @XmlElement(name="table")
	private List<QueryItemTable> tableList= new LinkedList<QueryItemTable>();
	
	private String select;
	
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
