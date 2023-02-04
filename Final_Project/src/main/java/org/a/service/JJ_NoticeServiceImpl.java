package org.a.service;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.mapper.JJ_NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j


public class JJ_NoticeServiceImpl implements JJ_NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private JJ_NoticeMapper mapper;
	
	
	// 페이징 처리한 전체데이터 가져오기 
	@Override
	public List<JJ_NoticeVO> getListWithPaging(Criteria cri) {
		log.info("get List with Criteria...." + cri);
		return mapper.getListWithPaging(cri);
	}


	@Override
	public void insert(JJ_NoticeVO vo) {
		log.info("***insert serviceImpl" + vo);
		mapper.insert(vo);
		
	
	}


	@Override
	public JJ_NoticeVO read(int no) {
		log.info("****insert serviceImpl" + no);
		return mapper.read(no);
	}


	@Override
	public boolean update(JJ_NoticeVO vo) {
		log.info("****update serviceImpl" + vo);
		int result = mapper.update(vo);
		
		return result == 1? true: false;
	}


	@Override
	public boolean delete(int no) {
		log.info("****delete serviceImpl" + no);
		
		
		return mapper.delete(no) == 1;
	}

	// 전체 데이터 갯수 가져오기
	@Override
	public int getTotalCount() {
		log.info("getTotalCount........");
		return mapper.getTotalCount();
	}


//	@Override
//	public List<JJ_NoticeVO> getList() {
//		
//		log.info("***getList" );
//		return mapper.getList();
//	}

}
