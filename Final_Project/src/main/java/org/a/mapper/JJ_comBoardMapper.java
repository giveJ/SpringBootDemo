package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_comBoardVO;
import org.a.domain.JJ_qnaBoardVO;
import org.apache.ibatis.annotations.Param;

import lombok.experimental.PackagePrivate;

public interface JJ_comBoardMapper {
	
	
	// 전체 목록 가져오기
	//public List<JJ_comBoardVO> getList();
	
	// 한 개 데이터 가져오기 read
	public JJ_comBoardVO read(int bno);
	
	
	// 데이터 삽입
	public void insert(JJ_comBoardVO vo);
		
		
	// 데이터 수정 update> 리턴 int
	public int update(JJ_comBoardVO vo);
	
		
	// 데이터 삭제 delete(long bno) >리턴 int
	public int delete(int bno);
		
	
	
	// 전체 목록 가져오기 (페이징 처리)---------------------------------------------
		public List<JJ_comBoardVO> getListWithPaging(@Param("amount") int amount, @Param("pageNum") int pageNum,
				@Param("postType") String postType);

	// 전체 목록 가져오기 (페이징 처리)----------------------------------------------
	public List<JJ_comBoardVO> getListWithPaging2(@Param("amount") int amount, @Param("pageNum") int pageNum,
			@Param("postType") String postType, @Param("animalType") String animalType);

	
	
	// 테이블 내 전체 데이터 개수 구하기
	public int getTotalCount();
	
	// 댓글 개수
	public void updateReplyCnt(@Param("bno")int bno, @Param("amount") int amount);
	
	// 게시글, 댓글 관련
	public int getBno();
	
	
	
	
}
