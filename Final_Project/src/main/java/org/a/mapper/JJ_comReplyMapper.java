package org.a.mapper;

import java.util.List;

import org.a.domain.JJ_comReplyVO;

public interface JJ_comReplyMapper {
	

	// 댓글 삽입
	public int insert(JJ_comReplyVO vo);
	
	// 댓글 목록
	public List<JJ_comReplyVO> getList(int bno);
	
	// 댓글 읽기
	public JJ_comReplyVO read(int rno);
	
	// 댓글 삭제
	public int delete(int rno);
	
	// 댓글 수정
	public int update(JJ_comReplyVO vo);
	
	
	// 댓글있는 게시글 삭제
	public void deleteAll(int bno);
	
}
