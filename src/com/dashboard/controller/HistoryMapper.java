package com.dashboard.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dashboard.model.History;

/**
 * This class is used to map the query result to the java object
 * @author Grace Tang
 *
 */
public class HistoryMapper implements RowMapper<History> {
	   public History mapRow(ResultSet rs, int rowNum) throws SQLException {
		      History table = new History();
		      table.setQuery(rs.getString("queryString"));
		      table.setQueryToUser(rs.getString("queryForUser"));
		      table.setSelect(rs.getString("selectOption"));
		      return table;
		   }
		}