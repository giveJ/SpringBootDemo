package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_qnaBoardVO;
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


public class JJ_qnaBoardServiceImpl implements JJ_qnaBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private JJ_qnaBoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private JJ_qnaReplyMapper replyMapper;
	
	
	// 페이징 처리한 전체데이터 가져오기 
	@Override
	public List<JJ_qnaBoardVO> getListWithPaging(Criteria cri, String category) {
		log.info("get List with Criteria...." + cri);
		
		return mapper.getListWithPaging(cri.getAmount(), cri.getPageNum(), category);
	}


	// 전체 데이터 갯수 가져오기
	@Override
	public int getTotalCount() {
		log.info("getTotalCount........");
		return mapper.getTotalCount();
	}
	
	// 게시물 등록
	@Transactional
	@Override
	public void insert(JJ_qnaBoardVO vo) {
		log.info("***insert serviceImpl" + vo);
		mapper.insert(vo);
	
	}


	@Override
	public JJ_qnaBoardVO read(int bno) {
		log.info("****read serviceImpl" + bno);
		return mapper.read(bno);
	}


	@Override
	public boolean update(JJ_qnaBoardVO vo) {
		log.info("****update serviceImpl" + vo);
		int result = mapper.update(vo);
		
		return result == 1? true: false;
	}

	
	
	// 게시글 삭제
	@Override
	public boolean delete(int bno) {
		log.info("****delete serviceImpl" + bno);
		
		replyMapper.deleteAll(bno);
		
		
		return mapper.delete(bno) == 1;
	}






}
