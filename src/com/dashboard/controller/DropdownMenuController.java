package com.dashboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dashboard.model.QueryValue;
import com.dashboard.model.Smartphone;

@Controller
public class DropdownMenuController {
	
	@RequestMapping(value="/hello",method=RequestMethod.GET)
	public ModelAndView hello(){
		System.out.println("1");
		return new ModelAndView("hellopage");
		//return "hellopage";
	}
	
	@RequestMapping(value="/phone-option-page",method=RequestMethod.GET)  
	public ModelAndView optionTag(){
		return new ModelAndView("phone-option-form", "smartphone", new Smartphone()); 

	}
	
//	@RequestMapping(value="/index",method=RequestMethod.POST)  
//	public ModelAndView form(){
//		return new ModelAndView("phone-option-form", "smartphone", new Smartphone()); 
//
//	}
	
	@RequestMapping(value="/dashboardPage",method=RequestMethod.GET)  
	public ModelAndView dashboardOptionTag(){
		return new ModelAndView("dashboard", "queryValue", new QueryValue()); 

	}
	
    @RequestMapping(value="/phone-result")  
    private ModelAndView processPhone(@ModelAttribute QueryValue queryValue) {  
        ModelAndView mav = new ModelAndView("phone-result");  
        mav.addObject("queryValue", queryValue);          
        return mav;  
    }  
	
}
