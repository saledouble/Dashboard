package com.dashboard.controller;

import java.util.LinkedList;
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
import com.dashboard.model.QueryItem;
import com.dashboard.model.QueryItemCell;
import com.dashboard.model.QueryItemTable;
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
	public ModelAndView dashboardOptionTag() {
		
		ModelAndView mav = new ModelAndView("dashboard");
		
		mav.addObject("queryItem", getDummyQueryItem());

		return mav; 
	}
	
	/**
	 * return the options and query result to the view
	 * @param queryItemTable
	 * @return
	 */
	@RequestMapping(value="/dashboardPage",method=RequestMethod.POST)  
	public ModelAndView dashboardOption(@ModelAttribute QueryItem queryItem){
		
		ModelAndView mav = new ModelAndView("dashboard"); 
		List<TableModel> tables = tableJDBCTemplate.getItems();
		
		mav.addObject("tables", tables);
		
		mav.addObject("queryItem", queryItem); 
		
		System.out.println("table size: "+queryItem.getTableList().size());
		
		////test
		System.out.println("select:" + queryItem.getSelect() +"\n"
			+ "field: " +queryItem.getTableList().get(0).getField()+"\n"
			+ "operations: " + queryItem.getTableList().get(0).getOperations()+"\n"
			+ "constraints: " + queryItem.getTableList().get(0).getConstraintValue()+"\n"
			+ "logic: " + queryItem.getTableList().get(0).getLogic());
		
		System.out.println("field: " +queryItem.getCellList().get(0).getField());

		
		return mav; 
		
	}
	
	
	/**
	 * get the XML of the article which includes the selected table
	 * @param pmcid
	 * @return String
	 */
	@RequestMapping(value="/dashboardAjax",method=RequestMethod.POST)
	@ResponseBody
	public String textResultProcess(@RequestParam(value = "PMCID") String pmcid) {
		
		System.out.println(pmcid);
		
		TextResultModel textResult = textResultJDBCTemplate.getItem(pmcid);

		return textResult.getTextNode();

	 }
	
	
	/**
	 * initialize the queryItem
	 * @return
	 */
    private QueryItem getDummyQueryItem() {
    	List<QueryItemCell> cellList= new LinkedList<QueryItemCell>();
    	List<QueryItemTable> tableList= new LinkedList<QueryItemTable>();
    	
      
        tableList.add( new QueryItemTable() );
        cellList.add(new QueryItemCell());

        return new QueryItem (tableList,cellList);
    }
	
	
}
