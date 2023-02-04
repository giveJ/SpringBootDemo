package org.a.controller;


import java.util.List;

import javax.inject.Inject;

import org.a.domain.Criteria;
import org.a.domain.JJ_qnaBoardVO;
import org.a.domain.JJ_qnaReplyVO;
import org.a.domain.PageDTO;
import org.a.service.JJ_qnaBoardService;
import org.a.service.JJ_qnaReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor


public class JJ_qnaBoardController {
	@Setter(onMethod_ = @Autowired)
	private JJ_qnaBoardService service;
	@Setter(onMethod_ = @Autowired)
	private JJ_qnaReplyService replyService;
	
	
	
	// 전체목록 가져오기 (페이징 처리 전)
//	@GetMapping("/qnaBoard/list")
//	public String list(Model model) {
//		log.info("list");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
//		model.addAttribute("list",service.getList());
//		
//		return "qnaBoard/list";
//	}
//	
	
	// 페이징
	@GetMapping("/JJ_qnaBoard/list")
	public String list(Criteria cri, Model model, String category) {
//		cri.setAmount(30);
//		cri.setPageNum(1);

		log.info("list******" + cri);
		
		
		if(category == null) {
			category = "돌봄";
		}
		
		// 전체 데이터 개수 가져오기
		int total = service.getTotalCount();
		log.info("total****" + total);
		
		model.addAttribute("list", service.getListWithPaging(cri,category));
		
		// 페이징 버튼 추가 (cri, total 토탈 고정값)
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		return "JJ_qnaBoard/list";
	}
	
	
	
	// 등록하는 페이지로 넘어가는 곳
	@GetMapping("/JJ_qnaBoard/insert")
	public String register(Model model, Criteria cri) {
		log.info("insert page");        
		model.addAttribute("cri",cri);
		return "JJ_qnaBoard/insert";
	}

	
	// 등록
	@PostMapping("/JJ_qnaBoard/insert")	//get 방식은 정보노출으로 불가
	public String register(JJ_qnaBoardVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("register ...." + vo);
		service.insert(vo);
		
		rttr.addFlashAttribute("result","ok");
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_qnaBoard/list";
	}
	
	
	// 조회 
	@GetMapping("/JJ_qnaBoard/get")
	public String get(@RequestParam("bno") int bno, Model model, Criteria cri) {
		log.info("get*****"+ bno);
		
		model.addAttribute("qnaBoard",service.read(bno));
		model.addAttribute("cri", cri);
		
		// 댓글 조회
		List<JJ_qnaReplyVO> reply = replyService.getList(bno);
		model.addAttribute("reply", reply);
		
		return "/JJ_qnaBoard/get";
	}
	

	
	
	// 수정 페이지로 이동
	@GetMapping("/JJ_qnaBoard/modify")
	public String modify(@RequestParam("bno")int bno, Model model, Criteria cri) {
		log.info("modify display****");          
		model.addAttribute("qnaBoard",service.read(bno));
		model.addAttribute("cri",cri);
		
		return "/JJ_qnaBoard/modify";
	}
	
	
	// 수정
	@PostMapping("/JJ_qnaBoard/modify")
	public String modify(JJ_qnaBoardVO vo, RedirectAttributes rttr, Criteria cri) {
		
		log.info("modify!!!!!!!!!!" + vo);
		
		if(service.update(vo)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_qnaBoard/list";
		
	}
	
	
	
	// 삭제
	@PostMapping("/JJ_qnaBoard/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr, Criteria cri) {
		log.info("remove***" + bno);
		service.delete(bno);
		
		if(service.delete(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/JJ_qnaBoard/list";
	}
	
	

}
