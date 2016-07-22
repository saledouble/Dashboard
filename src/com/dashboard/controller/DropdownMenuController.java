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
import com.dashboard.model.CellModel;
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
		
		mav.addObject("queryItem", queryItem); 
		
		QueryGenerator queryGenerator = new QueryGenerator(queryItem);

		///// test print
//		System.out.println("query: "+ queryGenerator.getQuery());
		
		if (!queryGenerator.getCorrectInput()){
			mav.addObject("errorInput", true);
			
		}else {
			mav.addObject("errorInput", false);
			switch(queryItem.getSelect()){
				case "Table":  
					List<TableModel> tables = tableJDBCTemplate.getItems(queryGenerator.getQuery());
					mav.addObject("tables", tables);
					break;
				
				case "Cell":
					List<CellModel> cells = tableJDBCTemplate.getCellItems(queryGenerator.getQuery());
					mav.addObject("cells", cells);
					break;
				
				case "Number":
					
					int number = tableJDBCTemplate.getCount(queryGenerator.getQuery());

//					System.out.println("number: "+ number);
					
					mav.addObject("number", number);
					break;
				
			
			}
			
		}
				
		////test print
		System.out.println();
		System.out.println("select:" + queryItem.getSelect() +"\n");
		for(int i= 0 ;i < queryItem.getTableList().size(); ++i){
		System.out.println( "field: " +queryItem.getTableList().get(i).getField()+"\n"
			+ "operations: " + queryItem.getTableList().get(i).getOperations()+"\n"
			+ "constraints: " + queryItem.getTableList().get(i).getConstraintValue()+"\n"
			+ "logic: " + queryItem.getTableList().get(i).getLogic());
		}
		
		for(int i= 0 ;i < queryItem.getCellList().size(); ++i){
		System.out.println( "Cell field: " +queryItem.getCellList().get(i).getField()+"\n"
			+ "Cell operations: " + queryItem.getCellList().get(i).getOperations()+"\n"
			+ "Cell constraints: " + queryItem.getCellList().get(i).getConstraintValue()+"\n"
			+ "Cell logic: " + queryItem.getCellList().get(i).getLogic());
		}

		
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
    
//    @RequestMapping("/download.do")
//    private ModelAndView saveTofile(@ModelAttribute QueryItem queryItem){
//    	
//    	System.out.println("download "+ queryItem.getSelect());
//    	
//    	ModelAndView mav = new ModelAndView("queryDepository");
//    	mav.addObject("queryItem",queryItem);
//    	
//    	return mav;
//    }
//	
    
    
}
