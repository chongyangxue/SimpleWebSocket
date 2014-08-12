package com.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppRest{
	
	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
}
