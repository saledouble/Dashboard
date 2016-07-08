package com.dashboard.controller.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.dashboard.model.QueryValue;

public class selectDropdownMenuValidator implements Validator {

	    public boolean supports(Class<?> paramClass) {
	            return QueryValue.class.equals(paramClass);
	    }
	
		public void validate(Object obj, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "select", "valid.select");
	}
}
