package com.Init.persistence;

import java.util.List;

import com.Init.domain.EduListVO;

public interface EduDAO {

	// 올해 첫 교육번호 있는지 확인하기
	public String checkEduId(String edu_id);
	
	// 가장 최근의 교육번호 가져오기
	public String getEduId();
	
	// 교육 생성 정보 저장하기
	public void saveEduInfo(EduListVO vo);
	
	// 교육 등록내역 가져오기
	public List<EduListVO> getEduList();
	
	// edu_id로 교육정보 가져오기
	public EduListVO getEduListToId(String edu_id);
	
}
