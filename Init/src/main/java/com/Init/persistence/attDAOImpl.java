package com.Init.persistence;

import java.time.LocalDate;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Init.domain.attVO;

@Repository
public class attDAOImpl implements attDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Init.mapper.AttMapper";
	
	//근태일 근태테이블에 추가하기
	@Override
	public void insertAtt(attVO vo) {
		
		for(LocalDate attday: vo.getAttdays()) {
			vo.setCheck_in(attday+" 09:00:00");
			vo.setCheck_out(attday+" 18:00:00");
			sqlSession.insert(NAMESPACE+".insertAtt", vo);
		}
		
		
	}
}
