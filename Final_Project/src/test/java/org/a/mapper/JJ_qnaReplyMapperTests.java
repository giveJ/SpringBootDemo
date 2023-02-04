package org.a.mapper;

import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.JJ_qnaBoardVO;
import org.a.domain.JJ_qnaReplyVO;
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

public class JJ_qnaReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private JJ_qnaReplyMapper mapper;

	JJ_qnaReplyVO vo = new JJ_qnaReplyVO();

	// 댓글 작성
//	@Test
//	public void testInsert() {
//
//		vo.setBno(7);
//		vo.setReply("배송은 3~7일 소요됩니다.");
//	
//		mapper.insert(vo);
//		log.info(vo);
//
//	}

	// 댓글 목록
//	@Test
//	public void testGetList() {
//		List<JJ_qnaReplyVO> list = mapper.getList(7);
//		for (JJ_qnaReplyVO vo : list) {
//			log.info(vo);
//		}
//	}

	// 댓글 읽기
//	@Test
//	public void testRead() {
//		JJ_qnaReplyVO vo = mapper.read(2);
//		log.info(vo);
//
//	}

	// 댓글 삭제
	@Test
	public void testDelete() {
		int count = mapper.delete(2);
		log.info("delete count : " + count);
	}

	// 댓글 수정
//		@Test
//		public void testUpdate() {
//			vo.setReply("답변 드립니다.");
//			vo.setRno(1);
//			
//			int count = mapper.update(vo);
//			log.info("update count : " + vo);
//		}

}
