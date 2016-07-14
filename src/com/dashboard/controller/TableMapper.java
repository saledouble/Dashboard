package com.dashboard.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.dashboard.model.TableModel;

public class TableMapper implements RowMapper<TableModel> {
	   public TableModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	      TableModel table = new TableModel();
	      table.setPmcid(rs.getString("PMCID"));
	      table.setTableCaption(rs.getString("TableCaption"));
	      table.setTableOrder(rs.getString("TableOrder"));
	      return table;
	   }
	}