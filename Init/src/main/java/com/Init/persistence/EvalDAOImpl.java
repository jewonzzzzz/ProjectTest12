package com.Init.persistence;

import java.util.List;

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
	
	// 올해 첫 평가번호가 있는지 확인하기
	@Override
	public String checkEvalId(String eval_id) {
		return sqlSession.selectOne(NAMESPACE+".checkEvalId", eval_id);
	}
	
	// 가장 최근의 eval_id 가져오기
	@Override
	public String getEvalId() {
		return sqlSession.selectOne(NAMESPACE+".getEvalId");
	}
	
	// 현재까지 평가내역 가져오기
	@Override
	public List<EvalVO> getEvalList() {
		return sqlSession.selectList(NAMESPACE+".getEvalList");
	}
	
	// 유형/연도/반기로 중복여부 확인
	@Override
	public EvalVO checkCreateEval(EvalVO vo) {
		return sqlSession.selectOne(NAMESPACE+".checkCreateEval", vo);
	}
	
	// 성과평가 리스트 삭제
	@Override
	public void deleteEvalInfo(EvalVO vo) {
		sqlSession.delete(NAMESPACE+".deleteEvalInfo", vo);
	}
	
	// 성과보고를 위한 성과평가리스트 가져오기
	@Override
	public EvalVO getEvalReportList() {
		return sqlSession.selectOne(NAMESPACE+".getEvalReportList");
	}
	
	// 성과보고 클릭 시 평가준비에서 성과보고로 변경
	@Override
	public void updateEvalInfoToReport(EvalVO vo) {
		sqlSession.update(NAMESPACE+".updateEvalInfoToReport", vo);
	}
	
	// 성과보고 페이지 업무성과 보고대상용 리스트 정보 가져오기
	@Override
	public EvalVO getEvalInfoForView(String eval_id) {
		return sqlSession.selectOne(NAMESPACE+".getEvalInfoForView", eval_id);
	}
	
	// 성과보고 내용 성과이력테이블에 저장하기
	@Override
	public void saveEvalReport(EvalVO vo) {
		sqlSession.insert(NAMESPACE+".saveEvalReport", vo);
	}
	
	// 성과보고 작성내역 확인용 가져오기
	@Override
	public EvalVO getHisEvaReport(EvalVO vo) {
		return sqlSession.selectOne(NAMESPACE+".getHisEvaReport", vo);
	}
	
	// 성과보고 내용 수정하기
	@Override
	public void updateEvalReport(EvalVO vo) {
		sqlSession.update(NAMESPACE+".updateEvalReport", vo);
	}
	
	
}
