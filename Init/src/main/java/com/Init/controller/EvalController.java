package com.Init.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String evalManage(Model model) {
		
		// 현재까지 성과평과 내역 가져오기
		List<EvalVO> evalListInfo = evService.getEvalList();
		model.addAttribute("evalListInfo", evalListInfo);
		
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
		
		// eval_id 생성
        LocalDate today = LocalDate.now();
        int year = today.getYear();
        String eval_id = "eval" +year+"00001";
        
        // 올해 첫 성과평가번호가 있는지 확인하기
        String checkEvalId = evService.checkEvalId(eval_id);
        
        if(checkEvalId != null) {
        	//있으면 edu_id를 가장 최근 id에서 +1
        	String getEvalId = evService.getEvalId();
        	eval_id = "eval"+(Integer.parseInt(getEvalId.substring(4))+1);
        }
		
        vo.setEval_id(eval_id);
		evService.evalCreate(vo);
		
		return "redirect:/eval/evalManage";
	}
	
	// 성과평가 중복 생성 방지
	@PostMapping(value = "checkCreateEval")
	@ResponseBody
	public String checkCreateEval(@RequestBody EvalVO vo) {
		logger.debug(vo.toString());
		
		// 유형/연도/반기로 중복여부 확인
		EvalVO checkEvalInfo = evService.checkCreateEval(vo);
		
		if(checkEvalInfo == null) {
			return "ok";
		}
		return null;
	}
	
	// 성과평가 목록 삭제
	@PostMapping(value = "deleteEvalInfo")
	public String deleteEvalInfo(EvalVO vo) {
		logger.debug(vo.toString());
		evService.deleteEvalInfo(vo);
		return "redirect:/eval/evalManage";
	}
	
	// 성과보고 페이지 이동
	@GetMapping(value = "reportEval")
	public String reportEval(Model model) {
		
		// 성과보고를 위한 성과평가리스트 가져오기
		EvalVO evalReportInfo = evService.getEvalReportList();
		model.addAttribute("evalReportInfo", evalReportInfo);
		
		return "eval/reportEval";
	}
	
	// 성과보고 클릭 시 평가준비에서 성과보고로 변경
	@PostMapping(value = "updateEvalInfoToReport")
	public String updateEvalInfoToReport(EvalVO vo) {
		logger.debug(vo.toString());
		evService.updateEvalInfoToReport(vo);
		
		return "redirect:/eval/evalManage";
	}
	
	// 성과보고 페이지 이동
	@GetMapping(value = "evalReportView")
	public String evalReportView(@RequestParam("eval_id") String eval_id, 
			HttpSession session, Model model) {
			logger.debug(eval_id);
		// 성과리스트 정보 가져가기
		EvalVO evalReportInfo = evService.getEvalInfoForView(eval_id);
		
		// 성과 작성내역이 있으면 정보 가져와서 출력하기
		EvalVO vo = new EvalVO();
		vo.setEval_id(eval_id);
		vo.setEmp_id((String)session.getAttribute("emp_id"));
		
		EvalVO evalHisReportInfo = evService.getHisEvaReport(vo);
		if(evalHisReportInfo == null) {
			model.addAttribute("checkHisInfo", "no");
		} else {
			model.addAttribute("checkHisInfo", "yes");
		}
		
		model.addAttribute("evalReportInfo", evalReportInfo);
		model.addAttribute("evalHisReportInfo", evalHisReportInfo);
		
		return "eval/evalReportView";
	}
	
	// 성과보고 성과이력테이블에 저장하기
	@PostMapping(value = "saveEvalReport")
	public String saveEvalReport(EvalVO vo) {
		logger.debug(vo.toString());
		
		evService.saveEvalReport(vo);
		
		return "redirect:/eval/evalReportView?eval_id="+vo.getEval_id();
	}
	
	// 성과보고 내용 수정하기
	@PostMapping(value = "updateEvalReport")
	@ResponseBody
	public String updateEvalReport(@RequestBody EvalVO vo) {
		logger.debug(vo.toString());
		evService.updateEvalReport(vo);
		
		return "ok";
	}
	
	
}
