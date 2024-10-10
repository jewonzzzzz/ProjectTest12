package com.Init.controller;

import java.util.List;
import java.util.Map;

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

import com.Init.domain.CalSalaryFinalVO;
import com.Init.domain.CalSalaryListVO;
import com.Init.domain.MemberInfoForSalaryVO;
import com.Init.domain.SalaryBasicInfoVO;
import com.Init.domain.SalaryPositionJobVO;
import com.Init.service.SalaryService;

@Controller
@RequestMapping(value = "salary/*")
public class SalaryController {
	
	@Autowired
	private SalaryService sService;
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryController.class);
	
	
	//http://localhost:8088/salary/salaryBasicInfo
	@GetMapping(value = "/salaryBasicInfo")
	public String salaryBasicInfoGet(Model model) {
		logger.debug("salaryBasicInfoGet(Model model) 실행");
		SalaryBasicInfoVO result = sService.getSalaryBasicInfo();
		
		if(result == null) {
			logger.debug("null임");
			sService.initSalaryBasicInfo();
			result = sService.getSalaryBasicInfo();
		}
		model.addAttribute("salaryBasicInfo", result);
		return "/salary/salaryBasicInfo";
	}
	
	// 급여기본정보 수정
	@PostMapping(value = "/salaryBasicInfo")
	public String salaryBasicInfoPost(SalaryBasicInfoVO vo ,Model model) {
		logger.debug("salaryBasicInfoPost(SalaryBasicInfoVO vo ,Model model) 실행");
		
		sService.updateSalaryBasicInfo(vo); //수정
		SalaryBasicInfoVO result = sService.getSalaryBasicInfo(); //조회
		
		model.addAttribute("salaryBasicInfo", result);
		return "/salary/salaryBasicInfo";
	}
	
	// 직급급/직무급 설정 페이지
	// http://localhost:8088/salary/salaryPositionJobInfo
	@GetMapping(value = "/salaryPositionJobInfo")
	public String salaryPositionJobInfoGet(Model model) {
		logger.debug("salaryPositionJobInfoGet(Model model) 실행");
		SalaryPositionJobVO result = sService.getSalaryPositionJobInfo();
		
		if(result == null) {
			logger.debug("null임");
			sService.initSalaryPositionJobInfo();
			result = sService.getSalaryPositionJobInfo();
		}
		
		model.addAttribute("salaryPositionJobInfo", result);
		return "/salary/salaryPositionJobInfo";
	}
	
	// 직급급/직무급 수정
	@PostMapping(value = "/salaryPositionJobInfo")
	public String salaryRankDutyInfoPost(SalaryPositionJobVO vo ,Model model) {
		logger.debug("salaryRankDutyInfoPost(SalaryPositionJobVO vo ,Model model) 실행");
		
		sService.updatesalaryPositionJobInfo(vo); //수정
		SalaryPositionJobVO result = sService.getSalaryPositionJobInfo(); //조회
		
		model.addAttribute("salaryPositionJobInfo", result);
		return "/salary/salaryPositionJobInfo";
	}
	
	// 급여산출 페이지
	// http://localhost:8088/salary/calSalary
	@GetMapping(value = "/calSalary")
	public String calSalary(Model model){
		logger.debug("calSalary(Model model) 실행");
		
		// 급여내역리스트 가져오기
		List<CalSalaryListVO> calSalaryList = sService.getCalSalaryList();
		model.addAttribute("calSalaryListInfo", calSalaryList);
	
		return "/salary/calSalary";
	}
	
	// 급여산출 페이지 Step1
	// http://localhost:8088/salary/calSalaryStep1
	@GetMapping(value = "/calSalaryStep1")
	public String calSalaryStep1(){
		logger.debug("calSalaryStep1() 실행");
		return "/salary/calSalaryStep1";
	}
	
	// 급여 중복 작성여부 체크
	// http://localhost:8088/salary/checkCreateSalary
	@PostMapping(value = "/checkCreateSalary")
	@ResponseBody
	public String checkCreateSalary(@RequestBody List<String> checkSalaryInfo){
		logger.debug("checkCreateSalary() 실행");
		logger.debug(checkSalaryInfo.toString());
		CalSalaryListVO vo = new CalSalaryListVO();
		vo.setSal_type(checkSalaryInfo.get(0));
		vo.setYear(checkSalaryInfo.get(1));
		vo.setMonth(checkSalaryInfo.get(2));
		CalSalaryListVO cvo = sService.checkCreateSalary(vo);
		if(cvo == null) { //입력정보 없으면 ok
			return "ok";
		}
		return null; //입력정보 있으면 null
	}
	
	// 급여산출 페이지 Step2
	// http://localhost:8088/salary/calSalaryStep2
	@PostMapping(value = "/calSalaryStep2")
	public String calSalaryStep2(CalSalaryListVO vo, Model model){
		logger.debug("calSalaryStep2() 호출");
		logger.debug(vo.toString());
		
		model.addAttribute("calSalaryInfo", vo);
	
		return "/salary/calSalaryStep2";
	}
	
	// 조회버튼 클릭 이후 조회 시 직원정보 가져오기(모달테이블에 추가)
	@PostMapping(value = "/getMemberInfoForModal")
	@ResponseBody
	public List<MemberInfoForSalaryVO> getMemberInfoForModal(@RequestBody String employeeInfo){
		logger.debug("getMemberInfoForModal(@RequestBody String employeeInfo) 실행");
		logger.debug("employeeInfo:" + employeeInfo);
	
	//사번으로 먼저 select
	List<MemberInfoForSalaryVO> memberInfoList = sService.getMemberInfoToId(employeeInfo);
	
	//사번으로 검색 없으면
	if(memberInfoList.size() == 0) {
		memberInfoList = sService.getMemberInfoToName(employeeInfo);
	}
	logger.debug(memberInfoList.toString());
	
		return memberInfoList;
	}
	
	// 모달테이블에서 조회된 사원정보 본 테이블로 이동하기
	// http://localhost:8088/salary/transModalToTable
	@PostMapping(value = "/transModalToTable")
	@ResponseBody
	public List<MemberInfoForSalaryVO> transModalToTable(@RequestBody Map<String, String> data){
		logger.debug(data.toString());
		
		String year = data.get("year");
		String month = data.get("month");
		String check_in_start = year + "-" + month+"-01";
		String check_in_end = year + "-" + (Integer.parseInt(month) + 1) + "-01";
		logger.debug(check_in_start);
		logger.debug(check_in_end);
		
		MemberInfoForSalaryVO vo = new MemberInfoForSalaryVO();
		vo.setEmp_id(data.get("emp_id"));
		vo.setCheck_in_start(check_in_start);
		vo.setCheck_in_end(check_in_end);
		
		return sService.getMemberInfoForSalary(vo);
	}
	
	// 급여산출 관련 전체직원정보 가져오기
	// http://localhost:8088/salary/getMemberAllInfo
	@PostMapping(value = "/getMemberAllInfo")
	@ResponseBody
	public List<MemberInfoForSalaryVO> getMemberAllInfo(@RequestBody Map<String, String> data){
		String year = data.get("year");
		String month = data.get("month");
		String check_in_start = year + "-" + month+"-01";
		String check_in_end = year + "-" + (Integer.parseInt(month) + 1) + "-01";
		logger.debug(check_in_start);
		logger.debug(check_in_end);
		
		MemberInfoForSalaryVO vo = new MemberInfoForSalaryVO();
		vo.setCheck_in_start(check_in_start);
		vo.setCheck_in_end(check_in_end);
		logger.debug(vo.toString());
		
		return sService.getMemberAllInfo(vo);
	}
	
	// 급여산출 페이지 Step3
	// http://localhost:8088/salary/calSalaryStep3
	@PostMapping(value = "/calSalaryStep3")
	public String calSalaryStep3(@RequestParam("employeeIds") List<String> employeeIds, CalSalaryListVO vo, Model model){
		logger.debug("calSalaryStep3() 호출");
		logger.debug(employeeIds.toString());
		logger.debug(vo.toString());
		
		String check_in_start = vo.getYear() + "-" + vo.getMonth()+"-01";
		String check_in_end = vo.getYear() + "-" + (Integer.parseInt(vo.getMonth()) + 1) + "-01";
		vo.setCheck_in_start(check_in_start);
		vo.setCheck_in_end(check_in_end);
		
		//급여산출 메서드
//		List<CalSalaryFinalVO> CalSalaryFinalInfo = sService.calSalary(employeeIds, vo);
//		
//		logger.debug(CalSalaryFinalInfo.toString());
//		model.addAttribute("CalSalaryFinalInfo", CalSalaryFinalInfo);
//		model.addAttribute("calSalaryInfo", vo);
		
		return "/salary/calSalaryStep3";
	}
	
	
	
	
	
	
	
	
	
	

}
