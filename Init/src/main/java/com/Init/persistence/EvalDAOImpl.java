package com.Init.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Init.domain.EvalVO;

@Repository
public class EvalDAOImpl implements EvalDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Init.mapper.EvalMapper";
	
	// 성과평가 신규등록 하기
	@Override
	public void evalCreate(EvalVO vo) {
		sqlSession.insert(NAMESPACE+".evalCreate", vo);
	}
	
	
	
	
	
	
	
	
}
