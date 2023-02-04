package org.a.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration	//컨트롤러 테스트하기 위함
@Log4j
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class JJ_NoticeControllerTests {
	
	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc; 	// 가짜 MVC를 이용할 수 있게끔한다
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	// 전체목록
//	@Test
//	public void testList() throws Exception{
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/notice/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap()
//				);
//		
//	}
//	
	
	// 데이터 한 개 가져오기
//	@Test
//	public void testRegister() throws Exception {
//		
//		String result = mockMvc.perform(MockMvcRequestBuilders.post("/notice/insert")
//						.param("title", "테스트 새글 제목")
//						.param("content", "테스트 새글 내용")
//						)
//						.andReturn()
//						.getModelAndView()
//						.getViewName();
//		
//		log.info(result);
//	}
//	
	
	
	// 데이터 수정
  @Test
  public void testUpdate() throws Exception{
     String result = mockMvc.perform(MockMvcRequestBuilders.post("/notice/modify")
           .param("no", "61")
           .param("title", "제목수정")
           .param("content", "내용수정"))
           .andReturn().getModelAndView().getViewName();
     
     log.info(result + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
  }

	
	
	
}
