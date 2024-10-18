package com.Init.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Init.domain.EvalVO;
import com.Init.persistence.EvalDAO;

@Service
public class EvalServiceImpl implements EvalService{
	
	@Autowired
	private EvalDAO evdao;
	
	// 성과평가 신규등록 하기
	@Override
	public void evalCreate(EvalVO vo) {
		evdao.evalCreate(vo);
	}
}
