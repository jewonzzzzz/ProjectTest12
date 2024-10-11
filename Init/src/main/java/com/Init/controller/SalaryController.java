package com.Init.controller;

import java.util.List;
import java.util.Map;

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
		String check_in = year + "-" + month+"-01";
		logger.debug(check_in);
		
		MemberInfoForSalaryVO vo = new MemberInfoForSalaryVO();
		vo.setEmp_id(data.get("emp_id"));
		vo.setCheck_in(check_in);
		
		return sService.getMemberInfoForSalary(vo);
	}
	
	// 급여산출 관련 전체직원정보 가져오기
	// http://localhost:8088/salary/getMemberAllInfo
	@PostMapping(value = "/getMemberAllInfo")
	@ResponseBody
	public List<MemberInfoForSalaryVO> getMemberAllInfo(@RequestBody Map<String, String> data){
		String year = data.get("year");
		String month = data.get("month");
		String check_in = year + "-" + month+"-01";
		logger.debug(check_in);
		
		MemberInfoForSalaryVO vo = new MemberInfoForSalaryVO();
		vo.setCheck_in(check_in);
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
		
		String check_in = vo.getYear() + "-" + vo.getMonth()+"-01";
		vo.setCheck_in(check_in);
		
		//급여산출 메서드
		List<CalSalaryFinalVO> CalSalaryFinalInfo = sService.calSalary(employeeIds, vo);
		
		logger.debug(CalSalaryFinalInfo.toString());
		model.addAttribute("CalSalaryFinalInfo", CalSalaryFinalInfo);
		model.addAttribute("calSalaryInfo", vo);
		
		return "/salary/calSalaryStep3";
	}
	
	
	// 최종 급여산출내용을 테이블로 저장하기
	@PostMapping(value = "/saveSalaryInfo")
	@ResponseBody
	public String saveSalaryInfo(@RequestBody Map<String, Object> data){
		
		//전달된 데이터 저장
		logger.debug(data.toString());
		List<String> employeeIds = (List<String>)data.get("employeeIds");
		String year = (String)data.get("year");
		String month = (String)data.get("month");
		String sal_type = (String)data.get("sal_type");
		String check_in = year + "-" + month+"-01";
		
		// 전달된 정보 저장 idList, (급여유형, 연도, 월) => 객체 저장
		CalSalaryListVO vo = new CalSalaryListVO();
		vo.setSal_type(sal_type);
		vo.setYear(year);
		vo.setMonth(month);
		vo.setCheck_in(check_in);
		
		//급여산출
		List<CalSalaryFinalVO> CalSalaryFinalInfo = sService.calSalary(employeeIds, vo);
		logger.debug(CalSalaryFinalInfo.toString());
		
		// 급여내역테이블 저장
		sService.saveCalSalaryList(vo);
		//산출된 급여 급여상세내역 테이블 저장
		sService.saveCalSalaryFinal(CalSalaryFinalInfo);
		
		return "ok";
	}
	
	// 급여내역리스트에서 삭제하기
	@PostMapping(value = "/deleteSalaryInfo")
	public String deleteSalaryInfo(@RequestParam("sal_list_id") String sal_list_id){
		logger.debug("deleteSalaryList(@RequestParam(\"sal_list_id\") String sal_list_id) 실행");
		// 급여내역리스트 및 급여상세테이블 삭제하기
		sService.deleteSalaryInfo(sal_list_id);
		
		return "redirect:/salary/calSalary";
	}
	
	// 급여내역리스트에서 최종확정 하기
	@PostMapping(value = "/confirmSalaryList")
	public String confirmSalaryList(@RequestParam("sal_list_id") String sal_list_id){
		logger.debug("confirmSalaryList(@RequestParam(\"sal_list_id\") String sal_list_id) 실행");
		logger.debug(sal_list_id);
		// 급여내역리스트 상태 최종확정으로 변경
		sService.confirmSalaryList(sal_list_id);
		
		return "redirect:/salary/calSalary";
	}
	
	// 급여내역페이지에서 조회시 급여조회 페이지 이동
	// http://localhost:8088/salary/calSalaryView
	@GetMapping(value = "/calSalaryView")
	public String calSalaryView(@RequestParam("sal_list_id") String sal_list_id, Model model){
		logger.debug("calSalaryView(@RequestParam(\"sal_list_id\") String sal_list_id, Model model) 실행");
		logger.debug(sal_list_id);
		
		// 급여상세내역 가져오기
		List<CalSalaryFinalVO> calSalaryFinalInfo = sService.getCalSalaryFinalListForView(sal_list_id);
		model.addAttribute("calSalaryFinalInfo", calSalaryFinalInfo);
		
		// 기본내용가져오기(급여형태/연/월)
		CalSalaryListVO calSalaryListInfo = sService.getCalSalaryListForView(sal_list_id);
		model.addAttribute("calSalaryListInfo", calSalaryListInfo);
		
		return "/salary/calSalaryView";
	}
	
	// 급여조회(관리자) 페이지 호출
	@GetMapping(value = "salaryInquiryForManage")
	public String salaryInquiryForManage() {
		return "/salary/salaryInquiryForManage";
	}
	
	// 급여조회(관리자) 조회하기
	@PostMapping(value = "getSalaryInquiryForManage")
	@ResponseBody
	public List<CalSalaryFinalVO> getSalaryInquiryForManage(@RequestBody List<String> checkSalaryInfo) {
		logger.debug(checkSalaryInfo.toString());
		
		CalSalaryListVO vo = new CalSalaryListVO();
		vo.setYear(checkSalaryInfo.get(0));
		vo.setEmp_id(checkSalaryInfo.get(1));
		vo.setEmp_name(checkSalaryInfo.get(1));
		
		//사번으로 먼저 select
		List<CalSalaryFinalVO> calSalaryInquiryList = sService.getSalaryInquiryForManageToId(vo) ;
		
		//사번으로 검색 없으면
		if(calSalaryInquiryList.size() == 0) {
			calSalaryInquiryList = sService.getSalaryInquiryForManageToName(vo);
		}
		logger.debug(calSalaryInquiryList.toString());
		
		return calSalaryInquiryList;
	}
	
	// 급여조회 상세페이지
	@GetMapping(value = "salaryDetail")
	public String getSalaryDetail(@RequestParam("sal_final_id") int sal_final_id, Model model) {
		logger.debug(""+sal_final_id);
		
		// 해당 급여번호 급여정보 가져가기
		CalSalaryFinalVO calSalaryFinalInfo = sService.getSalaryDetail(sal_final_id);
		model.addAttribute("calSalaryFinalInfo", calSalaryFinalInfo);
		
		return "/salary/salaryDetail";
	}

	// 급여조회(관리자) 페이지 호출
		@GetMapping(value = "salaryInquiryForEmployee")
		public String salaryInquiryForEmployee(HttpSession session) {
			// 임시 사번저장(로그인으로 대체)
			session.setAttribute("emp_id", "user30");
			
			return "/salary/salaryInquiryForEmployee";
		}
	
	// 급여조회(관리자) 조회하기
	@PostMapping(value = "getSalaryInquiryForEmployee")
	@ResponseBody
	public List<CalSalaryFinalVO> getSalaryInquiryForEmployee(@RequestBody List<String> checkSalaryInfo) {
		logger.debug(checkSalaryInfo.toString());
		
		CalSalaryListVO vo = new CalSalaryListVO();
		vo.setYear(checkSalaryInfo.get(0));
		vo.setEmp_id(checkSalaryInfo.get(1));
		
		//사번으로 먼저 select
		List<CalSalaryFinalVO> calSalaryInquiryList = sService.getSalaryInquiryForManageToId(vo) ;
		
		logger.debug(calSalaryInquiryList.toString());
		
		return calSalaryInquiryList;
	}	
		
		
	
}
