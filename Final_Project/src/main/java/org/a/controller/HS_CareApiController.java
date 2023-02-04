package org.a.controller;

import org.a.domain.HS_BookingVO;
import org.a.domain.HS_PstReplyVO;
import org.a.service.HS_CareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j 
@RestController
@AllArgsConstructor
@RequestMapping("/HS_care/*")
public class HS_CareApiController {
	
	@Autowired
	private HS_CareService careService;
	
//	// 후기 등록 
//	@PostMapping("careReply")
//	public String carereply(HS_PstReplyVO pvo, RedirectAttributes rttr) {
//		careService.carereply(pvo);
//		rttr.addAttribute("result", "ok");
//		return "redirect:/HS_care/careReply";
//	}
	
	// 후기 수정  
	@PostMapping("updateReply")
	@ResponseBody
	public HS_PstReplyVO updateReply(@RequestBody HS_PstReplyVO pvo, RedirectAttributes rttr) {
		careService.updateReply(pvo);
		rttr.addAttribute("result", "success"); 
		return pvo;
	}
	
//	// 후기 삭제
//	@PostMapping("deleteReply")
//	public String deleteReply(@RequestParam(value="PST_REPLYNUM") int PST_REPLYNUM,RedirectAttributes rttr) {
//		System.out.println(PST_REPLYNUM);
//		careService.deleteReply(PST_REPLYNUM);
//		rttr.addAttribute("result","success");
//		return "redirect:/HS_care/careReply";
//	}
	
//	// 돌봄서비스 접수
//	@PostMapping("careBooking")
//	public String inputBooking(HS_BookingVO bvo, RedirectAttributes rttr) {
//		log.info("inputBooking...." + bvo);
//		careService.careBooking(bvo);
//		rttr.addAttribute("result", "ok");
//		return "redirect:/HS_care/careBookingView";
//	}
	
	
	
}
