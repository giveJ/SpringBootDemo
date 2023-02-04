package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;

public interface JJ_NoticeMapper {
	
	
	// 전체 목록 가져오기
	public List<JJ_NoticeVO> getList();

	
	// 데이터 삽입
	public void insert(JJ_NoticeVO vo);
		
		
	// 한 개 데이터 가져오기 read(long bno)
	public JJ_NoticeVO read(int no);
		
		
	// 데이터 수정 update> 리턴 int
	// title, content 변경 - 조건 no
	public int update(JJ_NoticeVO vo);
	
		
	// 데이터 삭제 delete(long bno) >리턴 int
	public int delete(int no);
		
		
	// 전체 목록 가져오기 (페이징 처리)
	public List<JJ_NoticeVO> getListWithPaging(Criteria cri);
		

	// 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount();

	
	
}