package com.Init.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Init.service.EduService;

@Controller
@RequestMapping(value = "edu/*")
public class EduController {
	
	@Autowired
	private EduService eService;
	
	private static final Logger logger = LoggerFactory.getLogger(EduController.class);
	
	
	@GetMapping(value = "eduCreate")
	public String eduCreate() {
		
		return "edu/eduCreate";
	}
	
	
	
	
	
	
	

}
