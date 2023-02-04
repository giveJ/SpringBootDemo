package org.a.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sample/*")
public class CommonController {
	
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
		return "/accessError";
		
	}
	
	@GetMapping("/customLogin")
	public String loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
		return "/customLogin";
		
	}
	
	@GetMapping("/customLogoutGet")	//post방식과 명칭이 동일하여 수정해줌(post방식과 get방식 인지하지 못하는 문제 발생하여서)
	public String logoutGET() {
		log.info("custom logout");
		return "/customLogoutGet";
	}
	
	
	
	
}
