package org.a.controller;


import java.util.List;

import org.a.domain.Criteria;
import org.a.domain.JJ_NoticeVO;
import org.a.domain.PageDTO;
import org.a.service.JJ_NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor


public class JJ_NoticeController {
	
	private JJ_NoticeService service;
	
	// 메인화면 실행
	@GetMapping("/main")
	public String main() {
		log.info("main-----------------");
		return "main";
	}
	
	
	// 전체목록 가져오기 (페이징 처리 전)
//	
//	@GetMapping("/notice/list")
//	public String list(Model model) {
//		log.info("list");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
//		model.addAttribute("list",service.getList());
//		
//		return "notice/list";
//	}
//	
	
	// 페이징
	@GetMapping("/JJ_notice/list")
	public String list(Criteria cri, Model model) {
		
//		cri.setAmount(10);
//		cri.setPageNum(1); 
		
		log.info("list******" + cri);
		
		// 전체 데이터 개수 가져오기
		int total = service.getTotalCount();
		log.info("total****" + total);
		
		model.addAttribute("list", service.getListWithPaging(cri));
		
		// 페이징 버튼 추가 (cri, total 토탈 고정값)
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		return "JJ_notice/list";
	}
	
	
	// 등록하는 페이지로 넘어가는 곳
	@GetMapping("/JJ_notice/insert")
	public String register(Model model, Criteria cri) {
		log.info("insert page");
		model.addAttribute("cri", cri);
		return "JJ_notice/insert";
	}

	
	// 등록
	@PostMapping("/JJ_notice/insert")	//get 방식은 정보노출으로 불가
	public String register(JJ_NoticeVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("register ...." + vo);
		service.insert(vo);
		
		rttr.addFlashAttribute("result","ok");
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_notice/list";
	}
	
	
	// 조회
	@GetMapping("/JJ_notice/get")
	public String get(@RequestParam("no") int no, Model model, Criteria cri) {
		log.info("get*****");
		
		model.addAttribute("notice",service.read(no));
		model.addAttribute("cri", cri);
		
		return "/JJ_notice/get";
	}
	
	
	// 수정 페이지로 이동
	@GetMapping("/JJ_notice/modify")
	public String modify(@RequestParam("no")int no, Model model, Criteria cri) {
		log.info("modify display****");          
		model.addAttribute("notice",service.read(no));
		model.addAttribute("cri",cri);
		
		return "/JJ_notice/modify";
	}
	
	
	// 수정
	@PostMapping("/JJ_notice/modify")
	public String modify(JJ_NoticeVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("modify!!!!!!!!!!" + vo);
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_notice/list";
		
	}
	
	
	
	// 삭제
	@PostMapping("/JJ_notice/remove")
	public String remove(@RequestParam("no") int no, RedirectAttributes rttr, Criteria cri) {
		log.info("remove***" + no);
		service.delete(no);
		
		if(service.delete(no)) {
			rttr.addFlashAttribute("result","ok");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_notice/list";
	}
	
	

}
