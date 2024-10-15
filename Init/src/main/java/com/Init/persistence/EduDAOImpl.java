package com.Init.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Init.domain.EduListVO;

@Repository
public class EduDAOImpl implements EduDAO{

	@Autowired
	private SqlSession sqlsession;
	
	// Mapper namespace 정보 저장
	private static final String NAMESPACE = "com.Init.mapper.EduMapper";
	
	// 올해 첫 교육번호 있는지 확인하기
	@Override
	public String checkEduId(String edu_id) {
		return sqlsession.selectOne(NAMESPACE+".checkEduId", edu_id);
	}
	
	// 가장 최근의 교육번호 가져오기
	@Override
	public String getEduId() {
		return sqlsession.selectOne(NAMESPACE+".getEduId");
	}
	
	// 교육 생성 정보 저장하기
	@Override
	public void saveEduInfo(EduListVO vo) {
		sqlsession.insert(NAMESPACE+".saveEduInfo", vo);
	}
	
	// 교육 등록내역 가져오기
	@Override
	public List<EduListVO> getEduList() {
		return sqlsession.selectList(NAMESPACE+".getEduList");
	}
	
	// edu_id로 교육정보 가져오기
	@Override
	public EduListVO getEduListToId(String edu_id) {
		return sqlsession.selectOne(NAMESPACE+".getEduListToId", edu_id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
