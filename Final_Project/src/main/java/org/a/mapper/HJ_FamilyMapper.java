package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.HJ_FamilyVO;

public interface HJ_FamilyMapper {
	// 전체 목록
	public List<HJ_FamilyVO> getList();
	// 삽입
	public void insert(HJ_FamilyVO family);
	// 페이징
	public List<HJ_FamilyVO> getListWithPaging(Criteria cri);
	// 데이터 수 구하기
	public int getTotalCount(Criteria cri);
	// 데이터 하나 가져오기
	public HJ_FamilyVO read(long fno);
	// 수정
	public int update(HJ_FamilyVO vo);
	// 삭제
	public int delete(long fno);
	
}
