package com.Init.persistence;

import java.util.List;

import com.Init.domain.CalSalaryFinalVO;
import com.Init.domain.CalSalaryListVO;
import com.Init.domain.MemberInfoForSalaryVO;
import com.Init.domain.SalaryBasicInfoVO;
import com.Init.domain.SalaryPositionJobVO;

public interface SalaryDAO {

	// 급여기본설정 페이지 접속 시 기본정보 출력
	public SalaryBasicInfoVO getSalaryBasicInfo();
	
	// 급여기본설정 없을 시 초기화
	public void initSalaryBasicInfo();
	
	// 급여기본설정 수정
	public void updateSalaryBasicInfo(SalaryBasicInfoVO vo);
	
	// 직급급/직무급 페이지 접속 시 기본정보 출력
	public SalaryPositionJobVO getSalaryPositionJobInfo();
	
	// 직급급/직무급 기본설정 없을 시 초기화
	public void initSalaryPositionJobInfo();
	
	// 직급급/직무급 수정
	public void updatesalaryPositionJobInfo(SalaryPositionJobVO vo);
	
	// 급여내역테이블에서 급여리스트 가져오기
	public List<CalSalaryListVO> getCalSalaryList();
	
	// 급여형태/연/월 중복작성 막기 위한 급여리스트 존재 조회
	public CalSalaryListVO checkCreateSalary(CalSalaryListVO vo);
	
	// 모달창에서 사번으로 직원정보 가져오기
	public List<MemberInfoForSalaryVO> getMemberInfoToId(String employee_id);
	
	// 이름으로 직원정보 가져오기
	public List<MemberInfoForSalaryVO> getMemberInfoToName(String employee_name);
	
	// 모달에서 검색된 직원 모달테이블로 이동(근무이력 포함해서 출력)
	public List<MemberInfoForSalaryVO> getMemberInfoForSalary(MemberInfoForSalaryVO vo);
	
	// 전체 직원정보(해당연월 근무이력) 가져오기
	public List<MemberInfoForSalaryVO> getMemberAllInfo(MemberInfoForSalaryVO vo);
	
	// 급여산출하기
	public List<CalSalaryFinalVO> calSalary(List<String> employeeIds, CalSalaryListVO vo);
	
}
