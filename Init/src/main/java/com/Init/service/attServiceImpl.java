package com.Init.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Init.domain.attVO;
import com.Init.persistence.attDAO;

@Service
public class attServiceImpl implements attService {

	@Autowired
	private attDAO attdao;
	
	//근태일 근태테이블에 추가하기
	@Override
	public void insertAtt(attVO vo) {
		attdao.insertAtt(vo);
	}
	
}
