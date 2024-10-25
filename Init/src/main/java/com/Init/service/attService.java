package com.Init.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.Init.domain.attVO;

public interface attService {

	//근태일 근태테이블에 추가하기
	public void insertAtt(attVO vo);
}
