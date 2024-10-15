package com.Init.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		
		
		return "redirect:edu/eduView?edu_id="+123+"_"+456;
	}

}
