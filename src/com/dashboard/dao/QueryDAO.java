package com.dashboard.dao;

import java.util.List;

import javax.sql.DataSource;

public interface QueryDAO{
	
	/** 
	 * This is the method to be used to initialize
	 * database resources ie. connection.
	 */
	public void setDataSource(DataSource ds);
	
	public List getItems(String query);

	public List getCellItems(String query);
}
