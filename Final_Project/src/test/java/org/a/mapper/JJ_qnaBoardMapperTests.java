package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_qnaBoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class JJ_qnaBoardMapperTests {
	
	
	@Setter(onMethod_= @Autowired)
	private JJ_qnaBoardMapper mapper;
	
	JJ_qnaBoardVO vo = new JJ_qnaBoardVO();
	
	
	// 문의사항 전체조회
//	@Test
//	public void testGetList() {
//		List<JJ_qnaBoardVO> list = mapper.getList();
//		for(JJ_qnaBoardVO vo : list) {
//			log.info(vo);
//		}
//	}
	
	
	// 문의사항 글 작성
//	@Test
//	public void testInsert() {
//		
//		vo.setTitle("용품 배송문의");
//		vo.setContent("배송 언제되나요?");
//		vo.setWriter("배송자1");
//		vo.setCategory("용품");
//		vo.setSecret(1);
//		
//		mapper.insert(vo);
//		log.info(vo);
//		
//	}
//	
	
	// 문의사항 글 보기
//	@Test
//	public void testRead() {
//		vo = mapper.read(3);
//		log.info(vo);
//	}
	
	
	// 문의사항 글 수정
//	@Test
//	public void testUpdate() {
//		
//		vo.setBno(2);
//		vo.setTitle("클래스예약문의");
//		vo.setContent("예약됐나요?");
//		vo.setWriter("작성자3");
//		vo.setCategory("클래스");
//		vo.setSecret(1);
//		
//		int count= mapper.update(vo);
//		log.info("****update count:" + count);
//	}
	
	
	
	// 문의사항 글 삭제
//	@Test
//	public void testDelete() {
//		
//		int count = mapper.delete(3);
//		log.info("delete... count...." + count);
//		
//	}

	
	
	// 페이징 처리
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setAmount(10);
//		cri.setPageNum(3);
//		List<JJ_NoticeVO> list = mapper.getListWithPaging(cri);
//		for(JJ_NoticeVO vo : list) {
//			log.info(vo);
//		}
//	}
	
	// 페이징 + 카테고리별 조회
//	@Test
//	public void testGetCategory() {
//		Criteria cri = new Criteria();
//		
//		List<JJ_qnaBoardVO> list = mapper.getCategory("가족찾기", 2, 20);
//		for(JJ_qnaBoardVO vo : list) {
//			log.info(vo);
//		}
//		
//	}
	
	
	
	
	
	
	
	
}
