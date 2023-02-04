package org.a.service;

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
public class JJ_qnaBoardServiceTests {
	@Setter(onMethod_ = @Autowired )
	private JJ_qnaBoardService service;
	JJ_qnaBoardVO vo = new JJ_qnaBoardVO();
	
	// 문의사항 작성
//	@Test
//	public void testInsert() {
//		
//		vo.setTitle("문의제목");
//		vo.setContent("문의내용");
//		vo.setWriter("문의자");
//		vo.setCategory("가족찾기");
//		vo.setSecret(1);
//		
//		service.insert(vo);
//		log.info(vo);
//	}
	
	
	// 문의사항 조회
//	@Test
//	public void testRead() {
//		log.info(service.read(2));
//	}
	
	
	// 문의사항 수정
//	@Test
//	public void testUpdate() {
//		
//		
//		vo.setTitle("제목수정");
//		vo.setContent("내용수정");
//		vo.setWriter("작성자 수정");
//		vo.setCategory("클래스");
//		vo.setSecret(0);
//		vo.setBno(5);
//		
//		boolean result = service.update(vo);
//		log.info("수정상태------:" + result);
//		
//		
//	}
	
	
	// 문의 삭제
//	@Test
//	public void testDelete() {
//		boolean result = service.delete(5);
//		log.info("삭제 : " + result);
//	}
	
	// 문의 전체조회
//	@Test
//	public void testGetList() {
//		List<JJ_qnaBoardVO> list = service.getList();
//		for(JJ_qnaBoardVO vo : list) {
//			log.info(vo);
//		
//	}
//	
	
	
	// 페이징
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setAmount(25);
//		cri.setPageNum(5);
//		List<JJ_qnaBoardVO> list = service.getListWithPaging(cri);
//		for(JJ_qnaBoardVO vo : list) {
//			log.info(vo);
//		}
//	
//	
//	
//	}
	
	
	// 카테고리 별 조회(실패)
//	@Test
//	public void testGetCategory() {
//		Criteria cri = new Criteria();
//		
//		List<JJ_qnaBoardVO> list = service.getCategory("가족찾기", 2, 20);
//		for(JJ_qnaBoardVO vo : list) {
//			log.info(vo);
//		}
	
	

	
	
	
	
	
	
}

