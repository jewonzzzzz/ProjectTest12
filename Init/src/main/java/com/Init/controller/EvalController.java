package com.Init.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Init.domain.EvalVO;
import com.Init.service.EvalService;

@Controller
@RequestMapping(value = "eval/*")
public class EvalController {

	@Autowired
	private EvalService evService;
	
	private static final Logger logger = LoggerFactory.getLogger(EvalController.class);
	
	
	// 성과관리 페이지 이동
	@GetMapping(value = "evalManage")
	public String evalManage() {
		
		return "eval/evalManage";
	}
	
	// 성과관리에서 신규등록 페이지 이동
	@GetMapping(value = "evalCreate")
	public String evalCreateGET() {
		
		return "eval/evalCreate";
	}
	
	// 성과관리에서 신규등록 페이지 이동
	@PostMapping(value = "evalCreate")
	public String evalCreatePOST(EvalVO vo) {
		evService.evalCreate(vo);
		
		return "redirect:/eval/evalManage";
	}
	
}
