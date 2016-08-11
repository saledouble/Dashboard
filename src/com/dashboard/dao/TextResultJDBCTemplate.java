package com.dashboard.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.dashboard.mapper.TextResultMapper;
import com.dashboard.model.TextResultModel;

public class TextResultJDBCTemplate implements TextResultDAO{
	   private DataSource dataSource;
	   private JdbcTemplate jdbcTemplateObject;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	   }

	   @Override
	   public TextResultModel getItem(String pmcid) {
		   
		   String query = "select XML from clinicTextTable where PMCID = " + pmcid;
	  
		   System.out.println("query: " + query);
		   
		   TextResultModel table = jdbcTemplateObject.query(query, new TextResultMapper()).get(0);
		   return table;
	   }


	}