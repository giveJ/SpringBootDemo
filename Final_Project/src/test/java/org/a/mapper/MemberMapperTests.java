package org.a.mapper;

import org.a.domain.aVO;
import org.a.domain.MemberVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)	// 가져오려고
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")	//경로 지정해주기위해
@Log4j	//로그 찍기위해
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	
	@Test
	public void testRead() {
		MemberVO vo = mapper.read("member01");
		log.info(vo);
		
		
		for(aVO avo : vo.getAuthList()) {
			log.info(avo);
		}
	}
	
}
