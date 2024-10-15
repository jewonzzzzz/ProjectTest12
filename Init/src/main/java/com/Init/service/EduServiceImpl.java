package com.Init.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Init.domain.EduListVO;
import com.Init.persistence.EduDAO;

@Service
public class EduServiceImpl implements EduService {

	@Autowired
	private EduDAO edao;
	
	// 올해 첫 교육번호 있는지 확인하기
	@Override
	public String checkEduId(String edu_id) {
		return edao.checkEduId(edu_id);
	}
	
	// 가장 최근의 교육번호 가져오기
	@Override
	public String getEduId() {
		return edao.getEduId();
	}
	
	
	// 교육 생성 정보 저장하기
	@Override
	public void saveEduInfo(EduListVO vo) {
		edao.saveEduInfo(vo);
	}
	
	// 교육 등록내역 가져오기
	@Override
	public List<EduListVO> getEduList() {
		return edao.getEduList();
	}
	
	// edu_id로 교육정보 가져오기
	@Override
	public EduListVO getEduListToId(String edu_id) {
		return edao.getEduListToId(edu_id);
	}
	
	// 교육정보 수정하기
	@Override
	public void updateEudInfo(EduListVO vo) {
		edao.updateEudInfo(vo);
	}
	
	
	
	
	
	
	
	
	
}
