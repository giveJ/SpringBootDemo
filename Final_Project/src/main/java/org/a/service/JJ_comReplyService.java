package org.a.service;

import java.util.List;

import org.a.domain.JJ_comReplyVO;

public interface JJ_comReplyService {
	

	//댓글 삽입
	public int register(JJ_comReplyVO vo);
	
	// 댓글 목록
	public List<JJ_comReplyVO> getList(int bno);
	
	// 댓글 읽기
	public JJ_comReplyVO read(int rno);
	
	// 댓글 삭제
	public int remove(int rno);
	
	// 댓글 수정
	public int update(JJ_comReplyVO vo);
	
	
}
