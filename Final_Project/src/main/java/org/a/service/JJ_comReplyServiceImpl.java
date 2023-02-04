package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_comReplyVO;
import org.a.domain.JJ_qnaBoardVO;
import org.a.domain.JJ_qnaReplyVO;
import org.a.mapper.JJ_NoticeMapper;
import org.a.mapper.JJ_comBoardMapper;
import org.a.mapper.JJ_comReplyMapper;
import org.a.mapper.JJ_qnaBoardMapper;
import org.a.mapper.JJ_qnaReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class JJ_comReplyServiceImpl implements JJ_comReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private JJ_comReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private JJ_comBoardMapper boardMapper;
	
	// 댓글 등록
	@Override
	public int register(JJ_comReplyVO vo) {
		
		log.info("insert!!!!!!" + vo);
		
		// replycnt 컬럼 1 증가
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		
		return mapper.insert(vo);
	}
	
	// 댓글 조회
	@Override
	public List<JJ_comReplyVO> getList(int bno) {
		
		log.info("getList!!!!!!" + bno );
		return mapper.getList(bno);
	}
	
	// 댓글 읽기
	@Override
	public JJ_comReplyVO read(int rno) {
		log.info("getList!!!!!!" + rno);
		return mapper.read(rno);
	}
	
	
	// 댓글 삭제
	@Transactional
	@Override
	public int remove(int rno) {
		log.info("delete!!!!!!" + rno);
		
		
		JJ_comReplyVO vo = mapper.read(rno);
		
		//replycnt 1 감소
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		
		return mapper.delete(rno);
	}

	// 댓글 수정
	@Override
	public int update(JJ_comReplyVO vo) {
		log.info("update!!!!!!" + vo);
		return mapper.update(vo);
	}

}
