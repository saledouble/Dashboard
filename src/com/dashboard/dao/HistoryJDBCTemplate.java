package com.dashboard.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.dashboard.controller.HistoryMapper;
import com.dashboard.model.History;

public class HistoryJDBCTemplate 
				implements HistoryDAO{
	   private DataSource dataSource;
	   private JdbcTemplate jdbcTemplateObject;
	  
	   public void setDataSource(DataSource dataSource) {
		      this.dataSource = dataSource;
		      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
		   }
	   
	   /**
	    * get all histories from database and show those in the jsp page
	    */
	   @Override
	   public List<History> getItems() {

		   List<History> histories = jdbcTemplateObject.query("SELECT * FROM History;",
				   new HistoryMapper());
		   return histories;
	   }
	   
	   /**
	    * when every submit happens, a new record will be inserted into database
	    * @param query
	    */
	   public void insertRecord(String query){
		   jdbcTemplateObject.execute(query);
	   }
	   
	   /**
	    * clear all records in the tables
	    */
	   public void clear(){
		   jdbcTemplateObject.execute("Truncate History;");
	   }
	   
	   /**
	    * delete one selected history
	    * @param query
	    */
	   public void deleteRecord(String query){
		   
		   String deleteQuery = "DELETE FROM History WHERE queryString = \'"+query+"\'";
		   jdbcTemplateObject.execute(deleteQuery);
	   }
	   
}
