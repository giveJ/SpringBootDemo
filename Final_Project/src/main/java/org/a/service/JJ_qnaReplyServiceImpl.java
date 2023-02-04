package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_qnaBoardVO;
import org.a.domain.JJ_qnaReplyVO;
import org.a.mapper.JJ_NoticeMapper;
import org.a.mapper.JJ_qnaBoardMapper;
import org.a.mapper.JJ_qnaReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class JJ_qnaReplyServiceImpl implements JJ_qnaReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private JJ_qnaReplyMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private JJ_qnaBoardMapper boardMapper;
	
	// 댓글 등록
	@Override
	public int register(JJ_qnaReplyVO vo) {
		
		log.info("insert!!!!!!" + vo);
		
		// replycnt 컬럼 1 증가
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		
		return mapper.insert(vo);
	}
	
	// 댓글 조회
	@Override
	public List<JJ_qnaReplyVO> getList(int bno) {
		
		log.info("getList!!!!!!" + bno );
		return mapper.getList(bno);
	}
	
	// 댓글 읽기
	@Override
	public JJ_qnaReplyVO read(int rno) {
		log.info("getList!!!!!!" + rno);
		return mapper.read(rno);
	}
	
	//삭제 bno 말고 rno로 써야함
	
	// 댓글 삭제
	@Transactional
	@Override
	public int remove(int rno) {
		log.info("delete!!!!!!" + rno);
		
		
		JJ_qnaReplyVO vo = mapper.read(rno);
		
		//replycnt 1 감소
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		
		return mapper.delete(rno);
	}

	// 댓글 수정
	@Override
	public int update(JJ_qnaReplyVO vo) {
		log.info("update!!!!!!" + vo);
		return mapper.update(vo);
	}

}
