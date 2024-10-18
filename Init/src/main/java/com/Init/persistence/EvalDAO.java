package com.Init.persistence;

import com.Init.domain.EvalVO;

public interface EvalDAO {
	
	// 성과평가 신규등록 하기
	public void evalCreate(EvalVO vo);
	
	
}
