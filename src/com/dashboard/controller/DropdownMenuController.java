package com.dashboard.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dashboard.dao.HistoryJDBCTemplate;
import com.dashboard.dao.TableJDBCTemplate;
import com.dashboard.dao.TextResultJDBCTemplate;
import com.dashboard.model.CellModel;
import com.dashboard.model.History;
import com.dashboard.model.QueryItem;
import com.dashboard.model.QueryItemCell;
import com.dashboard.model.QueryItemTable;
import com.dashboard.model.TableModel;

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
	@Autowired
	HistoryJDBCTemplate historyJDBCTemplate;
	
	List<History> histories;
	
	QueryItem queryItem;
	
	String[] colorSet = {"<font color=\"#FF00FF\">", "<font color=\"#FF0000\">",
			"<font color=\"#FF8000\">","<font color=\"#00FF00\">",
			"<font color=\"#D7DF01\">","<font color=\"#088A4B\">"};
		
	@RequestMapping(value="/dashboardPage",method=RequestMethod.GET)  
	public ModelAndView dashboardOptionTag() {
		
		ModelAndView mav = new ModelAndView("dashboard");
		
		mav.addObject("queryItem", getDummyQueryItem());
		
		histories = historyJDBCTemplate.getItems();

		for(int i = 0; i < histories.size();++i){
			histories.get(i).setQuery(histories.get(i).getQuery().replace("\"", "\\\'"));
		}

		mav.addObject("histroies",histories);

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
		
		this.queryItem = queryItem;
		
		QueryGenerator queryGenerator = new QueryGenerator(queryItem);

		/**
		 * query and return the result to jsp page
		 */
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
				
				case "CountTable":
					
					int number = tableJDBCTemplate.getCount(queryGenerator.getQuery());
			
					mav.addObject("number", number);
					break;	
				case "CountCell":
					number = tableJDBCTemplate.getCount(queryGenerator.getQuery());
					
					mav.addObject("number", number);
					break;
			}
			
			/**
			 * show all histories in the view
			 */
			HistoryProcessor historyProcessor = new HistoryProcessor(queryItem,queryGenerator.getQuery());
			
			histories = historyProcess(historyProcessor);
			
			mav.getModel().put("histroies",histories);
			
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
	public String textResultProcess(@RequestParam(value = "PMCID") String pmcid,
			@RequestParam(value = "tableOrder") String tableOrder) {
		
		String textResult = textResultJDBCTemplate.getItem(pmcid).getTextNode();
		
		for (int i = 0; i < this.queryItem.getTableList().size(); ++i){
					
			if (this.queryItem.getTableList().get(i).getOperations().equals("Contains")){
				
				textResult = processStringColor(textResult,
										this.queryItem.getTableList().get(i).getField(),
										tableOrder,
										this.queryItem.getTableList().get(i).getConstraintValue());
			}
		}
		
		return textResult;

	 }
	
	private String processStringColor(String text, String field, String tableOrder, String value){

		Document doc = Jsoup.parse(text);
		Element tableNode = doc.getElementsByTag("table-wrap").select("label:contains("+tableOrder+")").get(0).parent();
		
		String pattern = "(^|[^0-9.])"+value+"([^0-9.]|$)";
		
		int index;
		
		System.out.println(tableNode);
		
		switch(field){
			case "Caption":
				Element caption = tableNode.select("p").first();
				System.out.println(caption);
				
				Document doc1 = Jsoup.parse("<p>"+
						caption.text().replaceAll(pattern,"$1" + colorSet[0]+ value + "</font>$2") +
						"</p>"
						);
				
				tableNode.select("p").get(0).replaceWith(doc1.getElementsByTag("p").get(0));
		
				break;

			case "Header": 
				
				Element header = tableNode.select("thead").first();
				Elements tds = header.select("tr td");
				
				index = 0;
				
				for (Element td : tds) {
					
					System.out.println(td.text());
					
					doc1 = Jsoup.parse("<table><tr><td align=\"center\">"+
							td.text().replaceAll(pattern,"$1" + colorSet[1]+ value + "</font>$2") +
							"</td></tr></table>"
							);
					
					tableNode.select("thead").first().select("tr td").get(index).replaceWith(doc1.getElementsByTag("td").first());

					index++; 
				}

				break;
			case "Footer": 

				Elements footers = tableNode.select("table-wrap-foot p");
				index = 0;
				for (Element footer : footers) {
					doc1 = Jsoup.parse("<p>"+
						footer.text().replaceAll(pattern,"$1" + colorSet[2]+ value + "</font>$2") +
						"</p>"
						);
				
					tableNode.select("table-wrap-foot p").get(index).replaceWith(doc1.getElementsByTag("p").first());
				}
				break;
			case "Stub":
			case "Super-row":
				Elements tbodys = tableNode.select("tbody tr td[align=left]");
				index = 0;
				for (Element tbody : tbodys) {
					doc1 = Jsoup.parse("<table><tr><td align=\"left\">"+
							tbody.text().replaceAll(pattern,"$1" + colorSet[1]+ value + "</font>$2") +
							"</td></tr></table>"
							);
				
					tableNode.select("tbody tr td[align=left]").get(index).replaceWith(doc1.getElementsByTag("td").first());
					index++;
				}
				break;
			default:
				
				tbodys = tableNode.select("tbody tr td[align=center]");
				
				index = 0;
				for (Element tbody : tbodys) {
					doc1 = Jsoup.parse("<table><tr><td align=\"center\">"+
							tbody.text().replaceAll(pattern,"$1" + colorSet[4]+ value + "</font>$2") +
							"</td></tr></table>"
							);
					
					tableNode.select("tbody tr td[align=center]").get(index).replaceWith(doc1.getElementsByTag("td").first());
					index++;
				}
				
			break;
		}
		
		//System.out.println("tableNode: "+ tableNode.html());
		return tableNode.parent().html();
	}
	
	
	/**
	 * get all histories from database
	 * and make the query can be passed through ajax
	 * @param historyProcessor
	 * @return
	 */
	private List<History> historyProcess(HistoryProcessor historyProcessor){
		String insertQuery = historyProcessor.generateInsertQuery();
		historyJDBCTemplate.insertRecord(insertQuery);
		List<History> histories = historyJDBCTemplate.getItems();
		
		for(int i = 0; i < histories.size();++i){
			histories.get(i).setQuery(histories.get(i).getQuery().replace("\"", "\\\'"));
		}
		
		return histories;
	}
	
	
	/**
	 * delete the selected record in the history table
	 * @param query
	 */
	@RequestMapping(value="/dashboardDeleteHistoryAjax",method = RequestMethod.POST)
	@ResponseBody
	public void historyDelete(@RequestParam(value = "query") String query) {
		
		historyJDBCTemplate.deleteRecord(convertQuot(query));

	 }
	
	/**
	 * convert ' to "
	 * @param query
	 * @return
	 */
	private String convertQuot(String query){
		return query.replace("\'", "\"");
	}
	
	
	/**
	 * execute the query in the record of history and 
	 * return the query result to the view
	 * @param select
	 * @param query
	 * @return
	 */
	@RequestMapping(value="/dashboardHistoryAjax",method=RequestMethod.POST)
	public ModelAndView histroryQuery(@RequestParam(value = "select") String select,
								@RequestParam(value = "query") String query) {
		
		ModelAndView mav = new ModelAndView("history"); 
		
		switch(select){
		case "Table":  
			List<TableModel> tables = tableJDBCTemplate.getItems(query);
			mav.addObject("tables", tables);
			
			break;
		
		case "Cell":
			List<CellModel> cells = tableJDBCTemplate.getCellItems(query);
			mav.addObject("cells", cells);
			break;
		
		case "CountTable":
			///test print
			System.out.println("countTable...");
			
			int number = tableJDBCTemplate.getCount(query);
	
			mav.addObject("number", number);
			break;	
		case "CountCell":
			number = tableJDBCTemplate.getCount(query);
			
			mav.addObject("number", number);
			
			break;
		}
		mav.addObject("histroies",histories);
		return mav;
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
    
    /**
     * clear all history
     * @return
     */
    @RequestMapping(value="/clearHistory",method=RequestMethod.POST)
    @ResponseBody
    private String clearHistory(){
 
    	historyJDBCTemplate.clear();
    	
    	return "success";

    }
	
    
    
}
