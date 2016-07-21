package com.dashboard.dao;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dashboard.controller.CellMapper;
import com.dashboard.controller.TableMapper;
import com.dashboard.model.CellModel;
import com.dashboard.model.TableModel;

public class TableJDBCTemplate implements QueryDAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
  
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }

//   public void create(String name, Integer age) {
//      String SQL = "insert into Student (name, age) values (?, ?)";
//      
//      jdbcTemplateObject.update( SQL, name, age);
//      System.out.println("Created Record Name = " + name + " Age = " + age);
//      return;
//   }


   @Override
   public List getItems(String query) {

	   System.out.println("query: " + query);
  
	   List<TableModel> tables = jdbcTemplateObject.query(query, new TableMapper());
	   return tables;
   }
   
   @Override
   public List getCellItems(String query) {

	   System.out.println("query: " + query);
  
	   List<CellModel> cells = jdbcTemplateObject.query(query, new CellMapper());
	   return cells;
   }
   
   
   public int getCount(String query){
		int total = jdbcTemplateObject.queryForInt(query);
		
		return total;
   }


}