package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_comAttachVO;
import org.a.domain.JJ_comBoardVO;
import org.a.domain.JJ_qnaBoardVO;
import org.a.mapper.JJ_NoticeMapper;
import org.a.mapper.JJ_comAttachMapper;
import org.a.mapper.JJ_comBoardMapper;
import org.a.mapper.JJ_comReplyMapper;
import org.a.mapper.JJ_qnaBoardMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j


public class JJ_comBoardServiceImpl implements JJ_comBoardService {
	
	@Setter(onMethod_ = @Autowired)
	private JJ_comBoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private JJ_comReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private JJ_comAttachMapper attachMapper;

	
	// 페이징 처리 전 전체 데이터 가져오기
//	@Override
//	public List<JJ_comBoardVO> getList() {
//		log.info("***getList");
//		return mapper.getList();
//	}
	
	@Override
	public JJ_comBoardVO read(int bno) {
		log.info("****read serviceImpl" + bno);
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public void insert(JJ_comBoardVO vo) {
		log.info("***insert serviceImpl" + vo);
		
		// 게시글 (insert) 2번 들어가야함 : 게시글 + 첨부파일
		// 1. 게시글 등록
		mapper.insert(vo);
		
		// 2. 등록된 게시글의 bno 값을 가져온다
		int bno = mapper.getBno();
		log.info("bno -------------- : " + bno);
		
		
		// 3. tbl_attach 테이블에 데이터를 삽입한다 (반복문)
		if(vo.getAttachList() != null && vo.getAttachList().size() > 0) {
		
			for(JJ_comAttachVO vo2 : vo.getAttachList()) {
				
				vo2.setBno(bno);
				attachMapper.insert(vo2);
			
			}
		}
	}
	
	
	
	// 게시물 수정
	@Override
	public boolean update(JJ_comBoardVO vo) {
		log.info("****update serviceImpl" + vo);
		attachMapper.deleteAll(vo.getBno());
		
		boolean modifyResult = mapper.update(vo) == 1;
		if(modifyResult && vo.getAttachList() != null && vo.getAttachList().size() >0) {
			
			vo.getAttachList().forEach(attach-> {
				attach.setBno(vo.getBno());
				attachMapper.insert(attach);
			});
		}
		
		int result = mapper.update(vo);
		
		return result == 1? true: false;
	}
	
	
	// 게시물 삭제
	@Override
	public boolean delete(@Param("bno") int bno) {
		log.info("****delete serviceImpl" + bno);
		
		attachMapper.deleteAll(bno);
		replyMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}
	
	
	
	// 페이징 처리한 전체데이터 가져오기 
	@Override
	public List<JJ_comBoardVO> getListWithPaging(Criteria cri, String postType) {
		log.info("get List with Criteria...." + cri);
		
		return mapper.getListWithPaging(cri.getAmount(), cri.getPageNum(), postType);
	}
	
	
	// 페이징 처리한 전체데이터 가져오기 (동물 카테고리)
	@Override
	public List<JJ_comBoardVO> getListWithPaging2(Criteria cri, String postType, String animalType) {
		log.info("get List with Criteria...." + cri);
		
		return mapper.getListWithPaging2(cri.getAmount(), cri.getPageNum(), postType, animalType);
	}
	
	
	// 전체 데이터 갯수 가져오기
	@Override
	public int getTotalCount() {
		log.info("getTotalCount........");
		return mapper.getTotalCount();
	}
	
	
	// 첨부파일 리스트 가져오기
	@Override
	public List<JJ_comAttachVO> getAttachList(int bno) {
		log.info("getAttachList...........");
		
		return attachMapper.findByBno(bno);
	}
	
	
	


}
