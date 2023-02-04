package org.a.service;

import java.util.List;


import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_comAttachVO;
import org.a.domain.JJ_comBoardVO;
import org.a.domain.JJ_qnaBoardVO;
import org.apache.ibatis.annotations.Param;

public interface JJ_comBoardService {
	
	// 전체 목록 가져오기
	//public List<JJ_comBoardVO> getList();
	
	// 한 개 데이터 가져오기 read
	public JJ_comBoardVO read(int bno);
	
	// 데이터 삽입
	public void insert(JJ_comBoardVO vo);
	
	// 데이터 수정 update> 리턴 int
	public boolean update(JJ_comBoardVO vo);
	
	// 데이터 삭제 delete(long bno) >리턴 int
	/* public boolean delete(int bno); */
	public boolean delete(@Param("bno") int bno);

		
	// 페이징 처리한 전체데이터 가져오기
	public List<JJ_comBoardVO> getListWithPaging(@Param("cri") Criteria cri,
			@Param("postType") String postType);
	
	// 페이징 처리한 전체데이터 가져오기
		public List<JJ_comBoardVO> getListWithPaging2(@Param("cri") Criteria cri,
				@Param("postType") String postType, @Param("animalType") String animalType);
	
		
		
	// 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount();

	// 첨부파일 리스트 가져오기
	public List<JJ_comAttachVO> getAttachList(int bno);
	
	
	
}
