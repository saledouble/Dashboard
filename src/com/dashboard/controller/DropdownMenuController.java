package com.dashboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dashboard.dao.TableJDBCTemplate;
import com.dashboard.model.QueryValue;
import com.dashboard.model.TableModel;

@Controller
public class DropdownMenuController {
	
	@Autowired
	TableJDBCTemplate tableJDBCTemplate;

	@RequestMapping(value="/dashboardPage",method=RequestMethod.GET)  
	public ModelAndView dashboardOptionTag(){
		return new ModelAndView("dashboard", "queryValue", new QueryValue()); 
	}
	
	@RequestMapping(value="/dashboardPage",method=RequestMethod.POST)  
	public ModelAndView dashboardOption(@ModelAttribute QueryValue queryValue){
		ModelAndView mav = new ModelAndView("dashboard"); 
		List<TableModel> tables = tableJDBCTemplate.getItems();
		
		mav.addObject("tables", tables);
		
		mav.addObject("queryValue", queryValue); 
		return mav; 
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/dashboardPage")
	public AjaxResponseBody getTableData(@RequestBody SearchCriteria search) {

		AjaxResponseBody result = new AjaxResponseBody();
		//logic
		return result;

	}
	
	
}
