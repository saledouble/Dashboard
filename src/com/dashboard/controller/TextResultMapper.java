package com.dashboard.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dashboard.model.TextResultModel;

/**
 * Map the query result to the model object
 * @author Grace Tang
 *
 */
public class TextResultMapper implements RowMapper<TextResultModel> {
	   public TextResultModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		   TextResultModel table = new TextResultModel();
	      table.setTextNode(rs.getString("XML"));
	      return table;
	   }
	}
