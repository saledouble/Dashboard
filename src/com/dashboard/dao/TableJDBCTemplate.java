package com.dashboard.dao;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dashboard.controller.TableMapper;
import com.dashboard.model.TableModel;

public class TableJDBCTemplate implements QueryDAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   
//   private String query = "SELECT distinct PMCID, TableOrder, TableCaption FROM clinicTable ";
   
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
   public List getItems() {
	   //  String SQL = "select * from Student where id = ?";
	   String query = "SELECT distinct PMCID, TableOrder, TableCaption FROM clinicTable WHERE Content like \"%exe%\"; ";
  
	   System.out.println("query: " + query);
  
	   //  TableModel tabel = jdbcTemplateObject.queryForObject(query, new Object[]{}, new TableMapper());
	   //  return tabel;
  
	   List<TableModel> tables = jdbcTemplateObject.query(query, new TableMapper());
	   return tables;
   }


}