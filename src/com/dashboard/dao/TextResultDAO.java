package com.dashboard.dao;

import javax.sql.DataSource;

import com.dashboard.model.TextResultModel;

public interface TextResultDAO {
	/** 
	 * This is the method to be used to initialize
	 * database resources ie. connection.
	 */
	public void setDataSource(DataSource ds);
	
	public TextResultModel getItem(String pmcid);

}
