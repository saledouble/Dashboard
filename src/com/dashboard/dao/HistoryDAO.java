package com.dashboard.dao;

import java.util.List;

import javax.sql.DataSource;

import com.dashboard.model.History;

public interface HistoryDAO {
	/** 
	 * This is the method to be used to initialize
	 * database resources ie. connection.
	 */
	public void setDataSource(DataSource ds);
	
	public List<History> getItems();

	void insertRecord(String query);

	void clear();

	void deleteRecord(String query);

}
