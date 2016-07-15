package com.dashboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dashboard.dao.TableJDBCTemplate;
import com.dashboard.dao.TextResultJDBCTemplate;
import com.dashboard.model.QueryValue;
import com.dashboard.model.TableModel;
import com.dashboard.model.TextResultModel;

/**
 * The controller of the dashboard
 * 1. get the users options
 * 2. generate queries
 * 3. run queries
 * 4. return query result
 * @author Grace Tang
 *
 */
@Controller
public class DropdownMenuController {
	
	@Autowired
	TableJDBCTemplate tableJDBCTemplate;
	@Autowired
	TextResultJDBCTemplate textResultJDBCTemplate;
	
	@RequestMapping(value="/dashboardPage",method=RequestMethod.GET)  
	public ModelAndView dashboardOptionTag(){
		return new ModelAndView("dashboard", "queryValue", new QueryValue()); 
	}
	
	/**
	 * return the options and query result to the view
	 * @param queryValue
	 * @return
	 */
	@RequestMapping(value="/dashboardPage",method=RequestMethod.POST)  
	public ModelAndView dashboardOption(@ModelAttribute QueryValue queryValue){
		ModelAndView mav = new ModelAndView("dashboard"); 
		List<TableModel> tables = tableJDBCTemplate.getItems();
		
		mav.addObject("tables", tables);
		
		mav.addObject("queryValue", queryValue); 
		return mav; 
		
	}
	
	/**
	 * get the XML of the article which includes the selected table
	 * @param pmcid
	 * @param tableOrder
	 * @return
	 */
	@RequestMapping(value="/dashboardAjax",method=RequestMethod.POST)
	@ResponseBody
	public String textResultProcess(@RequestParam(value = "PMCID") String pmcid) {
		
		System.out.println(pmcid);
		
		TextResultModel textResult = textResultJDBCTemplate.getItem(pmcid);
		
//		System.out.println("textNode: "+textResult.getTextNode());

		return textResult.getTextNode();

	 }
	
	
}
