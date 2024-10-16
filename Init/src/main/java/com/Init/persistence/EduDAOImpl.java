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
	
	// 교육정보 수정하기
	@Override
	public void updateEudInfo(EduListVO vo) {
		sqlsession.update(NAMESPACE+".updateEudInfo", vo);
	}
	
	// 신청가능 교육 가져오기
	@Override
	public List<EduListVO> getEduApplyInfo() {
		return sqlsession.selectList(NAMESPACE+".getEduApplyInfo");
	}
	
	// 신청완료 시 교육이력테이블에 저장하기
	@Override
	public void saveEduApplyInfo(EduListVO vo) {
		sqlsession.insert(NAMESPACE+".saveEduApplyInfo", vo);
	}
	
	// 교육이력관리(직원) 페이지 이동시 교육이력정보 가져오기
	@Override
	public List<EduListVO> getEduHisInfoForEmp(String emp_id) {
		return sqlsession.selectList(NAMESPACE+".getEduHisInfoForEmp", emp_id);
	}
	
	// 교육이력관리(직원)에서 교육 취소하기
	@Override
	public void cancelEduApplyInfoForEmp(EduListVO vo) {
		sqlsession.update(NAMESPACE+".cancelEduApplyInfoForEmp", vo);
	}
	
	// 교육이력관리(관리자) 페이지 이동 시 기본정보(신청완료건) 보여주기
	@Override
	public List<EduListVO> getEduApplyInfoForManagerBase() {
		return sqlsession.selectList(NAMESPACE+".getEduApplyInfoForManagerBase");
	}
	
	// 교육이력관리(관리자)에서 조회(교육명)
	@Override
	public List<EduListVO> eduInquiryToEduName(String edu_name) {
		return sqlsession.selectList(NAMESPACE+".eduInquiryToEduName", edu_name);
	}
	
	// 교육이력관리(관리자)에서 조회(사번)
	@Override
	public List<EduListVO> eduInquiryToEmpId(String emp_id) {
		return sqlsession.selectList(NAMESPACE+".eduInquiryToEmpId", emp_id);
	}
	
	// 교육이력관리(관리자)에서 조회(이름)
	@Override
	public List<EduListVO> eduInquiryToEmpName(String emp_name) {
		return sqlsession.selectList(NAMESPACE+".eduInquiryToEmpName", emp_name);
	}
	
	// 교육등록관리에서 교육정보 삭제
	@Override
	public void deledteEduInfo(String edu_id) {
		sqlsession.delete(NAMESPACE+".deledteEduInfo", edu_id);
	}
	
	
	
	
	
	
	
}
