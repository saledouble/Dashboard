package com.dashboard.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dashboard.model.CellModel;


public class CellMapper implements RowMapper<CellModel> {
	   public CellModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		  CellModel cell = new CellModel();
	      cell.setPmcid(rs.getString("PMCID"));
	      cell.setTableOrder(rs.getString("TableOrder"));
	      cell.setRowN(rs.getString("RowN"));
	      cell.setColumnN(rs.getString("ColumnN"));
	      cell.setWholeHeader(rs.getString("WholeHeader"));
	      cell.setWholeStub(rs.getString("WholeStub"));
	      cell.setWholeSuperRow(rs.getString("wholeSuperRow"));
	      cell.setContent(rs.getString("Content"));
	      
	      return cell;
	   }
	}
