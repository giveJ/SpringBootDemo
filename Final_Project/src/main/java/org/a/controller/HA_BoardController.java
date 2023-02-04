package org.a.controller;

import org.a.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller	//컨트롤러로 인식시키기
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor	//풀생성자를 통해서 사용 가능(생성자로 주입이 가능하다, 다른 곳도 마찬가지임)

public class HA_BoardController {

	/*@Setter(onMethod_ = @Autowired)
	private BoardService service;*/
	
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		/*
		log.info("list..." + cri);	//cri 잘 받아오고 있는지 찍어보기
		//log.warn("");
		//log.error("");	//문제 발생 했을 때
		
		int total = service.getTotal();
		log.info("total : " + total);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));	//PageDTO, 임의로 총게시물 123개로 설정했는데 게시글 토탈 수로 변경하기 위해 total변수 넣음
		//테이블 내 전체 데이터 개수 가져오기
		*/
		return "ha_board/list";
	}
	
	/*
	@GetMapping("/get")
	public String get(@RequestParam("bno") long bno, Model model, Criteria cri) {
		//상세페이지로 갈 때 그냥 가는게 아닌 데이터를 갖고 가야 함
		//글번호를 갖고 디비에서 하나의 데이터를 갖고 오고 그걸 저장해서 뿌리기
		log.info("/get");
		model.addAttribute("vo", service.get(bno));	//bno 값을 model에 담아 던짐
		model.addAttribute("cri", cri);	//cri 값을 model에 담아 던짐, 그럼 get에서도 cri사용가능
		return "/ha_board/get";
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
}
