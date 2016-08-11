package com.dashboard.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.dashboard.model.TableModel;

/**
 * This class is used to map the query result to the java object
 * @author Grace Tang
 *
 */
public class TableMapper implements RowMapper<TableModel> {
	   public TableModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	      TableModel table = new TableModel();
	      table.setPmcid(rs.getString("PMCID"));
	      table.setTableCaption(rs.getString("TableCaption"));
	      table.setTableOrder(rs.getString("TableOrder"));
	      return table;
	   }
	}