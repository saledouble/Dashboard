package com.dashboard.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dashboard.model.QueryValue;

@Controller
@RequestMapping("/index")
public class DropdownMenuController {
	
//	@RequestMapping(value="/hello",method=RequestMethod.GET)
//	public String hello(){
//		System.out.println("1");
//		return "hellopage";
//	}
	
	@Autowired
	@Qualifier("DropdownMenuController.java")
	private Validator validator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String initForm(Model model){
		QueryValue queryValue = new QueryValue();
		model.addAttribute("queryValue", queryValue);
		initModelList(model);
		return "queryValue";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitForm(Model model, @Validated QueryValue queryValue, BindingResult result ){
		model.addAttribute("queryValue", queryValue);
		String returnVal = "hellopage";
		if(result.hasErrors()) {
			initModelList(model);
			returnVal = "index";

		}else{
			model.addAttribute("queryValue", queryValue);
		}
		return returnVal;
	}
	
	private void initModelList(Model model){
		List<String> queryList = new ArrayList<String>();
		queryList.add("Cell");
		queryList.add("Table");
		queryList.add("Number");
		model.addAttribute("queryValues", queryList);
	}
	
	
}
