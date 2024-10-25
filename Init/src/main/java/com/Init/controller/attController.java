package com.Init.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Init.domain.attVO;
import com.Init.service.attService;

@Controller
@RequestMapping(value = "att/*")
public class attController {
	
	@Autowired
	private attService attService;
	
	private static final Logger logger = LoggerFactory.getLogger(attController.class);
	

	@GetMapping(value = "attTest")
	public String attTestGET() {
		
		return "att/attTest";
	}
	
	@PostMapping(value = "attTest")
	public String attTestPOST(attVO vo, HttpSession session) {
		
		String emp_id = (String)session.getAttribute("emp_id");
		vo.setEmp_id(emp_id);
		logger.debug(vo.toString());
		
		// 날짜 문자열을 파싱할 포맷 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
        // LocalDate로 변환
        LocalDate startDate = LocalDate.parse(vo.getAtt_start(), formatter);
        LocalDate endDate = LocalDate.parse(vo.getAtt_end(), formatter);
		
        // 주말을 제외한 날짜 리스트 생성
        List<LocalDate> attdays = new ArrayList<LocalDate>();
        
        while (!startDate.isAfter(endDate)) {
            DayOfWeek dayOfWeek = startDate.getDayOfWeek();
            // 토요일, 일요일이 아니면 리스트에 추가
            if (dayOfWeek != DayOfWeek.SATURDAY && dayOfWeek != DayOfWeek.SUNDAY) {
            	attdays.add(startDate);
            }
            // 하루 증가
            startDate = startDate.plusDays(1);
        }
        logger.debug(attdays.toString());
        vo.setAttdays(attdays);
        
        attService.insertAtt(vo);
		
		return "att/attTest";
	}
	
	
	
	
	
}
