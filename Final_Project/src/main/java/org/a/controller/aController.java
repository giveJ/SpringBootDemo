package org.a.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.a.domain.aVO;
import org.a.service.aService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class aController {

	private static final Logger logger = LoggerFactory.getLogger(aController.class);
	
	@Inject
	aService service;
	
	
	// 회원가입 페이지로 이동
	@RequestMapping(value = "/aMember/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/aMember/idChk", method = RequestMethod.POST)
	public String memberIdChkPOST(String user_ID) throws Exception {
		
		int result = service.idCheck(user_ID);
		
		if(result != 0) {
			return "fail";	//중복 아이디가 존재
		}else {
			return "success"; // 중복 아이디 X
		}
	}
		
	
	
	// 회원가입 
	@RequestMapping(value = "/aMember/register", method = RequestMethod.POST)
	public String postRegister(aVO vo) throws Exception {
		logger.info("post register");
		
		
		service.register(vo);
		
		return "redirect:/";
	}
	
	
	// 로그인 페이지로 이동
	@RequestMapping(value = "/aMember/login", method = RequestMethod.GET)
	public String getLogin() throws Exception{
		logger.info("post register");
		
		return "/aMember/login";
	}
	
	
	// 로그인
	@RequestMapping(value = "/aMember/login", method = RequestMethod.POST)
	public String login(aVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		HttpSession session = req.getSession();
		aVO login = service.login(vo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/main";
	}
	
	
	
	// 로그아웃 
	@RequestMapping(value = "/aMember/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	
	
	// 마이페이지
		@RequestMapping(value = "/aMember/myPage", method = RequestMethod.GET)
		public String myPage(HttpSession session) throws Exception {

			session.invalidate();

			return "/aMember/myPage";
		}
	
	
	
	
	// 회원정보 수정 페이지로 이동
	@RequestMapping(value="/aMember/update", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		return "aMember/update";
	}
	
	
	
	
	// 회원정보 수정
	@RequestMapping(value="/aMember/update", method = RequestMethod.POST)
	public String registerUpdate(aVO vo, HttpSession session) throws Exception{
		
		service.memberUpdate(vo);
		session.invalidate();
		
		
		
		return "redirect:/";
	}
	
	
	
	// 회원 탈퇴 페이지로 이동
	@RequestMapping(value="/aMember/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView() throws Exception{
		return "aMember/memberDeleteView";
	}
	
	
	// 회원 탈퇴
	@RequestMapping(value="/aMember/delete", method = RequestMethod.POST)
	public String memberDelete(aVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		// 세션에 있는 member를 가져와 member변수에 넣기
		aVO member = (aVO) session.getAttribute("member");
		// 세션에 있는 비밀번호
		String sessionPass = member.getUser_PW();
		// vo로 들어오는 비밀번호
		String voPass = vo.getUser_PW();
		
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/aMember/memberDeleteView";
		}
		service.memberDelete(vo);
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/aMember/passChk", method = RequestMethod.POST)
	public int passChk(aVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}
	
	

}


