package com.Init.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Init.domain.EduListVO;
import com.Init.service.EduService;

@Controller
@RequestMapping(value = "edu/*")
public class EduController {
	
	@Autowired
	private EduService eService;
	@Autowired
	private ServletContext servletContext;
	
	private static final Logger logger = LoggerFactory.getLogger(EduController.class);
	
	// 교육 관리 페이지 이동
	@GetMapping(value = "eduManage")
	public String eduManage(Model model) {
		
		// 현재 관리중인 교육내역 가져오기
		List<EduListVO> eduListInfo = eService.getEduList();
		model.addAttribute("eduListInfo", eduListInfo);
		
		return "edu/eduManage";
	}
	
	// 교육 생성 페이지 이동
	@GetMapping(value = "eduCreate")
	public String eduCreateGET() {
		
		return "edu/eduCreate";
	}
	
	// 교육 생성완료 후 저장하기 버튼 눌렀을때
	@PostMapping(value = "eduCreate")
	public String eduCreatePOST(EduListVO vo) {
		logger.debug("eduCreatePOST(EduListVO vo) 호출");
		MultipartFile file = vo.getEdu_thumbnail();
		String uploadDir = servletContext.getRealPath("/uploads/");
		logger.debug(uploadDir);
		
		try {
            // 경로가 없으면 디렉터리 생성
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
            File uploadFile = new File(uploadDir + uniqueFileName);

            // edu_id 설정
            LocalDate today = LocalDate.now();
            int year = today.getYear();
            String edu_id = "edu" +year+"00001";
            
            // 올해 첫 교육번호가 있는지 확인하기
            String checkEduId = eService.checkEduId(edu_id);
            
            if(checkEduId != null) {
            	//있으면 edu_id를 가장 최근 id에서 +1
            	String getEduId = eService.getEduId();
            	edu_id = "edu"+(Integer.parseInt(getEduId.substring(3))+1);
            }
            vo.setEdu_id(edu_id);
            logger.debug(edu_id);
            
            String edu_thumbnail_src = "/uploads/" + uniqueFileName;
            vo.setEdu_thumbnail_src(edu_thumbnail_src);
            // 파일 저장
            file.transferTo(uploadFile);

        } catch (IOException e) {
            e.printStackTrace();
        }
		
		// 교육 정보 저장
		eService.saveEduInfo(vo);
		
		return "redirect:/edu/eduManage";
	}
	
	// 교육명 클릭시 뷰페이지 이동
	@GetMapping(value = "eduView")
	public String eduView(@RequestParam("edu_id") String edu_id, Model model) {
		
		// edu_id로 교육정보 가져오기
		EduListVO eduInfo = eService.getEduListToId(edu_id);
		model.addAttribute("eduInfo", eduInfo);
		
		return "edu/eduView";
	}
	
	// 교육정보 수정
	@PostMapping(value = "eduUpdate")
	public String updateEdu(EduListVO vo) {
		logger.debug("updateEdu(EduListVO vo) 실행");
		logger.debug(vo.toString());
		if(vo.getEdu_thumbnail_src().equals("")) {
			// 새로운 src 만들어서 저장
			MultipartFile file = vo.getEdu_thumbnail();
			String uploadDir = servletContext.getRealPath("/uploads/");
			try {
	            File dir = new File(uploadDir);
	            if (!dir.exists()) {
	                dir.mkdirs();
	            }
	            String uniqueFileName = UUID.randomUUID() + "_" + file.getOriginalFilename();
	            File uploadFile = new File(uploadDir + uniqueFileName);
	            String edu_thumbnail_src = "/uploads/" + uniqueFileName;
	            vo.setEdu_thumbnail_src(edu_thumbnail_src);
	            // 파일 저장
	            file.transferTo(uploadFile);
	            // 업데이트 서비스 실행
	            eService.updateEudInfo(vo);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		} else {
			// 그대로 저장
			eService.updateEudInfo(vo);
		}
		return "redirect:/edu/eduView?edu_id="+vo.getEdu_id();
	}
	
	
	// 교육신청하기 페이지 이동
	@GetMapping(value = "eduApply")
	public String eduView(Model model) {
		logger.debug("eduView() 호출");
		
		// 교육신청하기 페이지 이동 시 신청가능한 교육 보여주기
		List<EduListVO> eduApplyInfo = eService.getEduApplyInfo();
		model.addAttribute("eduApplyInfo", eduApplyInfo);
		
		return "edu/eduApply";
	}
	
	// 교육신청하기 페이지에서 상세페이지 호출
	@GetMapping(value = "eduDetail")
	public String eduDetail(@RequestParam("edu_id") String edu_id, Model model) {
		logger.debug("eduDetail() 호출");
		logger.debug(edu_id);
		
		// edu_id로 교육정보 가져오기
		EduListVO eduInfo = eService.getEduListToId(edu_id);
		model.addAttribute("eduInfo", eduInfo);
		
		return "edu/eduDetail";
	}
	
	// 교육신청 시 교육이력테이블에 저장
	@PostMapping(value = "eduApply")
	public String eduApply(HttpSession session, EduListVO vo) {
		logger.debug(vo.toString());
		vo.setEmp_id((String)session.getAttribute("emp_id"));
		
		// 교육이력테이블에 저장
		eService.saveEduApplyInfo(vo);
		
		return "redirect:/edu/eduApply";
	}
	
	// 교육이력관리(직원용) 페이지 호출
	@GetMapping(value = "eduHisManageForEmp")
	public String eduHisManageForEmp(HttpSession session, Model model) {
		logger.debug("eduHisManageForEmp() 호출");
		String emp_id = (String)session.getAttribute("emp_id");
		
		// 해당직원 교육이력 가져오기
		List<EduListVO> eduHisInfo = eService.getEduHisInfoForEmp(emp_id);
		model.addAttribute("eduHisInfo", eduHisInfo);
		
		return "edu/eduHisManageForEmp";
	}
	
	// 교육이력관리(직원)에서 교육취소 하기
	@PostMapping(value = "cancelEduApplyInfo")
	public String cancelEduForEmp(HttpSession session, EduListVO vo) {
		logger.debug(vo.toString());
		vo.setEmp_id((String)session.getAttribute("emp_id"));
		
		eService.cancelEduApplyInfoForEmp(vo);
		
		return "redirect:/edu/eduHisManageForEmp";
	}
	
	// 교육이력관리에서 상세페이지 호출
	@GetMapping(value = "eduHisDetail")
	public String eduHisDetail(@RequestParam("edu_id") String edu_id, Model model) {
		logger.debug("eduHisDetail() 호출");
		
		// edu_id로 교육정보 가져오기
		EduListVO eduInfo = eService.getEduListToId(edu_id);
		model.addAttribute("eduInfo", eduInfo);
		
		return "edu/eduHisDetail";
	}
	
	// 교육이력관리(관리자) 페이지 호출
	@GetMapping(value = "eduHisManageForManager")
	public String eduHisManageForManager(Model model) {
		logger.debug("eduHisManageForManager() 호출");
		
		// 기본적으로 접수마감일 이후 신청완료된 건으로 나열
		List<EduListVO> eduHisListInfoBase = eService.getEduApplyInfoForManagerBase();
		model.addAttribute("eduHisListInfoBase", eduHisListInfoBase);
		
		return "edu/eduHisManageForManager";
	}
	
	// 교육이력관리(관리자)에서 정보조회하기
	@PostMapping(value = "eduInquiryForManage")
	@ResponseBody
	public List<EduListVO> eduInquiryForManage(@RequestBody List<String> eduInfoData ){
		logger.debug(eduInfoData.toString());
		String typeSelect = eduInfoData.get(0);
		// 전달된 값에 따라 조회문 분류
		List<EduListVO> eduInquiryInfo = new ArrayList<EduListVO>();
		switch (typeSelect) {
		case "edu_name":
			String edu_name = "%"+eduInfoData.get(1)+"%";
			eduInquiryInfo = eService.eduInquiryToEduName(edu_name);
			break;
		case "emp_id":
			eduInquiryInfo = eService.eduInquiryToEmpId(eduInfoData.get(1));
			break;
		case "emp_name":
			eduInquiryInfo = eService.eduInquiryToEmpName(eduInfoData.get(1));
			break;
		}
		logger.debug("eduInquiryInfo" + eduInquiryInfo);
		return eduInquiryInfo;
		}
	
	// 교육등록관리(관리자)에서 교육정보 삭제하기
	@PostMapping(value = "deleteEduInfo")
	public String deleteEduInfo(@RequestParam("edu_id")String edu_id) {
		logger.debug(edu_id);
		eService.deledteEduInfo(edu_id);
		
		return "redirect:/edu/eduManage";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}//Controller
		

