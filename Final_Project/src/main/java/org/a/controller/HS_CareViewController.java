package org.a.controller;

import org.a.domain.HS_BookingVO;
import org.a.domain.HS_PetsitterVO;
import org.a.domain.HS_PstReplyVO;
import org.a.service.HS_CareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j 
@Controller
@AllArgsConstructor
@RequestMapping("/HS_care/*")
public class HS_CareViewController {
	
	
	@Autowired
	private HS_CareService careService;
	
	
	// 돌봄 소개 페이지 이동
	@GetMapping("/careInfo")
	public String careinfo() {
		log.info("careinfo");
		return "HS_care/careInfo";
	}
	
	// 돌봄서비스 접수 페이지 이동
	@GetMapping("/careBooking")
	public String inputBooking() {
		log.info("carebooking");
		return "HS_care/careBooking";
	}
	
	// 돌봄서비스 접수
	@PostMapping("inputBooking")
	public String inputBooking(HS_BookingVO bvo, RedirectAttributes rttr) {
		log.info("careBooking...." + bvo);
		careService.careBooking(bvo);
		rttr.addAttribute("result", "ok");
		return "redirect:/HS_care/outputPst";
	}
	
	// 돌봄서비스 접수 페이지 이동
	@GetMapping("/careBookingView")
	public String bkView(Model model, int bk_no) {
		model.addAttribute("view",careService.bkView(bk_no));
		return "HS_care/careBookingView";
	}
	
	// 펫시터 등록 페이지 이동
	@GetMapping("/carePstView")
	public String carePstView() {
		log.info("carePstView");
		return "HS_care/carePstView";
	}
	
	// 펫시터 등록
	@PostMapping("insertPst")
	public String insertPst(HS_PetsitterVO pvo, RedirectAttributes rttr) {
		log.info("inputBooking...." + pvo);
		careService.insertPst(pvo);
		rttr.addAttribute("result", "ok");
		return "redirect:/HS_care/outputPst";
	}
	
	// 돌봄서비스 펫시터 리스트 불러오기
	@GetMapping("/outputPst")
	public String outputPst(Model model) {
		model.addAttribute("list", careService.outputPst());
		return "HS_care/careInfo";
	}
	
	// 펫시터 상세보기 이동
	@GetMapping("/viewPst")
	public String viewPst(Model model, int PST_NO) {
		model.addAttribute("pst", careService.viewPst(PST_NO));
		return "HS_care/carePstGet";
	}
	// 펫시터 수정
	@PostMapping("/updatePst")
	public String updatePst(RedirectAttributes rttr, HS_PetsitterVO pvo) {
		System.out.println(pvo);
		if(careService.updatePst(pvo)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/HS_care/outputPst";
	}
		
	// 후기 등록
	@PostMapping("careReply")
	public String carereply(HS_PstReplyVO pvo, RedirectAttributes rttr) {
		careService.carereply(pvo);
		rttr.addAttribute("result", "ok");
		return "redirect:/HS_care/careReply";
	}
	
	// 이용후기 리스트 페이지 이동
	@GetMapping("/careReply")
	public String list(Model model) {
		model.addAttribute("list", careService.outputReply());
		return "HS_care/careReply";
	}
	
	// 후기 상세보기 페이지 이동
	@GetMapping("/careReplyView")
	public String view(Model model, int PST_REPLYNUM) {
		model.addAttribute("view", careService.replyView(PST_REPLYNUM)); 
		return "HS_care/careReplyView";
	}
	
	// 후기 수정/삭제 페이지 이동
	@GetMapping("/careReplyModify")
	public String careReplyModify(Model model, int PST_REPLYNUM) {
		model.addAttribute("view",careService.replyView(PST_REPLYNUM));
		return "HS_care/careReplyModify";
	}
	// 후기 삭제 페이지 이동
	@GetMapping("/careReplyDelete")
	public String careReplyDelete(Model model, int PST_REPLYNUM) {
		model.addAttribute("view",careService.replyView(PST_REPLYNUM));
		return "HS_care/careReplyDelete";
	}

	// 후기 삭제
	@PostMapping("deleteReply")
	public String deleteReply(int PST_REPLYNUM, RedirectAttributes rttr) {
		careService.deleteReply(PST_REPLYNUM);
		rttr.addAttribute("result", "success");
		return "redirect:/HS_care/careReply";
	}
	
}
