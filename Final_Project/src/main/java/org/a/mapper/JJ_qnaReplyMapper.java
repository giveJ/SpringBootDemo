package org.a.mapper;

import java.util.List;

import org.a.domain.JJ_qnaReplyVO;

public interface JJ_qnaReplyMapper {
	

	// 댓글 삽입
	public int insert(JJ_qnaReplyVO vo);
	
	// 댓글 목록
	public List<JJ_qnaReplyVO> getList(int bno);
	
	// 댓글 읽기
	public JJ_qnaReplyVO read(int rno);
	
	// 댓글 삭제
	public int delete(int bno);
	
	// 댓글 수정
	public int update(JJ_qnaReplyVO vo);
	
	// 댓글 있는 게시글 삭제
	public void deleteAll(int bno);
	
}
