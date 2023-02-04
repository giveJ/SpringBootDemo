package org.a.controller;

import org.a.domain.HJ_AdoptVO;
import org.a.service.HJ_AdoptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/HJ_adopt/*")
@AllArgsConstructor		
public class HJ_AdoptController {
	
	private HJ_AdoptService service;
	
	
	@GetMapping("/HJ_adopt_list")
	public String list(HJ_AdoptVO vo, Model model) {
		
		log.info("list...");
		
		model.addAttribute("list", service.getList());
		
		return "HJ_adopt/HJ_adopt_list";
	}
	
	@PostMapping("/HJ_adopt_register")
	public String register(@ModelAttribute HJ_AdoptVO vo, RedirectAttributes rttr) {
		
		log.info(vo);
		
		service.register(vo);
		
		rttr.addFlashAttribute("result", "ok");
		
		return "redirect:/HJ_adopt/HJ_adopt_list";
	}
	
	@GetMapping("/HJ_adopt_register")
	public String register(Model model, HJ_AdoptVO vo) {
		
		model.addAttribute("vo",vo);
		
		return "HJ_adopt/HJ_adopt_register";
		
	}
	
}
